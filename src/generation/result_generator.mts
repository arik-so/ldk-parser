import {RustResult, RustResultValueEnum} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class ResultGenerator extends BaseTypeGenerator<RustResult> {

	generateFileContents(type: RustResult): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';

		for (const currentMethod of type.methods) {
			const currentMethodName = this.swiftMethodName(currentMethod, type);
			if (currentMethodName === 'isOk') {
				// the native detour value checker is more circuitous
				continue;
			}

			generatedMethods += this.generateMethod(currentMethod, type);
		}

		const valueEnum = type.valueField.type as RustResultValueEnum;
		const preparedErrorReturnValue = this.prepareRustReturnValueForSwift(valueEnum.errorVariant, type);
		const preparedSuccessReturnValue = this.prepareRustReturnValueForSwift(valueEnum.resultVariant, type);

		let successTypeSignature = this.getPublicTypeSignature(valueEnum.resultVariant.type);
		let errorTypeSignature = this.getPublicTypeSignature(valueEnum.errorVariant.type);

		if (!successTypeSignature.endsWith('?')) {
			// it's always an optional
			successTypeSignature += '?';
		}

		if (!errorTypeSignature.endsWith('?')) {
			// it's always an optional
			errorTypeSignature += '?';
		}

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

					public func getError() -> ${errorTypeSignature} {
						if self.cType?.result_ok == false {
							return ${preparedErrorReturnValue.wrapperPrefix}self.cType!.contents.err.pointee${preparedErrorReturnValue.wrapperSuffix}
						}
						return nil
					}

					public func getValue() -> ${successTypeSignature} {
						if self.cType?.result_ok == true {
							return ${preparedSuccessReturnValue.wrapperPrefix}self.cType!.contents.result.pointee${preparedSuccessReturnValue.wrapperSuffix}
						}
						return nil
					}

					internal func dangle() -> ${swiftTypeName} {
        				self.dangling = true
						return self
					}

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'results';
	}

}