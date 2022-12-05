import {RustStruct, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class StructGenerator extends BaseTypeGenerator<RustStruct> {

	generateFileContents(type: RustStruct, containerType: RustType = null): string {
		let swiftTypeName = this.swiftTypeName(type);

		let containerLessPrefix = `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {
		`;
		let containerLessSuffix = `
			}
		`;

		if (type.parentType && type.parentType !== containerType) {
			throw new Error(`Only orphan structs may be generated. ${type.name} belongs to ${type.parentType.name}`);
		} else if (type.parentType) {
			swiftTypeName = this.getPublicTypeSignature(type, containerType);
			containerLessPrefix = '';
			containerLessSuffix = '';
		}

		let fieldAccessors = '';
		let generatedMethods = '';

		for (const [_, currentField] of Object.entries(type.fields)) {
			fieldAccessors += this.generateAccessor(currentField, type);
		}

		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}


		return `
				${containerLessPrefix}

				${this.renderDocComment(type.documentation, 4)}
				public class ${swiftTypeName}: NativeTypeWrapper {

					${this.inheritedInits(type)}

					${generatedMethods}

					${fieldAccessors}

					internal func dangle() -> ${swiftTypeName} {
						self.dangling = true
						return self
					}

					${this.deinitCode(type)}

				}

				${containerLessSuffix}
		`;
	}

	outputDirectorySuffix(): string {
		return 'structs';
	}

}