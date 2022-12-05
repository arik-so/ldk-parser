import Parser from '../parser.mjs';
import StructGenerator from './struct_generator.mjs';
import {
	RustNullableOption,
	RustPrimitiveEnum,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustTrait,
	RustVector
} from '../rust_types.mjs';
import VectorGenerator from './vector_generator.mjs';
import ComplexEnumGenerator from './complex_enum_generator.mjs';
import PrimitiveEnumGenerator from './primitive_enum_generator.mjs';
import PrimitiveWrapperGenerator from './primitive_wrapper_generator.mjs';
import ResultGenerator from './result_generator.mjs';
import NullableOptionGenerator from './nullable_option_generator.mjs';
import TraitGenerator from './trait_generator.mjs';

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
		const config = this.parser.config;

		const structGenerator = new StructGenerator(config);
		const wrapperGenerator = new PrimitiveWrapperGenerator(config);
		const vectorGenerator = new VectorGenerator(config);
		const primitiveEnumGenerator = new PrimitiveEnumGenerator(config);
		const complexEnumGenerator = new ComplexEnumGenerator(config);
		const nullableOptionGenerator = new NullableOptionGenerator(config);
		const resultGenerator = new ResultGenerator(config);
		const traitGenerator = new TraitGenerator(config);

		for (const [_, currentType] of Object.entries(glossary)) {
			if (currentType.parentType) {
				continue;
			}

			if (currentType instanceof RustTrait) {
				traitGenerator.generate(currentType);
			} else if (currentType instanceof RustPrimitiveWrapper) {
				wrapperGenerator.generate(currentType);
			} else if (currentType instanceof RustVector) {
				vectorGenerator.generate(currentType);
			} else if (currentType instanceof RustPrimitiveEnum) {
				primitiveEnumGenerator.generate(currentType);
			} else if (currentType instanceof RustTaggedValueEnum) {
				complexEnumGenerator.generate(currentType);
			} else if (currentType instanceof RustNullableOption) {
				nullableOptionGenerator.generate(currentType);
			} else if (currentType instanceof RustResult) {
				resultGenerator.generate(currentType);
			} else if (currentType instanceof RustStruct) {
				structGenerator.generate(currentType);
			}
		}
	}
}