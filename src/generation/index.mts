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
import {GlobalBindingsStruct} from './bindings_file_generator.mjs';

export default class Generator {
	private parser: Parser;
	private auxiliaryArtifacts: AuxiliaryArtifacts;

	constructor(parser: Parser) {
		this.parser = parser;
		this.auxiliaryArtifacts = new AuxiliaryArtifacts();
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

	/**
	 * Gets the indentation depth of the first line that contains non-whitespace characters
	 * @param input
	 */
	static firstIndentationDepth(input: string): number {
		const regex = /^(\t*)[\S]/m;
		const matches = regex.exec(input);
		if (Array.isArray(matches)) {
			return matches[1].length;
		}
		return 0;
	}

	static reindentCode(input: string, newDepth: number) {
		const oldDepth = Generator.firstIndentationDepth(input);
		const searchString = new RegExp(`^\t{${oldDepth}}`, 'gm');
		return input.replaceAll(searchString, '\t'.repeat(newDepth));
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

		const structGenerator = new StructGenerator(config, this.auxiliaryArtifacts);
		const wrapperGenerator = new PrimitiveWrapperGenerator(config, this.auxiliaryArtifacts);
		const vectorGenerator = new VectorGenerator(config, this.auxiliaryArtifacts);
		const primitiveEnumGenerator = new PrimitiveEnumGenerator(config, this.auxiliaryArtifacts);
		const complexEnumGenerator = new ComplexEnumGenerator(config, this.auxiliaryArtifacts);
		const nullableOptionGenerator = new NullableOptionGenerator(config, this.auxiliaryArtifacts);
		const resultGenerator = new ResultGenerator(config, this.auxiliaryArtifacts);
		const traitGenerator = new TraitGenerator(config, this.auxiliaryArtifacts);

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
			} else if (currentType instanceof RustNullableOption) {
				nullableOptionGenerator.generate(currentType);
			} else if (currentType instanceof RustTaggedValueEnum) {
				complexEnumGenerator.generate(currentType);
			} else if (currentType instanceof RustResult) {
				resultGenerator.generate(currentType);
			} else if (currentType instanceof RustStruct) {
				structGenerator.generate(currentType);
			}
		}
	}

	async generateFunctions() {
		const {default: BindingsFileGenerator, GlobalBindingsStruct} = await import('./bindings_file_generator.mjs');
		const bindingsStruct = new GlobalBindingsStruct();
		bindingsStruct.methods = this.parser.functions;

		const bindingsFileGenerator = new BindingsFileGenerator(this.parser.config, this.auxiliaryArtifacts);
		bindingsFileGenerator.generate(bindingsStruct);

	}
}

export class AuxiliaryArtifacts {

	private tuples: { [swiftRawType: string]: Set<number> } = {};

	public addTuple(swiftTypeName: string, size: number) {
		if (!this.tuples[swiftTypeName]) {
			this.tuples[swiftTypeName] = new Set<number>();
		}

		this.tuples[swiftTypeName].add(size);
	}

}