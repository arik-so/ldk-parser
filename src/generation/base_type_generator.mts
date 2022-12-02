import Config from '../config.mjs';
import {RustArray, RustFunction, RustNullableOption, RustPrimitive, RustType, RustVector} from '../rust_types.mjs';
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

		let isInstanceMethod = false;
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
		}

		const swiftReturnType = this.getPublicTypeSignature(method.returnValue.type);
		const returnTypeInfix = swiftReturnType == 'Void' ? '' : `-> ${swiftReturnType} `;

		const staticInfix = isInstanceMethod ? '' : 'static ';
		let methodDeclarationKeywords = `public ${staticInfix}func`;
		if (swiftMethodName === 'init') {
			// it's a constructor
			methodDeclarationKeywords = 'public';
		}

		return `
					${methodDeclarationKeywords} ${swiftMethodName}(${swiftMethodArguments.join(', ')}) ${returnTypeInfix}{
						
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

	private outputFilePath(type: RustType): string {
		let basePath = this.config.getOutputBaseDirectoryPath();
		const fileName = this.swiftTypeName(type) + '.swift';
		const outputPath = path.join(basePath, this.outputDirectorySuffix(), fileName);
		return outputPath;
	}

}