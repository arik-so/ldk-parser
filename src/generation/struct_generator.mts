import {RustStruct, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class StructGenerator extends BaseTypeGenerator {

	generateFileContents(type: RustType): string {
		if (!(type instanceof RustStruct)) {
			throw new Error('type must be a RustStruct!');
		}

		return '';
	}

	outputDirectorySuffix(): string {
		return 'structs';
	}

}