import Parser from '../parser.mjs';
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

	async generateTypes() {
		const {default: StructGenerator} = await import('./struct_generator.mjs');
		const {default: VectorGenerator} = await import('./vector_generator.mjs');
		const {default: ComplexEnumGenerator} = await import('./complex_enum_generator.mjs');
		const {default: PrimitiveEnumGenerator} = await import('./primitive_enum_generator.mjs');
		const {default: PrimitiveWrapperGenerator} = await import('./primitive_wrapper_generator.mjs');
		const {default: ResultGenerator} = await import('./result_generator.mjs');
		const {default: NullableOptionGenerator} = await import('./nullable_option_generator.mjs');
		const {default: TraitGenerator} = await import('./trait_generator.mjs');

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