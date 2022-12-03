import Config from '../config.mjs';
import {
	ContextualRustType,
	RustArray,
	RustFunction,
	RustNullableOption,
	RustPrimitive,
	RustStruct,
	RustType,
	RustVector
} from '../rust_types.mjs';
import * as path from 'path';
import * as fs from 'fs';
import Generator from './index.mjs';

/**
 * Generates just one individual type. Each kind has its own implementation.
 */
export abstract class BaseTypeGenerator {

	protected config: Config;

	constructor(config: Config) {
		this.config = config;
	}

	/**
	 *
	 * @param type
	 */
	generate(type: RustType) {
		const fileContents = this.generateFileContents(type);
		this.persist(type, fileContents);
	}

	/**
	 *
	 * @param type
	 */
	abstract generateFileContents(type: RustType): string;

	protected abstract outputDirectorySuffix(): string;

	protected swiftTypeName(type: RustType): string {
		if (type instanceof RustPrimitive) {
			return type.swiftRawSignature;
		}
		if (type.name.startsWith('LDK')) {
			const ldkLessTypeName = type.name.substring('LDK'.length);
			if (ldkLessTypeName.charAt(0) === 'C') {
				if (ldkLessTypeName.startsWith('C2Tuple_') || ldkLessTypeName.startsWith('C3Tuple_')) {
					return ldkLessTypeName.substring(2);
				}

				const secondCharacter = ldkLessTypeName.charAt(1);
				if (secondCharacter === secondCharacter.toUpperCase()) {
					// it's probably an LDKCVec or LDKCResult or something like that
					return ldkLessTypeName.substring(1);
				}

			}
			return ldkLessTypeName;
		}
		throw new Error('Rust type names should always start with LDK');
	}

	protected persist(type: RustType, fileContents: string) {
		const outputPath = this.outputFilePath(type);
		const outputDirectory = path.dirname(outputPath);
		fs.mkdirSync(outputDirectory, {recursive: true});
		fs.writeFileSync(outputPath, fileContents, {});
	}

	protected generateMethod(method: RustFunction, containerType?: RustType): string {

		const swiftMethodName = this.swiftMethodName(method, containerType);
		let swiftMethodArguments = [];
		let nativeCallValueAccessors = [];
		let isInstanceMethod = false;

		let nativeCallPrefix = '';
		let nativeCallWrapperPrefix = '', nativeCallWrapperSuffix = '';
		let nativeCallSuffix = '';

		for (const currentArgument of method.arguments) {
			let isInstanceArgument = false;
			if (currentArgument.type === containerType) {
				isInstanceMethod = true;
				isInstanceArgument = true;
			}

			const swiftArgumentName = Generator.snakeCaseToCamelCase(currentArgument.contextualName);
			const swiftArgumentType = this.getPublicTypeSignature(currentArgument.type);
			if (!isInstanceArgument) {
				swiftMethodArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);
			}

			const preparedArgument = this.prepareSwiftArgumentForRust(currentArgument, containerType);
			nativeCallPrefix += preparedArgument.conversion;
			nativeCallWrapperPrefix += preparedArgument.nativeCallWrapperPrefix;
			nativeCallWrapperSuffix += preparedArgument.nativeCallWrapperSuffix;
			nativeCallValueAccessors.push(preparedArgument.accessor);
			nativeCallSuffix += preparedArgument.deferredCleanup;
		}

		const swiftReturnType = this.getPublicTypeSignature(method.returnValue.type);
		const returnTypeInfix = swiftReturnType == 'Void' ? '' : `-> ${swiftReturnType} `;

		const staticInfix = isInstanceMethod ? '' : 'static ';
		let methodDeclarationKeywords = `public ${staticInfix}func`;
		if (swiftMethodName === 'init') {
			// it's a constructor
			methodDeclarationKeywords = 'public';
		}

		const preparedReturnValue = this.prepareRustReturnValueForSwift(method.returnValue);

		return `
					${this.renderDocComment(method.documentation, 5)}
					${methodDeclarationKeywords} ${swiftMethodName}(${swiftMethodArguments.join(', ')}) ${returnTypeInfix}{
						// native call variable prep
						${nativeCallPrefix}
						
						// native method call
						let nativeCallResult = ${nativeCallWrapperPrefix}${method.name}(${nativeCallValueAccessors.join(', ')})${nativeCallWrapperSuffix}
						
						// cleanup
						${nativeCallSuffix}
						
						// return value (do some wrapping)
						let returnValue = ${preparedReturnValue.wrapperPrefix}nativeCallResult${preparedReturnValue.wrapperSuffix}
						
						return returnValue;
					}
		`;
	}

	protected swiftMethodName(method: RustFunction, containerType?: RustType): string {
		let standaloneMethodName = method.name;
		if (containerType) {
			let typeNamePrefix = containerType.name;
			if (typeNamePrefix.startsWith('LDK')) {
				typeNamePrefix = typeNamePrefix.substring('LDK'.length);
			}
			standaloneMethodName = standaloneMethodName.replace(typeNamePrefix + '_', '');
			if (method.returnValue.type === containerType) {
				return 'init';
			}
			return Generator.snakeCaseToCamelCase(standaloneMethodName);
		}
		return 'swift' + Generator.snakeCaseToCamelCase(standaloneMethodName, true);
	}

	/**
	 * These are types that technically have Swift wrappers, but that are never exposed to the user
	 * @param type
	 * @protected
	 */
	protected isMercurialType(type: RustType): boolean {
		if (type instanceof RustNullableOption) {
			return true;
		}
		if (type instanceof RustArray) {
			if (type.iteratee instanceof RustPrimitive) {
				return true;
			}
		}

		if (type instanceof RustVector) {
			return true;
		}

		// TODO: add support for fixed-length arrays and LDKTransaction and stuff like that

		return false;
	}

	protected getPublicTypeSignature(type: RustType): string {
		const swiftTypeName = this.swiftTypeName(type);

		if (!this.isMercurialType(type)) {
			return this.swiftTypeName(type);
		}

		if (type instanceof RustNullableOption) {
			// this becomes a native Swift nullable that we're gonna unwrap or construct,
			// depending on the context
			const someVariantTypeName = this.getPublicTypeSignature(type.someVariant.type);
			return someVariantTypeName + '?';
		}

		if (type instanceof RustArray) {
			if (type.iteratee instanceof RustPrimitive) {
				return `[${type.iteratee.swiftRawSignature}]`;
			}
		}

		if (type instanceof RustVector) {
			const iterateeTypeName = this.getPublicTypeSignature(type.iterateeField.type);
			return `[${iterateeTypeName}]`;
		}

		throw new Error(`Unmapped mercurial type: ${type.name}`);
	}

	protected prepareSwiftArgumentForRust(argument: ContextualRustType, containerType?: RustType): PreparedArgument {
		// this is the name of the variable that the method receives
		const publicName = Generator.snakeCaseToCamelCase(argument.contextualName);
		const preparedArgument: PreparedArgument = {
			// this is the name of the variable that we end up passing to Rust
			// by default, it's unchanged
			name: publicName,

			// this is the string that we pass to the native method
			// usually, it's just the name of the variable, but can contain additional access
			accessor: publicName,

			conversion: '',

			nativeCallWrapperPrefix: '',
			nativeCallWrapperSuffix: '',

			deferredCleanup: ''
		};

		if (containerType && containerType === argument.type) {
			// we're passing self
			preparedArgument.accessor = 'self.cType!';
		}

		if (argument.type instanceof RustNullableOption) {
			preparedArgument.name += 'Option';
			preparedArgument.conversion += `
						let ${preparedArgument.name} = ${this.swiftTypeName(argument.type)}(value: ${publicName})
			`;
			preparedArgument.accessor = preparedArgument.name + '.cType!';
		}

		if (argument.type instanceof RustVector) {
			preparedArgument.name += 'Vector';
			preparedArgument.conversion += `
						let ${preparedArgument.name} = Bindings.new_${argument.type.name}Wrapper(array: ${publicName})
			`;
			// figure out when it needs to be dangled
			preparedArgument.accessor = preparedArgument.name + '.cType!';
			preparedArgument.deferredCleanup += `
						${preparedArgument.name}.noOpRetain()
			`;
		}

		if (argument.isConstant) {
			// we must wrap the native call in a withUnsafePointer component
			preparedArgument.name += 'Pointer';
			preparedArgument.nativeCallWrapperPrefix += `
						withUnsafePointer(to: ${preparedArgument.accessor}) { (${preparedArgument.name}: UnsafePointer<${argument.type.name}>) in
			`;
			preparedArgument.nativeCallWrapperSuffix += `
						}
			`;

			// the wrapper accesses the variable normally, and introduces a new variable name by which to refer to the value
			preparedArgument.accessor = preparedArgument.name;
		}

		return preparedArgument;
	}

	protected prepareRustReturnValueForSwift(returnType: ContextualRustType) {
		const preparedReturnValue: PreparedReturnValue = {
			wrapperPrefix: '',
			wrapperSuffix: ''
		};

		if (returnType.type instanceof RustVector) {
			preparedReturnValue.wrapperPrefix += `Bindings.${returnType.type.name}_to_array(nativeType: `;
			preparedReturnValue.wrapperSuffix += `)`;
		} else if (returnType.type instanceof RustStruct) {
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(pointer: `;
			preparedReturnValue.wrapperSuffix += `)`;
		}
		return preparedReturnValue;
	}

	protected renderDocComment(comment: string, indentationDepth: number = 0): string {
		const indentation = '\t'.repeat(indentationDepth);
		const commentPrefix = '/// ';
		return commentPrefix + comment.replaceAll('\n', '\n' + indentation + commentPrefix);
	}

	private outputFilePath(type: RustType): string {
		let basePath = this.config.getOutputBaseDirectoryPath();
		const fileName = this.swiftTypeName(type) + '.swift';
		const outputPath = path.join(basePath, this.outputDirectorySuffix(), fileName);
		return outputPath;
	}

}

interface PreparedArgument {
	/**
	 * This is the name of the variable that we end up passing to Rust
	 * In the simplest scenario, it's the public argument name
	 */
	name: string,

	/**
	 * This is the exact string that is passed at the native function's call site
	 * By default it's just the name of the variable, but can have complications like `.cType!`
	 */
	accessor: string,

	/**
	 * This is code that prepares the variable received from Swift to be passed to Rust
	 */
	conversion: string,

	nativeCallWrapperPrefix: string;
	nativeCallWrapperSuffix: string;

	/**
	 * This is code that is executed after the return value is constructed. Usually for either
	 * memory deallocation or, ironically, retention beyond the call site
	 */
	deferredCleanup: string
}

interface PreparedReturnValue {
	wrapperPrefix: string;
	wrapperSuffix: string;
}