import {RustType, RustVector} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class VectorGenerator extends BaseTypeGenerator<RustVector> {

	generateFileContents(type: RustVector): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';
		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		// this type is elided
		const swiftPublicType = this.getPublicTypeSignature(type);
		const iterateeRustTypeName = type.iterateeField.type.name;
		const bracketedIterateeTypeName = '<' + iterateeRustTypeName + '>';

		let dataContainerInitializationArgumentName = 'rustArray';
		let dimensionalityReduction = '';

		let rustUnwrapper = 'let rustArray = array.map { (currentValueDepth1) in\n';
		let swiftUnwrapper = 'let swiftArray = array.map { (currentCType) in\n';

		let unwrapperSuffix = '';
		let depth = 1;
		let currentIteratee: RustType = type.iterateeField.type;
		while (currentIteratee instanceof RustVector) {
			const indentationDepth = 6 + depth;
			const indentation = `\t`.repeat(indentationDepth);

			rustUnwrapper += `${indentation}currentValueDepth${depth}.map { (currentValueDepth${depth + 1}) in\n`;
			swiftUnwrapper += `${indentation}currentCType.map { (currentCType) in\n`;
			unwrapperSuffix += `\n${indentation}}`;

			currentIteratee = currentIteratee.iterateeField.type;
			depth++;
		}
		unwrapperSuffix += '\n' + '\t'.repeat(6) + '}';

		const indentationDepth = 6 + depth;
		const indentation = `\t`.repeat(indentationDepth);
		rustUnwrapper += `${indentation}currentValueDepth${depth}.danglingClone().cType!${unwrapperSuffix}`;

		// TODO: fix value access if it's an array of nullable options
		swiftUnwrapper += `${indentation}${this.swiftTypeName(currentIteratee)}(pointer: currentCType)${unwrapperSuffix}`;

		if (type.iterateeField.type instanceof RustVector) {
			// const iterateeSwiftTypeName = this.getPublicTypeSignature(type.iterateeField.type);

			// avoid elision
			const iterateeSwiftTypeName = this.getPublicTypeSignature(type.iterateeField.type, type.iterateeField.type);

			dimensionalityReduction = `
						var lowerDimension = [${iterateeRustTypeName}]()
						for currentEntry in rustArray {
							let convertedEntry = ${iterateeSwiftTypeName}(array: currentEntry)
							lowerDimension.append(convertedEntry.cOpaqueStruct!)
							self.addAnchor(anchor: convertedEntry)
						}
			`;
			dataContainerInitializationArgumentName = 'lowerDimension';
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
					
					public init(array: ${swiftPublicType}) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						
						${rustUnwrapper}
						
						${dimensionalityReduction}
						
						let dataContainer = UnsafeMutablePointer${bracketedIterateeTypeName}.allocate(capacity: array.count)
						dataContainer.initialize(from: ${dataContainerInitializationArgumentName}, count: array.count)

        				let vector = ${type.name}(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
						
						super.init(conflictAvoidingVariableName: 0)
					}
					
					public func getValue() -> ${swiftPublicType} {
					
						var array = ${this.getRustArrayTypeSignature(type)}()
						
						${this.valueAccessCode(type)}
						
						${swiftUnwrapper}
						return swiftArray
					}
					
					${generatedMethods}
					
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
		return 'vectors';
	}

	private valueAccessCode(type: RustVector, depth = 1) {

		const additionalIndentation = '\t'.repeat(depth - 1);

		let higherLevelArrayName = `convertedEntry${depth - 1}`;
		let higherLevelAccessor = `currentEntry${depth - 1}`;
		if (depth === 1) {
			higherLevelArrayName = 'array';
			higherLevelAccessor = 'self.cType!';
		}

		let termination = `${additionalIndentation}${higherLevelArrayName}.append(currentEntry${depth})`;

		if (type.iterateeField.type instanceof RustVector) {
			// it's nested
			termination = `
							${additionalIndentation}var convertedEntry${depth} = ${this.getRustArrayTypeSignature(type.iterateeField.type)}()
				
							${this.valueAccessCode(type.iterateeField.type, depth + 1)}
				
							${additionalIndentation}${higherLevelArrayName}.append(convertedEntry${depth})
			`;
		}

		return `
						${additionalIndentation}for index${depth} in 0..<Int(${higherLevelAccessor}.datalen) {
							${additionalIndentation}let currentEntry${depth} = ${higherLevelAccessor}.data[index${depth}]
							${termination}
						${additionalIndentation}}
		`;
	}

	private getRustArrayTypeSignature(type: RustType) {
		if (type instanceof RustVector) {
			return `[${this.getRustArrayTypeSignature(type.iterateeField.type)}]`;
		}
		return type.name;
	}

}