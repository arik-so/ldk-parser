import {RustTrait, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class TraitGenerator extends BaseTypeGenerator<RustTrait> {

	generateFileContents(type: RustTrait): string {
		const swiftTypeName = this.swiftTypeName(type);

		let fieldAccessors = '';
		let generatedLambdas = '';
		let generatedMethods = '';

		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.documentation, 4)}
				open class ${swiftTypeName}: NativeTraitWrapper {

					${this.inheritedInits(type)}

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						{traitInitializer}

						self.cType = ${type.name}({traitInitializationArguments})

						super.init(conflictAvoidingVariableName: 0)
					}

					${generatedMethods}

					${fieldAccessors}

					internal func dangle() -> ${swiftTypeName} {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ${swiftTypeName} \\(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ${swiftTypeName} \\(self.instanceNumber) due to dangle.")
						}
					}
				}

				public class NativelyImplemented${swiftTypeName}: ${swiftTypeName} {
					{nativelyImplementedCallbacks}
				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'traits';
	}

}