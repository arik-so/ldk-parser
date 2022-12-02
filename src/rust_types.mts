// export const GLOSSARY: { [name: string]: RustType } = {};

export abstract class RustType {
	/**
	 * Raw name of the struct/enum/function etc. Can be something like `LDKAccessError`
	 * or `LockedChannelMonitor_free`
	 *
	 * Some types may be unnamed if they're simply generic arrays
	 */
	name: string | null;

	/**
	 *
	 */
	kind: RustKind;

	/**
	 * Rustdoc comments preceding the type
	 */
	documentation: string;
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
}

export class OpaqueRustStruct extends RustType {
}

export class RustStruct extends RustType {
	fields: { [name: string]: RustStructField } = {};
	methods: RustFunction[] = [];
}

export class RustTuple extends RustStruct {}

export class RustVector extends RustStruct {
	iterateeField: ContextualRustType;
	lengthField: ContextualRustType;
}

export class RustTrait extends RustStruct {
	identifierField: ContextualRustType;
	lambdas: RustLambda[] = [];
}

export class RustPrimitiveEnum extends RustType {
	variants: RustPrimitiveEnumVariant[] = [];
	methods: RustFunction[] = [];
}

export class RustPrimitiveEnumVariant extends RustType {
}

export class RustArray extends RustType {
	iteratee: RustType;
	length: number | null;
}

export class RustValueEnum extends RustType {
	variantTag: RustStructField | null;
	variants: { [name: string]: ContextualRustType } = {};
}

export class RustTaggedValueEnum extends RustValueEnum {
	methods: RustFunction[] = [];
}

export class RustNullableOption extends RustTaggedValueEnum {
	someVariant: ContextualRustType;
}

/**
 * This is somewhat similar to the RustTaggedValueEnum, except that it has no tag.
 * Instead, the tag is external, and lives in the RustResult type.
 * Plus, there can only be two variants, either result or error.
 */
export class RustResultValueEnum extends RustType {
	resultVariant: ContextualRustType;
	errorVariant: ContextualRustType;
}

class RustEnumVariant extends RustType {
	associatedType: RustType | null;
}

export class RustResult extends RustType {
	valueField: RustStructField;
	tagField: RustStructField;
	methods: RustFunction[] = [];
}

export class RustFunction extends RustType {
	arguments: RustFunctionArgument[] = [];
	returnValue: ContextualRustType;
}

export class RustLambda extends RustType {
	arguments: RustFunctionArgument[] = [];
	returnValue: ContextualRustType;
}

export class ContextualRustType {
	type: RustType;

	/**
	 * This is usually a variable name, an argument name, or a field name
	 */
	contextualName: string | null;

	isPointer: boolean;
	isNullable: boolean;
	isConstant: boolean;

	isReturnValue: boolean;

	/**
	 * Rustdoc comments preceding the type
	 */
	documentation: string;
}

export class RustStructField extends ContextualRustType {
}

export class RustFunctionArgument extends ContextualRustType {
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