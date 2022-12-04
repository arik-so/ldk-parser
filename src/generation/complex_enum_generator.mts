import {RustPrimitiveEnum, RustTaggedValueEnum} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';
import Generator from './index.mjs';

export default class ComplexEnumGenerator extends BaseTypeGenerator<RustTaggedValueEnum> {

	generateFileContents(type: RustTaggedValueEnum): string {
		const swiftTypeName = this.swiftTypeName(type);

		let fieldAccessors = '';
		let generatedMethods = '';

		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		const tagType = type.variantTag.type as RustPrimitiveEnum;

		let tagEnumVariants = '';
		let valueTypeDetector = 'switch self.cType!.tag {';
		for (const currentVariant of tagType.variants) {
			const currentVariantSwiftName = currentVariant.name.replace(type.name + '_', '');
			tagEnumVariants += `
						${this.renderDocComment(currentVariant.documentation, 6)}
						case ${currentVariantSwiftName}
			`;
			valueTypeDetector += `
							case ${currentVariant.name}:
								return .${currentVariantSwiftName}
			`;
		}

		valueTypeDetector += `
							default:
								return nil
						}
		`;

		let polymorphicAccessors = '';
		for (const [_, currentVariant] of Object.entries(type.variants)) {
			const currentPublicType = this.getPublicTypeSignature(currentVariant.type, type);
			const camelCasedVariantName = Generator.snakeCaseToCamelCase(currentVariant.contextualName, true);
			const currentSwiftTypeName = camelCasedVariantName

			const preparedReturnValue = this.prepareRustReturnValueForSwift(currentVariant, type);

			polymorphicAccessors += `
					public func getValueAs${currentSwiftTypeName}() -> ${currentPublicType}? {
						if self.cType?.tag != ${type.name}_${camelCasedVariantName} {
							return nil
						}
						
						${preparedReturnValue.wrapperPrefix}self.cType!.${currentVariant.contextualName}${preparedReturnValue.wrapperSuffix}
					}
			`;
		}

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif
			
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}
			
			extension Bindings {
				
				${this.renderDocComment(type.variantTag.type.documentation, 4)}
				public class ${swiftTypeName}: NativeTypeWrapper {
			
					${this.inheritedInits(type)}
					
					public enum ${swiftTypeName}Type {
						${tagEnumVariants}
					}
					
					public func getValueType() -> ${swiftTypeName}Type? {
						${valueTypeDetector}
					}
					
					${polymorphicAccessors}
					
					${generatedMethods}
					
					${fieldAccessors}
					
					internal func dangle() -> ${swiftTypeName} {
        				self.dangling = true
						return self
					}

					${this.deinitCode(type)}
					
				}
				
			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'enums/complex';
	}

}