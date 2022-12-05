import {BaseTypeGenerator} from './base_type_generator.mjs';
import {RustArray, RustPrimitive, RustPrimitiveWrapper} from '../rust_types.mjs';

export default class PrimitiveWrapperGenerator extends BaseTypeGenerator<RustPrimitiveWrapper> {
	generateFileContents(type: RustPrimitiveWrapper): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';

		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		const swiftReturnType = this.getPublicTypeSignature(type);

		let initializer = '';
		let valueAccessor = '';

		let ownershipInfix = '';
		if (type.ownershipField) {
			ownershipInfix = `, ${type.ownershipField.contextualName}: false`;
		}

		const dataFieldName = type.dataField.contextualName;
		if (type.dataField.type instanceof RustPrimitive) {
			if (swiftReturnType === 'String') {
				const lengthFieldName = type.lengthField.contextualName;

				initializer = `self.cType = ${type.name}(${dataFieldName}: Bindings.string_to_unsafe_uint8_pointer(string: value), ${lengthFieldName}: UInt(value.count)${ownershipInfix})`;
				valueAccessor = `
						var array = [UInt8]()
						for index in 0..<Int(self.cType!.${lengthFieldName}) {
							let currentEntry = self.cType!.${dataFieldName}[index]
							array.append(currentEntry)
						}
						let data = Data(bytes: array)
						return String(data: data, encoding: .utf8)!
				`;
			} else if(type.dataField.isAsteriskPointer && type.lengthField){
				// this is an array
				const lengthFieldName = type.lengthField.contextualName;
				initializer = `
						let dataContainer = UnsafeMutablePointer<${type.dataField.type.swiftRawSignature}>.allocate(capacity: value.count)
						dataContainer.initialize(from: value, count: value.count)
						self.cType = ${type.name}(${dataFieldName}: dataContainer, ${lengthFieldName}: UInt(value.count)${ownershipInfix})
				`;
				valueAccessor = `
						var array = [${type.dataField.type.swiftRawSignature}]()
						for index in 0..<Int(self.cType!.${lengthFieldName}) {
							let currentEntry = self.cType!.${dataFieldName}[index]
							array.append(currentEntry)
						}
						return array
				`;
			} else {
				initializer = `self.cType = ${type.name}(${type.dataField.contextualName}: value${ownershipInfix})`;
				valueAccessor = `return self.cType!.${type.dataField.contextualName}`;
			}
		} else if (type.dataField.type instanceof RustArray) {
			if (Number.isFinite(type.dataField.type.length)) {
				let dataAssignment = [];
				let dataAccess = [];
				for (let i = 0; i < type.dataField.type.length; i++) {
					dataAssignment.push(`value[${i}]`);
					dataAccess.push(`self.cType!.${dataFieldName}.${i}`);
				}
				initializer = `self.cType = ${type.name}(${dataFieldName}: (${dataAssignment.join(', ')})${ownershipInfix})`;
				valueAccessor = `return [${dataAccess.join(', ')}]`;
			}
		}

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif
			
			internal typealias ${swiftTypeName} = Bindings.${swiftTypeName}
			
			extension Bindings {
				
				${this.renderDocComment(type.documentation, 4)}
				internal class ${swiftTypeName}: NativeTypeWrapper {
			
					${this.inheritedInits(type)}
					
					public init(value: ${swiftReturnType}) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						
						${initializer}
						
						super.init(conflictAvoidingVariableName: 0)
					}
					
					${generatedMethods}
					
					public func getValue() -> ${swiftReturnType} {
						${valueAccessor}
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

	protected outputDirectorySuffix(): string {
		return 'wrappers';
	}

}