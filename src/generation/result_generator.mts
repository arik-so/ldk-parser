import {RustResult, RustResultValueEnum, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class ResultGenerator extends BaseTypeGenerator<RustResult> {

	generateFileContents(type: RustResult): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';

		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		const valueEnum = type.valueField.type as RustResultValueEnum;
		const preparedErrorReturnValue = this.prepareRustReturnValueForSwift(valueEnum.errorVariant, type);
		const preparedSuccessReturnValue = this.prepareRustReturnValueForSwift(valueEnum.resultVariant, type);

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif
			
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}
			
			extension Bindings {
				
				${this.renderDocComment(type.documentation, 4)}
				public class ${swiftTypeName}: NativeTypeWrapper {
			
					${this.inheritedInits(type)}
					
					${generatedMethods}
					
					public func isOk() -> Bool {
						return self.cOpaqueStruct?.result_ok == true
					}
			
					public func getError() -> ${this.getPublicTypeSignature(valueEnum.errorVariant.type)}? {
						if self.cType?.result_ok == false {
							return ${preparedErrorReturnValue.wrapperPrefix}self.cType!.contents.err.pointee${preparedErrorReturnValue.wrapperSuffix}
						}
						return nil
					}
					
					public func getValue() -> ${this.getPublicTypeSignature(valueEnum.resultVariant.type)}? {
						if self.cType?.result_ok == true {
							return ${preparedSuccessReturnValue.wrapperPrefix}self.cType!.contents.result.pointee${preparedSuccessReturnValue.wrapperSuffix}
						}
						return nil
					}
					
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
		return 'results';
	}

}