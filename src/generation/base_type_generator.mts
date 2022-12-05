import Config from '../config.mjs';
import {
	ContextualRustType,
	OpaqueRustStruct,
	RustArray,
	RustFunction,
	RustLambda,
	RustNullableOption,
	RustPrimitive,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustTrait,
	RustType,
	RustVector
} from '../rust_types.mjs';
import * as path from 'path';
import * as fs from 'fs';
import Generator from './index.mjs';

/**
 * Generates just one individual type. Each kind has its own implementation.
 */
export abstract class BaseTypeGenerator<Type extends RustType> {

	protected config: Config;

	constructor(config: Config) {
		this.config = config;
	}

	/**
	 *
	 * @param type
	 */
	generate(type: Type) {
		const fileContents = this.generateFileContents(type);
		this.persist(type, fileContents);
	}

	/**
	 *
	 * @param type
	 */
	abstract generateFileContents(type: Type): string;

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

	protected hasFreeMethod(type: RustType): boolean {
		return this.hasMethod(type, 'free');
	}

	protected hasCloneMethod(type: RustType): boolean {
		return this.hasMethod(type, 'clone');
	}

	protected persist(type: RustType, fileContents: string) {
		const outputPath = this.outputFilePath(type);
		const outputDirectory = path.dirname(outputPath);
		fs.mkdirSync(outputDirectory, {recursive: true});
		fs.writeFileSync(outputPath, fileContents, {});
	}

	protected generateAccessor(field: ContextualRustType, containerType: RustType): string {
		if (field.type instanceof OpaqueRustStruct) {
			// this should not be exposed
			return '';
		}

		let accessorName = 'get' + Generator.snakeCaseToCamelCase(field.contextualName, true);
		if (field.contextualName.startsWith('is') && field.type instanceof RustPrimitive && field.type.swiftRawSignature === 'Bool') {
			// this is just a flag
			accessorName = Generator.snakeCaseToCamelCase(field.contextualName);
		}

		const swiftReturnType = this.getPublicTypeSignature(field.type);
		const fieldAccessor = `self.cType!.${field.contextualName}`;
		const preparedReturnValue = this.prepareRustReturnValueForSwift(field);

		return `
					${this.renderDocComment(field.documentation, 5)}
					public func ${accessorName}() -> ${swiftReturnType} {
						// return value (do some wrapping)
						let returnValue = ${preparedReturnValue.wrapperPrefix}${fieldAccessor}${preparedReturnValue.wrapperSuffix}
						
						return returnValue;
					}
		`;
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
			const swiftArgumentType = this.getPublicTypeSignature(currentArgument.type, containerType);
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

		const swiftReturnType = this.getPublicTypeSignature(method.returnValue.type, containerType);
		const returnTypeInfix = (swiftReturnType === 'Void' || swiftMethodName === 'init') ? '' : `-> ${swiftReturnType} `;

		const staticInfix = isInstanceMethod ? '' : 'class ';
		let visibility = 'public';
		if (swiftMethodName === 'free' || swiftMethodName === 'clone') {
			visibility = 'internal';
		}

		let methodDeclarationKeywords = `${visibility} ${staticInfix}func`;
		if (swiftMethodName === 'init') {
			// it's a constructor
			methodDeclarationKeywords = visibility;
		}

		const preparedReturnValue = this.prepareRustReturnValueForSwift(method.returnValue, containerType);

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

	protected standaloneMethodName(method: RustFunction, containerType: RustType): string {
		let typeNamePrefix = containerType.name;
		if (typeNamePrefix.startsWith('LDK')) {
			typeNamePrefix = typeNamePrefix.substring('LDK'.length);
		}
		return method.name.replace(typeNamePrefix + '_', '');
	}

	protected standaloneLambdaName(lambda: RustLambda, containerType: RustType): string {
		let typeNamePrefix = containerType.name;
		if (typeNamePrefix.startsWith('LDK')) {
			typeNamePrefix = typeNamePrefix.substring('LDK'.length);
		}
		return lambda.name.replace(typeNamePrefix + '_', '');
	}

	protected swiftMethodName(method: RustFunction, containerType?: RustType): string {
		let standaloneMethodName = method.name;
		if (containerType) {
			standaloneMethodName = this.standaloneMethodName(method, containerType);
			if (method.returnValue.type === containerType && !['clone', 'none'].includes(standaloneMethodName)) {
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
	protected isElidedType(type: RustType): boolean {
		if (type instanceof RustNullableOption || type instanceof RustPrimitiveWrapper || type instanceof RustVector) {
			return true;
		}
		if (type instanceof RustArray) {
			if (type.iteratee instanceof RustPrimitive) {
				return true;
			}
		}

		return false;
	}

	protected getPublicTypeSignature(type: RustType, containerType?: RustType): string {

		let isTypeMercurial = this.isElidedType(type);
		const isTypeCurrentContainerType = (type === containerType);
		if (!isTypeMercurial || isTypeCurrentContainerType) {
			// even if the type is elided, it isn't within the context of its own internals
			return this.swiftTypeName(type);
		}

		if (type instanceof RustNullableOption) {
			// this becomes a native Swift nullable that we're gonna unwrap or construct,
			// depending on the context
			const someVariantTypeName = this.getPublicTypeSignature(type.someVariant.type);
			// TODO: if outer context already implies a Nullable, find way to avoid `??`
			return someVariantTypeName + '?';
		}

		if (type instanceof RustPrimitiveWrapper) {
			if (type.dataField.type instanceof RustPrimitive) {
				if (type.dataField.isConstant && type.dataField.isAsteriskPointer) {
					if (type.name === 'LDKStr') {
						return 'String';
					} else {
						throw new Error(`Unmapped primitive wrapper with \`const *\` data field: ${type.name}`);
					}
				} else if (type.dataField.isAsteriskPointer) {
					return `[${type.dataField.type.swiftRawSignature}]`;
				}
				return type.dataField.type.swiftRawSignature;
			} else if (type.dataField.type instanceof RustArray) {
				const iteratee = type.dataField.type.iteratee as RustPrimitive;
				return `[${iteratee.swiftRawSignature}]`;
			}
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

		if (argument.type === containerType) {
			// we're passing self
			preparedArgument.accessor = 'self.cType!';
		} else {

			// these type elision helpers only apply outside the context of the very eliding type

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
						let ${preparedArgument.name} = ${this.swiftTypeName(argument.type)}(array: ${publicName})
			`;
				// figure out when it needs to be dangled
				preparedArgument.accessor = preparedArgument.name + '.cType!';
				preparedArgument.deferredCleanup += `
						${preparedArgument.name}.noOpRetain()
			`;
			}

			if (argument.type instanceof RustTrait) {
				preparedArgument.accessor = preparedArgument.name + '.activate().cType!';
			}
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

	protected prepareRustReturnValueForSwift(returnType: ContextualRustType, containerType?: RustType) {
		const preparedReturnValue: PreparedReturnValue = {
			wrapperPrefix: '',
			wrapperSuffix: ''
		};

		// TODO: add support for anchor infix and dangle()/danglingClone() suffixes
		if (returnType.type instanceof RustVector) {
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(pointer: `;
			preparedReturnValue.wrapperSuffix += `).getValue()`;
		} else if (returnType.type instanceof RustTrait) {
			preparedReturnValue.wrapperPrefix += `NativelyImplemented${this.swiftTypeName(returnType.type)}(pointer: `;
			preparedReturnValue.wrapperSuffix += `, anchor: self)`;
		} else if (returnType.type instanceof RustStruct || returnType.type instanceof RustResult || returnType.type instanceof RustTaggedValueEnum) {
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(pointer: `;
			preparedReturnValue.wrapperSuffix += `)`;
		} else if (returnType.type instanceof RustNullableOption) {
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(pointer: `;
			preparedReturnValue.wrapperSuffix += `)`;
			if (returnType.type !== containerType) {
				// it's a mercurial type, so we pass it through
				preparedReturnValue.wrapperSuffix += '.getValue()';
			}
		} else if (returnType.type instanceof RustPrimitive) {
			// nothing to do here
			return preparedReturnValue;
		} else {
			throw new Error(`Unsupported return type ${returnType.type.name} of kind ${returnType.type.constructor.name}`);
		}
		return preparedReturnValue;
	}

	protected inheritedInits(type: RustType): string {
		return `
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt
			
					internal var cType: ${type.name}?
					
					public init(pointer: ${type.name}) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}
			
					public init(pointer: ${type.name}, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		`;
	}

	protected deinitCode(type: RustType): string {
		const hasFreeMethod = this.hasFreeMethod(type);
		if (!hasFreeMethod) {
			return '';
		}

		const swiftTypeName = this.swiftTypeName(type);
		return `deinit {
						if !self.dangling {
							Bindings.print("Freeing ${swiftTypeName} \\(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ${swiftTypeName} \\(self.instanceNumber) due to dangle.")
						}
					}
		`;
	}

	protected renderDocComment(comment: string, indentationDepth: number = 0): string {
		const indentation = '\t'.repeat(indentationDepth);
		const commentPrefix = '/// ';
		return commentPrefix + comment.replaceAll('\n', '\n' + indentation + commentPrefix);
	}

	private hasMethod(type: RustType, methodName: string) {
		let methods: RustFunction[] = [];
		if (type instanceof RustStruct) {
			methods = type.methods;
		} else if (type instanceof RustTaggedValueEnum) {
			methods = type.methods;
		}
		for (const currentMethod of methods) {
			const standaloneName = this.standaloneMethodName(currentMethod, type);
			if (standaloneName === methodName) {
				return true;
			}
		}

		if (type instanceof RustTrait) {
			for (const currentLambda of type.lambdas) {
				const standaloneName = this.standaloneLambdaName(currentLambda, type);
				if (standaloneName === methodName) {
					return true;
				}
			}
		}
		return false;
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