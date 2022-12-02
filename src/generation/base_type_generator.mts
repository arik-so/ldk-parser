import Config from '../config.mjs';
import {RustType} from '../rust_types.mjs';
import * as path from 'path';
import * as fs from 'fs';

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

	private outputFilePath(type: RustType): string {
		let basePath = this.config.getOutputBaseDirectoryPath();
		const fileName = this.swiftTypeName(type) + '.swift';
		const outputPath = path.join(basePath, this.outputDirectorySuffix(), fileName);
		return outputPath;
	}

}