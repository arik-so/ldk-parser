import Parser from '../parser.mjs';
import StructGenerator from './struct_generator.mjs';
import Config from '../config.mjs';
import {RustStruct, RustTrait, RustVector} from '../rust_types.mjs';

export default class Generator {
	private parser: Parser;

	constructor(parser: Parser) {
		this.parser = parser;
	}

	static snakeCaseToCamelCase(input: string, capitalizeFirst: boolean = false): string {
		let output = input.replace(/([_][a-zA-Z])/g, group =>
			group
			.toUpperCase()
			.replace('_', '')
		);
		if (capitalizeFirst) {
			output = output.charAt(0).toUpperCase() + output.substring(1);
		}
		return output;
	}

	static shallowMostIndentationDepth(input: string): number {
		const regex = /^(\t*)[\S]/m;
		const matches = regex.exec(input);
		if (Array.isArray(matches)) {
			return matches[1].length;
		}
		return 0;
	}

	static reindentCode(input: string, newDepth: number) {
		const oldDepth = Generator.shallowMostIndentationDepth(input);
		const searchString = new RegExp(`^\t{${oldDepth}}`, 'gm');
		return input.replaceAll(searchString, '\t'.repeat(newDepth));
	}

	generateFunctions() {

	}

	generateTypes() {
		const glossary = this.parser.glossary;

		const structGenerator = new StructGenerator(new Config());
		for (const [_, currentType] of Object.entries(glossary)) {
			if (currentType instanceof RustTrait) {

			} else if (currentType instanceof RustVector) {

			} else if (currentType instanceof RustStruct) {
				structGenerator.generate(currentType);
			}
		}
	}
}