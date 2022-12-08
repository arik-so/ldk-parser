import {RustFunction, RustStruct, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class StructGenerator extends BaseTypeGenerator<RustStruct> {

	generateFileContents(type: RustStruct, containerType?: RustType): string {
		let swiftTypeName = this.swiftTypeName(type);

		let containerLessPrefix = `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			${this.renderDocComment(type.documentation, 3)}
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {
		`;
		let containerLessSuffix = `
			}
		`;

		if (type.parentType && type.parentType !== containerType) {
			throw new Error(`Only orphan structs may be generated. ${type.name} belongs to ${type.parentType.getName()} (${type.parentType.constructor.name})`);
		} else if (type.parentType) {
			swiftTypeName = this.getPublicTypeSignature(type, containerType);
			containerLessPrefix = `
				internal typealias ${this.getPublicTypeSignature(type)} = ${swiftTypeName}
			`;
			containerLessSuffix = '';
		}

		let fieldAccessors = '';
		let generatedMethods = '';

		for (const [_, currentField] of Object.entries(type.fields)) {
			fieldAccessors += this.generateAccessor(currentField, type);
		}


		// THIS IS ALL CODE TO DETECT CONSTRUCTORS WITH DUPLICATE SIGNATURES
		const conflictingArgumentConstructors = this.collectConflictingConstructors(type);
		for (const currentMethod of type.methods) {
			const isConflictingConstructor = conflictingArgumentConstructors.has(currentMethod);
			generatedMethods += this.generateMethod(currentMethod, type, isConflictingConstructor);
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

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}

				${containerLessSuffix}
		`;
	}

	outputDirectorySuffix(): string {
		return 'structs';
	}

}