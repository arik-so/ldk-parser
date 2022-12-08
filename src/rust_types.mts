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
	protected _name: string | null;

	/**
	 * This is a rather unfortunate workaround because some child types _definitely_ have
	 * a nonnull name, but others may not have a name.
	 */
	getName(): string | null {
		return this._name;
	}

	setName(name: string) {
		this._name = name;
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

	public get name(): string | null {
		return this._name;
	}

	public set name(name: string | null) {
		this._name = name;
	}
}

export class OpaqueRustStruct extends RustType {
	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustStruct extends RustType {
	fields: { [name: string]: RustStructField } = {};

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
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
	 */
	orderedFields: RustStructField[] = [];
}

export class RustPrimitiveEnum extends RustType {
	variants: RustPrimitiveEnumVariant[] = [];

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustPrimitiveEnumVariant extends RustType {
	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustArray extends RustType {
	iteratee: RustType;
	length: number | null;
}

export class RustValueEnum extends RustType {
	variantTag: RustStructField | null;
	variants: { [name: string]: RustStructField } = {};

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustTaggedValueEnum extends RustValueEnum {
	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustNullableOption extends RustTaggedValueEnum {
	someVariant: RustStructField;

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

/**
 * This is somewhat similar to the RustTaggedValueEnum, except that it has no tag.
 * Instead, the tag is external, and lives in the RustResult type.
 * Plus, there can only be two variants, either result or error.
 */
export class RustResultValueEnum extends RustType {
	resultVariant: RustStructField;
	errorVariant: RustStructField;

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

class RustEnumVariant extends RustType {
	associatedType: RustType | null;

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustResult extends RustType {
	valueField: RustStructField;
	tagField: RustStructField;

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustFunction extends RustType {
	arguments: RustFunctionArgument[] = [];
	returnValue: RustFunctionReturnValue;

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
}

export class RustLambda extends RustType {
	thisArgument: RustFunctionArgument | null;
	arguments: RustFunctionArgument[] = [];
	returnValue: RustFunctionReturnValue;

	public get name(): string {
		return this._name!;
	}

	public set name(name: string) {
		this._name = name;
	}
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