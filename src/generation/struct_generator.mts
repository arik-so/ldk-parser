import {RustStruct, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class StructGenerator extends BaseTypeGenerator {

	generate(type: RustType) {
		if (!(type instanceof RustStruct)) {
			throw new Error('type must be a RustStruct!');
		}
	}

}