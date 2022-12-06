import {
	ContextualRustType,
	RustArray,
	RustLambda,
	RustNullableOption,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustTrait,
	RustType,
	RustVector
} from '../rust_types.mjs';
import {BaseTypeGenerator, PreparedArgument, PreparedReturnValue} from './base_type_generator.mjs';
import Generator from './index.mjs';

export default class TraitGenerator extends BaseTypeGenerator<RustTrait> {

	generateFileContents(type: RustTrait): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedLambdas = '';
		let generatedCallbacks = ''
		let generatedMethods = '';
		let fieldAccessors = '';

		let constructorArguments = [];
		let constructorPrep = '';

		let traitInitializationArguments = [];

		for (const currentField of type.orderedFields) {
			if (currentField instanceof RustLambda) {
				// todo: canonicalize argument lambda name determination
				if (currentField.thisArgument) {
					generatedLambdas += Generator.reindentCode(this.generateLambda(currentField, type), 6);

					const currentLambdaSwiftName = Generator.snakeCaseToCamelCase(currentField.name) + 'Lambda';
					traitInitializationArguments.push(`${currentField.name}: ${currentLambdaSwiftName}`);

					generatedCallbacks += this.generateCallbackStub(currentField, type);
				} else {
					// don't push weird lambdas
					traitInitializationArguments.push(`${currentField.name}: nil`);
				}
			} else if (currentField instanceof ContextualRustType) {
				const swiftArgumentName = Generator.snakeCaseToCamelCase(currentField.contextualName);
				let initializationValue = swiftArgumentName;

				// this might be an additional parameter that's necessary for initialization
				if (currentField.contextualName !== 'this_arg') {
					const swiftArgumentType = this.getPublicTypeSignature(currentField.type, type);
					constructorArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);

					const preparedArgument = this.prepareSwiftArgumentForRust(currentField, type);
					constructorPrep += preparedArgument.conversion;

					initializationValue = `${preparedArgument.methodCallWrapperPrefix}${preparedArgument.accessor}${preparedArgument.methodCallWrapperSuffix}`;

					fieldAccessors += this.generateAccessor(currentField, type);
				}

				traitInitializationArguments.push(`${currentField.contextualName}: ${initializationValue}`);
			}
		}

		let renderedTraitInitializationArguments = '';
		if (traitInitializationArguments.length > 0) {
			renderedTraitInitializationArguments = '\n' + traitInitializationArguments.join(',\n') + '\n';
			renderedTraitInitializationArguments = Generator.reindentCode(renderedTraitInitializationArguments, 7);

			// cut off the trailing tab character
			renderedTraitInitializationArguments = renderedTraitInitializationArguments.substring(0, renderedTraitInitializationArguments.length - 1);
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

					public init(${constructorArguments.join(', ')}) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let thisArg = Bindings.instanceToPointer(instance: self)

						${constructorPrep}

						${generatedLambdas}

						self.cType = ${type.name}(${renderedTraitInitializationArguments})

						super.init(conflictAvoidingVariableName: 0)
					}

					${generatedCallbacks}

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

	/**
	 * This is the Swift type that the Swift compiler natively maps C types into
	 * For instance, C's uint64_t[3] would become a Swift tuple: (UInt64, UInt64, UInt64)
	 *
	 * The difference between this method and getRawTypeName is that this one is context-aware,
	 * and can handle the raw type wrapped in pointers and optionals.
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

		if (contextualType.isAsteriskPointer) {

			const nullabilitySuffix = contextualType.isNonnullablePointer ? '' : '?';
			const mutabilityInfix = contextualType.isConstant ? '' : 'Mutable';

			if (type instanceof RustPrimitive && type.swiftRawSignature === 'Void') {
				// usually the case when `contextualType.contextualName === 'this_arg'`
				return `Unsafe${mutabilityInfix}RawPointer${nullabilitySuffix}`;
			}

			return `Unsafe${mutabilityInfix}Pointer<${rawTypeName}>${nullabilitySuffix}`;

		}

		throw new Error(`Unmapped raw type: ${type.name}`);
	}

	protected generateCallbackStub(lambda: RustLambda, type: RustTrait): string {

		const swiftTypeName = this.swiftTypeName(type);
		const swiftMethodName = Generator.snakeCaseToCamelCase(lambda.name);
		let swiftMethodArguments = [];

		for (const currentArgument of lambda.arguments) {
			if (currentArgument === lambda.thisArgument) {
				continue;
			}

			const swiftArgumentName = Generator.snakeCaseToCamelCase(currentArgument.contextualName);
			const swiftArgumentType = this.getPublicTypeSignature(currentArgument.type);
			swiftMethodArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);
		}

		const swiftReturnType = this.getPublicTypeSignature(lambda.returnValue.type);

		return `
					${this.renderDocComment(lambda.documentation, 5)}
					open func ${swiftMethodName}(${swiftMethodArguments.join(', ')}) -> ${swiftReturnType} {
						Bindings.print("Error: ${swiftTypeName}::${swiftMethodName} MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		`;
	}

	/**
	 * This is really just a way of preparing a value passed by Rust into a lambda such that
	 * it can be fed into the Swift callback function that users may or may not override.
	 *
	 * The only reason it's slightly more complicated than `prepareRustReturnValueForSwift` is that
	 * there may be argument prep beforehand, so the name of the variable might change.
	 *
	 * Additionally, with multiple arguments given to a function, there names need to be tracked.
	 * With a return value, on the other hand, there is no ambiguity, and neither name nor
	 * accessor need specifying.
	 *
	 * Note that inside lambdas, `anchor: self` CANNOT and MUST NOT be used, because referencing
	 * `self` would make that lambda inconvertible to a context-free C function
	 * @param argumentType
	 * @protected
	 */
	private prepareRustArgumentForSwift(argumentType: ContextualRustType): PreparedSwiftArgument {

		const labelName = Generator.snakeCaseToCamelCase(argumentType.contextualName);

		const preparedArgument: PreparedSwiftArgument = {
			name: argumentType.contextualName,
			accessor: argumentType.contextualName,
			label: labelName,

			conversion: '',

			methodCallWrapperPrefix: '',
			methodCallWrapperSuffix: '',

			deferredCleanup: ''
		};

		// TODO: add support for anchor infix and dangle()/danglingClone() suffixes

		const type = argumentType.type;

		// we're dealing with an UnsafePointer here
		if (argumentType.isAsteriskPointer) {

			// this thing is nullable, we must unwrap it
			if (!argumentType.isNonnullablePointer) {
				preparedArgument.conversion += `
					var ${preparedArgument.name}Pointee: ${this.getRawTypeName(type)}? = nil
					if let ${preparedArgument.name}Unwrapped = ${preparedArgument.accessor} {
						${preparedArgument.name}Pointee = ${preparedArgument.name}Unwrapped.pointee
					}
				`;
				preparedArgument.name += 'Pointee';
				preparedArgument.accessor = preparedArgument.name;
			} else {
				// we can simply refer to the pointee without unwrapping it
				preparedArgument.accessor += '.pointee';
			}
		}

		if (type instanceof RustVector || type instanceof RustPrimitiveWrapper || type instanceof RustNullableOption) {
			preparedArgument.methodCallWrapperPrefix += `${this.swiftTypeName(type)}(pointer: `;
			preparedArgument.methodCallWrapperSuffix += `).getValue()`;
		} else if (type instanceof RustTrait) {
			preparedArgument.methodCallWrapperPrefix += `NativelyImplemented${this.swiftTypeName(type)}(pointer: `;
			preparedArgument.methodCallWrapperSuffix += `)`;
		} else if (type instanceof RustStruct || type instanceof RustResult || type instanceof RustTaggedValueEnum) {
			preparedArgument.methodCallWrapperPrefix += `${this.swiftTypeName(type)}(pointer: `;
			preparedArgument.methodCallWrapperSuffix += `)`;
		} else if (type instanceof RustPrimitive) {
			// nothing to do here
			return preparedArgument;
		} else if (type instanceof RustArray) {
			const iteratee = type.iteratee;
			if (iteratee instanceof RustPrimitive && Number.isFinite(type.length)) {
				// inlining a really long tuple would be rather ugly, so instead we're gonna
				// declare a type for it and generate some auxiliary conversion and typealiasing
				// artifacts
				const tupleTypeName = this.getRawTypeName(type);
				preparedArgument.name = `detupled${Generator.snakeCaseToCamelCase(preparedArgument.name, true)}`;
				this.auxiliaryArtifacts.addTuple(iteratee.swiftRawSignature, type.length);
				preparedArgument.conversion += `
					let ${preparedArgument.name} = Bindings.${tupleTypeName}ToArray(tuple: ${preparedArgument.accessor})
				`;
				preparedArgument.accessor = preparedArgument.name;
			}
		} else if (type instanceof RustPrimitiveEnum) {
			preparedArgument.methodCallWrapperPrefix += `${this.swiftTypeName(type)}(value: `;
			preparedArgument.methodCallWrapperSuffix += `)`;
		} else {
			throw new Error(`Unsupported return type ${type.name} of kind ${type.constructor.name}`);
		}
		return preparedArgument;
	}

	private prepareSwiftReturnValueForRust(returnType: ContextualRustType): PreparedReturnValue {
		const preparedReturnValue: PreparedReturnValue = {
			wrapperPrefix: '',
			wrapperSuffix: ''
		};

		// these type elision helpers only apply outside the context of the very eliding type

		let type = returnType.type;
		if (type instanceof RustNullableOption || type instanceof RustVector || type instanceof RustTaggedValueEnum || type instanceof RustResult) {
			preparedReturnValue.wrapperSuffix = '.cType!';
		} else if (type instanceof RustTrait) {
			preparedReturnValue.wrapperSuffix = '.activate().cType!';
		} else if (type instanceof RustStruct) {
			preparedReturnValue.wrapperSuffix = '.cType!';
		} else if (type instanceof RustPrimitive) {
			// nothing to do here
		} else if(type instanceof RustPrimitiveEnum) {
			preparedReturnValue.wrapperSuffix = '.getCValue()'
		} else {
			throw new Error(`Unsupported native return type: ${returnType.type.name} (${returnType.type.constructor.name})`);
		}

		if (returnType.isAsteriskPointer) {
			throw new Error(`Unsupported native pointer return type: ${returnType.type.name} (${returnType.type.constructor.name})`);
		}

		return preparedReturnValue;
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

		// should be equivalent to this.swiftMethodName() if lambda was a `RustFunction`
		const swiftCallbackName = Generator.snakeCaseToCamelCase(lambda.name);

		let rawLambdaArguments = [];
		let swiftCallbackArguments = [];
		let swiftCallPrefix = '';
		let swiftCallSuffix = '';

		for (const currentArgument of lambda.arguments) {
			const rawTypeName = this.getRawTypeSignature(currentArgument);
			rawLambdaArguments.push(`${currentArgument.contextualName}: ${rawTypeName}`);

			if (currentArgument === lambda.thisArgument) {
				continue;
			}
			const preparedArgument = this.prepareRustArgumentForSwift(currentArgument);
			swiftCallPrefix += preparedArgument.conversion;
			swiftCallSuffix += preparedArgument.deferredCleanup;
			swiftCallbackArguments.push(`${preparedArgument.label}: ${preparedArgument.methodCallWrapperPrefix}${preparedArgument.accessor}${preparedArgument.methodCallWrapperSuffix}`);
		}

		const rawReturnType = this.getRawTypeSignature(lambda.returnValue);
		const preparedReturnValue = this.prepareSwiftReturnValueForRust(lambda.returnValue);

		return `
			func ${swiftLambdaName}(${rawLambdaArguments.join(', ')}) -> ${rawReturnType} {
				let instance: ${swiftTypeName} = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "${swiftTypeName}::${swiftLambdaName}")

				// Swift callback variable prep
				${Generator.reindentCode(swiftCallPrefix, 4)}

				// Swift callback call
				let swiftCallbackResult = instance.${swiftCallbackName}(${swiftCallbackArguments.join(', ')})

				// cleanup
				${swiftCallSuffix}

				// return value (do some wrapping)
				let returnValue = ${preparedReturnValue.wrapperPrefix}swiftCallbackResult${preparedReturnValue.wrapperSuffix}

				return returnValue
			}
		`;
	}

}

interface PreparedSwiftArgument extends PreparedArgument {
	/**
	 * The parameter label for the argument used to call the Swift method
	 */
	label: string;
}