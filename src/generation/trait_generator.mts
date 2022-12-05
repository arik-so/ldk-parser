import {
	ContextualRustType, RustArray,
	RustLambda,
	RustPrimitive,
	RustPrimitiveWrapper,
	RustStruct,
	RustTrait, RustType
} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';
import Generator from './index.mjs';

export default class TraitGenerator extends BaseTypeGenerator<RustTrait> {

	generateFileContents(type: RustTrait): string {
		const swiftTypeName = this.swiftTypeName(type);

		let fieldAccessors = '';
		let generatedLambdas = '';
		let generatedMethods = '';

		for (const currentLambda of type.lambdas) {
			generatedLambdas += this.generateLambda(currentLambda, type);
		}

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

						${generatedLambdas}

						self.cType = ${type.name}({traitInitializationArguments})

						super.init(conflictAvoidingVariableName: 0)
					}

					{generatedCallbacks}

					{generatedMethods}

					{fieldAccessors}

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

	/**
	 * This is the Swift type that the Swift compiler natively maps C types into
	 * For instance, C's uint64_t[3] would become a Swift tuple: (UInt64, UInt64, UInt64)
	 * @param contextualType
	 * @protected
	 */
	protected getRawTypeSignature(contextualType: ContextualRustType): string {

		const type = contextualType.type;
		const rawTypeName = this.getRawTypeName(type);

		// if everything is simple, return the type name directly
		if (!contextualType.isAsteriskPointer && !contextualType.isConstant && !contextualType.isNonnullablePointer) {
			return rawTypeName;
		}

		if(contextualType.isConstant && contextualType.isAsteriskPointer) {
			// this is gonna be an unsafe pointer, dawg
			return `UnsafePointer<${rawTypeName}>`
		}

		throw new Error(`Unmapped raw type: ${type.name}`);
	}

	private getRawTypeName(type: RustType) {
		if (type instanceof RustPrimitive) {
			return type.swiftRawSignature;
		}

		if (type instanceof RustStruct) {
			return type.name;
		}

		if (type instanceof RustPrimitiveWrapper) {
			return type.name;
		}

		if(type instanceof RustArray){
			if(type.iteratee instanceof RustPrimitive && Number.isFinite(type.length)){
				// inlining a really long tuple would be rather ugly, so instead we're gonna
				// declare a type for it and generate some auxiliary conversion and typealiasing
				// artifacts
				this.auxiliaryArtifacts.addTuple(type.iteratee.swiftRawSignature, type.length);
				return `${type.iteratee.swiftRawSignature}Tuple${type.length}`
			}
		}
	}

	/**
	 * This is the lambda that is passed to Rust when constructing a new trait.
	 * The lambda will be called by Rust with raw Rust arguments, and Rust will be expecting it
	 * to return raw Rust return values.
	 *
	 * Internally, the lambda will convert the Rust arguments to Swift types, call the instance's
	 * Swift callback method, and then convert the Swift result back to Rust for the Rust caller's
	 * consumption.
	 * @param lambda
	 * @param type
	 * @private
	 */
	private generateLambda(lambda: RustLambda, type: RustTrait) {

		const swiftTypeName = this.swiftTypeName(type);
		const swiftLambdaName = Generator.snakeCaseToCamelCase(lambda.name) + 'Lambda';
		const swiftCallbackName = Generator.snakeCaseToCamelCase(lambda.name);

		let rawLambdaArguments = ['pointer: UnsafeRawPointer?'];

		for (const currentArgument of lambda.arguments) {
			const rawTypeName = this.getRawTypeSignature(currentArgument);
			rawLambdaArguments.push(`${currentArgument.contextualName}: ${rawTypeName}`);
		}

		const rawReturnType = this.getRawTypeSignature(lambda.returnValue);

		return `
				func ${swiftLambdaName}(${rawLambdaArguments.join(', ')}) -> ${rawReturnType} {
					let instance: ${swiftTypeName} = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BaseSign.swift::get_per_commitment_point")

					// Swift callback variable prep
					{swiftCallPrefix}

					// Swift callback call
					let swiftCallbackResult = instance.${swiftCallbackName}()

					// cleanup
					{swiftCallSuffix}

					// return value (do some wrapping)
					let returnValue = {rustPrepPrefix}swiftCallbackResult{rustPrepSuffix}

					return returnValue
				}
		`;
	}

}