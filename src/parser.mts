import {default as debugModule} from 'debug';
import Config from './config.mjs';
import fs from 'fs';
import {
	ContextualRustType,
	OpaqueRustStruct,
	RustArray,
	RustBinaryOption,
	RustFunction,
	RustKind,
	RustLambda,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveEnumVariant,
	RustResult,
	RustResultValueEnum,
	RustStruct,
	RustStructField,
	RustTaggedValueEnum,
	RustTrait,
	RustType,
	RustVector
} from './rust_types.mjs';

const debug = debugModule('ldk-parser:parser');

const FUNCTION_REGEX = /([A-Za-z_0-9\* ]* \*?)([a-zA-Z_0-9]*)\((.*)\);$/;
const LAMBDA_REGEX = /^(struct |enum |union )?([A-Za-z_0-9]* \*?)\(\*([A-Za-z_0-9]*)\)\((const )?void \*this_arg(.*)\);$/;

export default class Parser {

	private config: Config;
	private headerFile: string;
	/**
	 * All the types
	 * @private
	 */
	private typeGlossary: { [name: string]: RustType } = {};

	/**
	 * Free-floating functions without an associated type
	 */
	private functions: RustFunction[] = [];
	private kindsWithMethodAssociations = new Set();

	constructor(config: Config) {
		this.config = config;
	}

	get glossary() {
		return this.typeGlossary;
	}

	parse() {
		// first, read the header file
		this.readHeaderFile();

		// second, collect all types and methods
		this.collectRawTypes();
	}

	private readHeaderFile() {
		const headerPath = this.config.getHeaderPath();
		const headerData = fs.readFileSync(headerPath);
		this.headerFile = headerData.toString();
	}

	private collectRawTypes() {
		// iterate through the header file and find everything

		const headerLines = this.headerFile.split('\n');
		let isBlockComment = false;
		let aggregateComment = '';
		let blockComment = '';
		let aggregateBlockObject = '';
		let objectLines: ObjectLine[] = [];
		for (let currentLine of headerLines) {
			currentLine = currentLine.trim();

			// handle comments
			{
				if (currentLine.startsWith('/*')) {
					isBlockComment = true;
					aggregateComment = '';
				}
				if (isBlockComment) {
					// remove leading and trailing comment delimiters
					let currentCommentLine = currentLine
					// remove trailing comment delimiters
					.replace(new RegExp('\\*+\\/$', ''), '')
					// remove leading comment delimiters
					.replace(new RegExp('^/?\\*+', ''), '')
					.trim();
					if (currentCommentLine.length > 0) {
						aggregateComment += currentCommentLine;
					}
				}
				if (currentLine.endsWith('*/')) {
					isBlockComment = false;
					continue;
				} else if (isBlockComment) {
					aggregateComment += '\n';
				}

				if (isBlockComment) {
					continue;
				}
			}

			// handle the real stuff

			if (aggregateBlockObject.length > 0) {
				// we are in the midst of parsing a block object
				if (currentLine.startsWith('} ')) {
					// it's over. Now the block object has ended

					const currentBlockObject = aggregateBlockObject;
					aggregateBlockObject = '';

					const currentComment = blockComment.trim();
					blockComment = '';
					aggregateComment = '';

					const currentObjectLines = objectLines.slice(0, objectLines.length);
					objectLines = [];

					this.parseExplicitlyDefinedType(currentBlockObject, currentComment, currentObjectLines);
				} else {
					objectLines.push({code: currentLine, comments: aggregateComment.trim()});
					aggregateComment = '';
				}
			} else if (FUNCTION_REGEX.test(currentLine)) {
				const currentComment = aggregateComment.trim();
				aggregateComment = '';

				this.parseMethod(currentLine, currentComment);
			}

			if (currentLine.startsWith('#include <')) {
				continue;
			}

			if (currentLine.startsWith('typedef')) {
				// memoize the completed comment for the block, because there are gonna be
				// smaller comments inside the object
				blockComment = aggregateComment;

				// make the aggregate block object non-empty so we know we're actively writing one
				aggregateBlockObject += currentLine;
			}
		}
	}

	/**
	 * Basically any type that starts with a typedef declaration. Struct, enum, union
	 * @private
	 */
	private parseExplicitlyDefinedType(blockObject: string, docComment: string, objectLines: ObjectLine[]) {
		const NAME_REGEX = /^typedef (struct|enum|union) (MUST_USE_STRUCT )?(LDK[A-Za-z_0-9]*) {$/;
		const matches = NAME_REGEX.exec(blockObject);
		if (matches && matches.length > 0) {
			const type = matches[1];
			const mustUseStruct = !!matches[2];
			const name = matches[3];

			let descriptor = this.typeGlossary[name];
			if (!descriptor) {
				if (type === 'enum') {
					// either unitary, or union enum
					const isUnitaryEnum = name.endsWith('_Tag');
					descriptor = new RustPrimitiveEnum();
				} else if (type === 'struct') {

					/**
					 * There are several indications that a struct is actually an enum with associated values
					 * 1) it only contains two fields (the tag and the union)
					 * 2) its name with _Tag appended to it already exists in the glossary, and is a `RustPrimitiveEnum`
					 * i. e. if our struct is LDKBech32Error, then we already know about LDKBech32Error_Tag,
					 * which is a primitive enum
					 * 3) its first field is a tag
					 * 4) its second field is the union
					 */

					/**
					 * Separately, there may also be an indication that a struct is actually a Result
					 * 1) If the name starts with LDKCResult_
					 * 2) If the name ends with Z
					 * 3) If the name with Ptr appended to it already exists in the glossary
					 * 4) Aforementioned glossary entry is of type `RustResultValueEnum`
					 */

					/**
					 * Lastly, a struct may also be a trait. That happens if any one of its fields
					 * is a lambda. That's right, we don't mix and match.
					 * We check lambda presence using a simple regex.
					 */

					const hypotheticalTagName = name + '_Tag';
					const hypotheticalResultEnumName = name + 'Ptr';
					if (hypotheticalTagName in this.typeGlossary && this.typeGlossary[hypotheticalTagName] instanceof RustPrimitiveEnum) {
						// it's an enum with associated values, buddy, not a conventional struct
						descriptor = new RustTaggedValueEnum();
						const primitiveEnum = this.typeGlossary[hypotheticalTagName] as RustPrimitiveEnum;
						let enumVariants = primitiveEnum.variants;
						if (enumVariants.length === 2) {
							const variantAName = enumVariants[0].name;
							const variantBName = enumVariants[1].name;
							if ((variantAName.endsWith('_Some') && variantBName.endsWith('_None')) || (variantAName.endsWith('_None') && variantBName.endsWith('_Some'))) {
								descriptor = new RustBinaryOption();
							}
						}

					} else if (hypotheticalResultEnumName in this.typeGlossary && this.typeGlossary[hypotheticalResultEnumName] instanceof RustResultValueEnum) {
						descriptor = new RustResult();
					} else if (this.containsLambdas(objectLines)) {
						descriptor = new RustTrait();
					} else if (name.startsWith('LDKCVec_')) {
						descriptor = new RustVector();
					} else {
						descriptor = new RustStruct();
					}
				} else if (type === 'union') {
					if (name.startsWith('LDKCResult_')) {
						// these are all the different values that a Result type may assume
						descriptor = new RustResultValueEnum();
					} else {
						debug('Unimplemented union type: %s', name);
						process.exit(1);
					}
				}
			}
			descriptor.name = name;
			descriptor.documentation = docComment;
			this.typeGlossary[name] = descriptor;

			if (descriptor instanceof RustPrimitiveEnum) {
				for (const currentValueLine of objectLines) {
					const currentValue = this.parseEnumValue(currentValueLine);
					if (currentValue) {
						descriptor.variants.push(currentValue);
					}
				}
			} else if (descriptor instanceof RustTrait) {
				// RustTrait inherits from RustStruct, so its check must come first
				for (const currentLambdaLine of objectLines) {
					if (!LAMBDA_REGEX.test(currentLambdaLine.code)) {
						const currentField = this.parseStructField(currentLambdaLine);
						if (currentField.contextualName === 'this_arg') {
							descriptor.identifierField = currentField;
						} else {
							debug('Trait %s has transparent field %s:\n> %s', descriptor.name, currentField.contextualName, currentLambdaLine.code);
							descriptor.fields[currentField.contextualName] = currentField;
						}
						continue;
					}
					const currentLambda = this.parseLambda(currentLambdaLine);
					descriptor.lambdas.push(currentLambda);
				}
			} else if (descriptor instanceof RustStruct) {
				for (const currentFieldLine of objectLines) {
					const currentField = this.parseStructField(currentFieldLine);
					if (descriptor instanceof RustVector) {
						if (currentField.contextualName === 'data') {
							descriptor.iterateeField = currentField;
						} else if (currentField.contextualName === 'datalen') {
							descriptor.lengthField = currentField;
						} else {
							console.error(`Unexpected field name inside vector ${descriptor.name}: ${currentField.contextualName}\n>`, currentFieldLine.code);
							process.exit(1);
						}
					}
					descriptor.fields[currentField.contextualName] = currentField;
				}
			} else if (descriptor instanceof RustResultValueEnum) {
				for (const currentEnumLine of objectLines) {
					const currentVariant = this.parseTypeInformation(currentEnumLine.code);
					currentVariant.documentation = currentEnumLine.comments;
					if (currentVariant.contextualName === 'result') {
						descriptor.resultVariant = currentVariant;
					} else if (currentVariant.contextualName === 'err') {
						descriptor.errorVariant = currentVariant;
					} else {
						console.error(`Unexpected variant name inside result value enum ${descriptor.name}: ${currentVariant.contextualName}\n>`, currentEnumLine.code);
						process.exit(1);
					}
				}
			} else if (descriptor instanceof RustResult) {
				for (const currentFieldLine of objectLines) {
					const currentField = this.parseStructField(currentFieldLine);
					if (currentField.contextualName === 'contents') {
						descriptor.valueField = currentField;
					} else if (currentField.contextualName === 'result_ok') {
						descriptor.tagField = currentField;
					} else {
						console.error(`Unexpected field inside result ${descriptor.name}: ${currentField.contextualName}\n>`, currentFieldLine.code);
						process.exit(1);
					}
				}
			} else if (descriptor instanceof RustTaggedValueEnum) {
				let isInsideUnion = false;
				let structDepth = 0;
				for (const [i, currentEnumLine] of objectLines.entries()) {
					if (currentEnumLine.code.startsWith('union {') && !isInsideUnion) {
						isInsideUnion = true;
					} else if (currentEnumLine.code.startsWith('struct {') && isInsideUnion) {
						structDepth++;
					} else if (currentEnumLine.code === '};') {
						if (structDepth > 0) {
							structDepth--;
						} else {
							isInsideUnion = false;
						}
					} else {
						if (i === 0 && !isInsideUnion) {
							const tagField = this.parseStructField(currentEnumLine);
							descriptor.variantTag = tagField;
						} else {
							const currentVariant = this.parseTypeInformation(currentEnumLine.code);
							currentVariant.documentation = currentEnumLine.comments;

							if (descriptor instanceof RustBinaryOption) {
								if (currentVariant.contextualName !== 'some') {
									console.error(`Unexpected variant name inside binary option: ${currentVariant.contextualName}\n>`, currentEnumLine.code);
									process.exit(1);
								}
								if (descriptor.someVariant) {
									console.error('Duplicate attempt to set `some` variant of binary option:\n>', currentEnumLine.code);
									process.exit(1);
								}
								descriptor.someVariant = currentVariant;
							}

							descriptor.variants[currentVariant.contextualName] = currentVariant;
						}
					}

				}
				// const tagField = this.parseStructField(obj)
			}
		}
	}

	private containsLambdas(objectLines: ObjectLine[]): boolean {
		for (const currentLine of objectLines) {
			if (LAMBDA_REGEX.test(currentLine.code)) {
				return true;
			}
		}
		return false;
	}

	private parseEnumValue(objectLine: ObjectLine): RustPrimitiveEnumVariant {
		const value = new RustPrimitiveEnumVariant();
		value.kind = RustKind.EnumValue;
		value.name = objectLine.code.trim();
		if (value.name.endsWith(',')) {
			// remove trailing comma
			value.name = value.name.substring(0, value.name.length - 1);
		}
		if (value.name.endsWith('_Sentinel')) {
			// no need to expose sentinel values to Swift users
			return null;
		}
		value.documentation = objectLine.comments;
		return value;
	}

	private parseStructField(objectLine: ObjectLine): RustStructField {
		const rustType = this.parseTypeInformation(objectLine.code);
		rustType.documentation = objectLine.comments;
		return rustType;
	}

	/**
	 * Parse the type and variable name information from a single field line of an object
	 * @param typeLine
	 * @private
	 */
	private parseTypeInformation(typeLine: string): ContextualRustType {
		let rustType = null;

		let relevantTypeLine = typeLine;

		if (relevantTypeLine.endsWith(';')) {
			// remove trailing semicolon
			relevantTypeLine = relevantTypeLine.substring(0, relevantTypeLine.length - 1);
		}

		const mustUseRes = relevantTypeLine.startsWith('MUST_USE_RES ');
		if (mustUseRes) {
			relevantTypeLine = relevantTypeLine.substring('MUST_USE_RES '.length);
		}

		let isConstant = relevantTypeLine.startsWith('const ');
		if (isConstant) {
			relevantTypeLine = relevantTypeLine.substring('const '.length);
		}

		const nonNullablePointer = relevantTypeLine.includes('NONNULL_PTR ');
		if (nonNullablePointer) {
			relevantTypeLine = relevantTypeLine.replace('NONNULL_PTR ', '');
		}

		let typelessLineRemainder = relevantTypeLine;
		if (relevantTypeLine.startsWith('uint8_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint8_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint8_t';
				rustType.swiftRawSignature = 'UInt8';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uintptr_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uintptr_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uintptr_t';
				rustType.swiftRawSignature = 'UInt';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uint16_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint16_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint16_t';
				rustType.swiftRawSignature = 'UInt16';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uint32_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint32_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint32_t';
				rustType.swiftRawSignature = 'UInt32';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('uint64_t')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('uint64_t'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'uint64_t';
				rustType.swiftRawSignature = 'UInt64';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('bool')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('bool'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'bool';
				rustType.swiftRawSignature = 'Bool';
				rustType.kind = RustKind.Primitive;
			}
		} else if (relevantTypeLine.startsWith('void')) {
			rustType = new RustPrimitive();
			typelessLineRemainder = relevantTypeLine.substring('void'.length).trim();
			if (rustType instanceof RustPrimitive) {
				rustType.cSignature = 'void';
				rustType.swiftRawSignature = 'Void';
				rustType.kind = RustKind.Primitive;
			}
		} else {
			let unprefixedTypeLine = relevantTypeLine;

			// TODO: figure out why these prefixes sometimes exist
			if (relevantTypeLine.startsWith('struct ')) {
				unprefixedTypeLine = relevantTypeLine.substring('struct '.length).trim();
			} else if (relevantTypeLine.startsWith('enum ')) {
				unprefixedTypeLine = relevantTypeLine.substring('enum '.length).trim();
			} else if (relevantTypeLine.startsWith('union ')) {
				unprefixedTypeLine = relevantTypeLine.substring('union '.length).trim();
			}

			const components = unprefixedTypeLine.split(' ');
			if (components.length >= 1) {
				const typeName = components[0];
				let variableName = null;

				if (components.length === 2) {
					variableName = components[1];
				} else if (components.length > 2) {
					console.error('Excessive type component count:\n>', typeLine);
					process.exit(1);
				}

				if (typeName in this.typeGlossary) {
					rustType = this.typeGlossary[typeName];
					typelessLineRemainder = variableName;
				} else if (typeName.startsWith('LDKnative') && variableName.endsWith('inner')) {
					rustType = new OpaqueRustStruct();
					rustType.name = typeName;
					this.typeGlossary[typeName] = rustType;
					typelessLineRemainder = variableName;
					debug('New opaque type detected: %s\n> %s', typeName, typeLine);
				} else {
					console.error('Unknown non-primitive type:\n>', typeLine);
					process.exit(1);
				}
			}
		}
		// continue for other types

		if (typelessLineRemainder && typelessLineRemainder.startsWith('*')) {
			typelessLineRemainder = typelessLineRemainder.substring('*'.length).trim();
			if (isConstant) {
				// duplicate constant declaration. Find out why this is necessary
			} else {
				// singular constant declaration. Find out why this is necessary
			}
			isConstant = true;
		}

		let contextualName = typelessLineRemainder;

		const FIXED_LENGTH_ARRAY_REGEX = /[a-zA-Z0-9_]+ ([a-zA-Z0-9_]+)\[([1-9][0-9]*)\]/;
		const arrayMatch = FIXED_LENGTH_ARRAY_REGEX.exec(relevantTypeLine);
		if (arrayMatch && arrayMatch.length > 0) {
			const name = arrayMatch[1];
			const length = parseInt(arrayMatch[2]);
			const actualType = new RustArray();
			actualType.iteratee = rustType;
			actualType.length = length;
			actualType.kind = RustKind.Array;
			rustType = actualType;
			contextualName = name;
		} else if (!rustType) {
			console.error('Unknown type information:\n>', typeLine);
			process.exit(1);
		}

		const returnedType = new ContextualRustType();
		returnedType.type = rustType;
		returnedType.contextualName = contextualName;
		returnedType.isConstant = isConstant;
		if (nonNullablePointer) {
			returnedType.isNullable = false;
			returnedType.isPointer = true;
		}
		return returnedType;
	}

	private parseLambda(objectLine: ObjectLine): RustLambda {
		const matches = LAMBDA_REGEX.exec(objectLine.code);

		const returnType = matches[2];
		const name = matches[3];
		const isThisArgConst = !!matches[4];
		const argumentLine = matches[5];
		const argumentStrings = argumentLine.split(', ');

		const lambda = new RustLambda();
		lambda.returnValue = this.parseTypeInformation(returnType.trim());
		lambda.returnValue.isReturnValue = true;
		lambda.name = name;
		lambda.documentation = objectLine.comments;

		for (let currentArgumentLine of argumentStrings) {
			currentArgumentLine = currentArgumentLine.trim();
			if (currentArgumentLine.length < 1) {
				continue;
			}
			const currentArgument = this.parseTypeInformation(currentArgumentLine.trim());
			lambda.arguments.push(currentArgument);
		}

		return lambda;
	}

	/**
	 *
	 * @param methodLine
	 * @param docComment
	 * @private
	 */
	private parseMethod(methodLine: string, docComment: string) {
		const matches = FUNCTION_REGEX.exec(methodLine);

		const returnType = matches[1];
		const name = matches[2];
		const argumentLine = matches[3];
		const argumentStrings = argumentLine.split(', ');

		const method = new RustFunction();
		method.returnValue = this.parseTypeInformation(returnType.trim());
		method.returnValue.isReturnValue = true;
		method.name = name;
		method.documentation = docComment;

		for (let currentArgumentLine of argumentStrings) {
			currentArgumentLine = currentArgumentLine.trim();
			if (currentArgumentLine.length < 1) {
				continue;
			}
			const currentArgument = this.parseTypeInformation(currentArgumentLine.trim());
			method.arguments.push(currentArgument);
		}

		/**
		 * If a method has a name like CVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ_free
		 * Then the object it belongs to is CVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ
		 * Finding that object name is a matter of finding the first entry of the method
		 * following an underscore that is lowercase.
		 *
		 * Another nasty example is CResult__u832APIErrorZ_ok
		 * There, too, we find CResult__u832APIErrorZ as the prefix because the first underscore
		 * is not followed by a lowercase letter, but rather by another underscore.
		 *
		 * However, even that rule may sometimes have an exception, such as here:
		 * C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone
		 * The exception being that if an underscore is followed by a u16/u32 (u with numbers),
		 * it's acceptable.
		 *
		 * Additionally, CResult_boolPeerHandleErrorZ_ok is also valid.
		 *
		 */

		const METHOD_TYPE_ASSOCIATION_PREFIX_REGEX = /^([A-Z][a-zA-Z0-9]*)(_([A-Z_][a-zA-Z0-9]*))*(_(u5|u8|u16|u32|u64|usize|bool)[a-zA-Z0-9]+)?/;
		const prefixMatches = METHOD_TYPE_ASSOCIATION_PREFIX_REGEX.exec(name);
		if (!prefixMatches) {
			// debug('object-unassociated method name: %s', name);
			this.functions.push(method);
			return;
		}

		const namePrefix = prefixMatches[0];
		for (const [typeName, currentType] of Object.entries(this.typeGlossary)) {
			if (typeName.startsWith(`LDK${namePrefix}`) && typeName.endsWith(namePrefix)) {
				// debug('Method association: %s -> %s', name, typeName);

				// this is purely for curiosity
				let typeKind = currentType.constructor.name;
				if (!this.kindsWithMethodAssociations.has(typeKind)) {
					debug('Kind using methods: %s (first instance: %s)', typeKind, typeName);
					this.kindsWithMethodAssociations.add(typeKind);
				}

				const methodsArray = currentType['methods'];
				if (!Array.isArray(methodsArray)) {
					console.error(`Type ${typeName} of kind ${typeKind} is missing a methods property for ${name}!\n>`, methodLine);
					process.exit(1);
				}

				methodsArray.push(method);
				return;
			}
		}

		console.error(`Method ${name} cannot finds its associated type!\n>`, methodLine);
		process.exit(1);
	}

}

interface ObjectLine {
	comments: string,
	code: string
}

