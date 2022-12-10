// export const GLOSSARY: { [name: string]: RustType } = {};

export abstract class RustType {
	/**
	 *
	 */
	kind: RustKind;
	/**
	 * Rustdoc comments preceding the type
	 */
	documentation: string;
	/**
	 * Pretty much any type may have methods
	 */
	methods: RustFunction[] = [];
	/**
	 * Some types are only relevant within the context of another type, and
	 * may need to be generated therein
	 */
	parentType: RustType | null;

	/**
	 * Raw name of the struct/enum/function etc. Can be something like `LDKAccessError`
	 * or `LockedChannelMonitor_free`
	 *
	 * Some types may be unnamed if they're simply generic arrays
	 */
	name: string | null;

	get typeDescription(): string {
		if (this.name) {
			return `${this.name} (${this.constructor.name})`;
		}
		return this.constructor.name;
	}
}

export class RustPrimitive extends RustType {
	/**
	 * The signature of the primitive type in the C header
	 */
	cSignature: string;

	/**
	 * The signature of the primitive type as the Swift compiler would access the C value
	 */
	swiftRawSignature: string;

	name: string;
}

export class OpaqueRustStruct extends RustType {
	name: string;
}

export class RustStruct extends RustType {
	fields: { [name: string]: RustStructField } = {};

	/**
	 * Some structs may have an ownership field, like LDKChannelMonitor
	 * For those structs, when we instantiate them, we need to make sure we set owned to false.
	 * Then, we might wanna consider setting it back to true immediately prior to freeing them.
	 */
	ownershipField: RustStructField | null;

	name: string;
}

export class RustTuple extends RustStruct {
	orderedFields: RustStructField[] = [];
}

export class RustVector extends RustStruct {
	iterateeField: RustStructField;
	lengthField: RustStructField;

	get deepestIterateeType(): RustType {
		if (this.iterateeField.type instanceof RustVector) {
			return this.iterateeField.type.deepestIterateeType;
		}
		return this.iterateeField.type;
	}
}

export class RustTrait extends RustStruct {
	identifierField: RustStructField;

	/**
	 * To initialize a trait, all its fields must be provided in the order of their declaration
	 */
	orderedFields: (RustStructField | RustLambda)[] = [];

	lambdas: RustLambda[] = [];
}

export class RustPrimitiveWrapper extends RustStruct {
	dataField: RustStructField;
	lengthField: RustStructField | null;
	ownershipField: RustStructField | null;

	/**
	 * To initialize a wrapper, all its fields must be provided in the order of their declaration
	 * TODO: enforce!
	 */
	orderedFields: RustStructField[] = [];
}

export class RustPrimitiveEnum extends RustType {
	variants: RustPrimitiveEnumVariant[] = [];

	name: string;
}

export class RustPrimitiveEnumVariant extends RustType {
	name: string;
}

export class RustArray extends RustType {
	iteratee: RustType;
	length: number | null;
}

export class RustValueEnum extends RustType {
	variantTag: RustStructField | null;
	variants: { [name: string]: RustStructField } = {};

	name: string;
}

export class RustTaggedValueEnum extends RustValueEnum {
	name: string;
}

export class RustNullableOption extends RustTaggedValueEnum {
	someVariant: RustStructField;

	name: string;
}

/**
 * This is somewhat similar to the RustTaggedValueEnum, except that it has no tag.
 * Instead, the tag is external, and lives in the RustResult type.
 * Plus, there can only be two variants, either result or error.
 */
export class RustResultValueEnum extends RustType {
	resultVariant: RustStructField;
	errorVariant: RustStructField;

	name: string;
}

class RustEnumVariant extends RustType {
	associatedType: RustType | null;

	name: string;
}

export class RustResult extends RustType {
	valueField: RustStructField;
	tagField: RustStructField;

	name: string;
}

export class RustFunction extends RustType {
	arguments: RustFunctionArgument[] = [];
	returnValue: RustFunctionReturnValue;

	name: string;
}

export class RustLambda extends RustType {
	thisArgument: RustFunctionArgument | null;
	arguments: RustFunctionArgument[] = [];
	returnValue: RustFunctionReturnValue;

	name: string;
}

export class ContextualRustType {
	type: RustType;
	isNonnullablePointer: boolean;
	isAsteriskPointer: boolean;
	isConstant: boolean;
	mustUseResult: boolean;
	isReturnValue: boolean;
	/**
	 * Rustdoc comments preceding the type
	 */
	documentation: string;
	/**
	 * This is usually a variable name, an argument name, or a field name
	 */
	protected _contextualName: string | null;

	getContextualName(): string | null {
		return this._contextualName;
	}

	setContextualName(name: string) {
		this._contextualName = name;
	}
}

export class RustStructField extends ContextualRustType {
	public get contextualName(): string {
		return this._contextualName!;
	}

	public set contextualName(name: string) {
		this._contextualName = name;
	}
}

export class RustFunctionArgument extends ContextualRustType {
	public get contextualName(): string {
		return this._contextualName!;
	}

	public set contextualName(name: string) {
		this._contextualName = name;
	}
}

export class RustFunctionReturnValue extends ContextualRustType {

}

export enum RustKind {
	Primitive,
	Struct,
	Enum,
	EnumValue,
	Result,
	Option,
	Function,
	Array
}