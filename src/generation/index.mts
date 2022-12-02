import Parser from '../parser.mjs';
import StructGenerator from './struct_generator.mjs';
import Config from '../config.mjs';
import {RustStruct, RustTrait, RustVector} from '../rust_types.mjs';

export default class Generator {
	private parser: Parser;

	constructor(parser: Parser) {
		this.parser = parser;
	}

	generateFunctions() {

	}

	generateTypes() {
		const glossary = this.parser.glossary;

		const structGenerator = new StructGenerator(new Config());
		for (const [_, currentType] of Object.entries(glossary)){
			if (currentType instanceof RustTrait){

			} else if(currentType instanceof RustVector) {

			} else if (currentType instanceof RustStruct) {
				structGenerator.generate(currentType);
			}
		}
	}

	static snakeCaseToCamelCase(input: string, capitalizeFirst: boolean = false): string {
		let output = input.replace(/([_][a-z])/g, group =>
			group
			.toUpperCase()
			.replace('_', '')
		);
		if (capitalizeFirst) {
			output = output.charAt(0).toUpperCase() + output.substring(1);
		}
		return output;
	}
}