import {default as debugModule} from 'debug';
import Config from './config.mjs';
import fs from 'fs';
import {
	ContextualRustType,
	GLOSSARY,
	RustArray,
	RustKind,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveEnumVariant, RustResult, RustResultValueEnum,
	RustStruct,
	RustStructField, RustTaggedValueEnum,
	RustValueEnum
} from './rust_types.mjs';

const debug = debugModule('ldk-parser:parser');

// here we go
debug('Here we go');

const FUNCTION_REGEX = /([A-Za-z_0-9\* ]* \*?)([a-zA-Z_0-9]*)\((.*)\);$/;

export default class Parser {

	private headerFile: string;

	parse() {
		// first, read the header file
		this.readHeaderFile();

		// second, collect all types and methods
		this.collectRawTypes();
		// this.collectRawMethods();
	}

	private readHeaderFile() {
		const headerPath = Config.getHeaderPath();
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

			if (aggregateBlockObject.length > 0) {
				if (currentLine.startsWith('} ')) {
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
			}

			// handle the real stuff
			if (currentLine.startsWith('#include <')) {
				continue;
			}

			if (currentLine.startsWith('typedef')) {
				blockComment = aggregateComment;
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

			let descriptor = GLOSSARY[name];
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

					const hypotheticalTagName = name + '_Tag';
					const hypotheticalResultEnumName = name + 'Ptr';
					if (hypotheticalTagName in GLOSSARY && GLOSSARY[hypotheticalTagName] instanceof RustPrimitiveEnum) {
						// it's an enum with associated values, buddy, not a conventional struct
						descriptor = new RustTaggedValueEnum();
					} else if(hypotheticalResultEnumName in GLOSSARY && GLOSSARY[hypotheticalResultEnumName] instanceof RustResultValueEnum) {
						descriptor = new RustResult();
					} else {
						descriptor = new RustStruct();
					}
				} else if (type === 'union') {
					if (name.startsWith('LDKCResult_')) {
						// these are all the different values that a Result type may assume
						descriptor = new RustResultValueEnum()
					} else {
						console.log(name);
						// unimplemented
						process.exit(1);
					}
				}
			}
			descriptor.name = name;
			descriptor.documentation = docComment;
			GLOSSARY[name] = descriptor;

			if (descriptor instanceof RustPrimitiveEnum) {
				for (const currentValueLine of objectLines) {
					const currentValue = this.parseEnumValue(currentValueLine);
					if (currentValue) {
						descriptor.values.push(currentValue);
					}
				}
			} else if (descriptor instanceof RustStruct) {
				for (const currentFieldLine of objectLines) {
					const currentField = this.parseStructField(currentFieldLine);
					descriptor.fields[currentField.contextualName] = currentField
				}
			} else if (descriptor instanceof RustResultValueEnum) {
				for (const currentEnumLine of objectLines) {
					const currentVariant = this.parseTypeInformation(currentEnumLine.code);
					currentVariant.documentation = currentEnumLine.comments;
					descriptor.variants[currentVariant.contextualName] = currentVariant;
				}
			} else if (descriptor instanceof RustResult) {
				debugger
			}else if (descriptor instanceof RustTaggedValueEnum) {
				let isInsideUnion = false;
				let structDepth = 0;
				for (const [i, currentEnumLine] of objectLines.entries()){
					if (currentEnumLine.code.startsWith('union {') && !isInsideUnion) {
						isInsideUnion = true;
					} else if (currentEnumLine.code.startsWith('struct {') && isInsideUnion) {
						structDepth++;
					} else if (currentEnumLine.code === '};') {
						if (structDepth > 0){
							structDepth--;
						}else{
							isInsideUnion = false;
						}
					} else {
						if (i === 0 && !isInsideUnion){
							const tagField = this.parseStructField(currentEnumLine);
							descriptor.variantTag = tagField;
						} else {
							const currentVariant = this.parseTypeInformation(currentEnumLine.code);
							currentVariant.documentation = currentEnumLine.comments;
							descriptor.variants[currentVariant.contextualName] = currentVariant;
						}
					}

				}
				// const tagField = this.parseStructField(obj)
			}
		}
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

		const nonNullablePointer = relevantTypeLine.includes('NONNULL_PTR');
		if (nonNullablePointer) {
			relevantTypeLine = relevantTypeLine.replace('NONNULL_PTR', '');
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
			if (relevantTypeLine.startsWith('struct ')){
				unprefixedTypeLine = relevantTypeLine.substring('struct '.length).trim()
			}else if (relevantTypeLine.startsWith('enum ')){
				unprefixedTypeLine = relevantTypeLine.substring('enum '.length).trim()
			}

			const components = unprefixedTypeLine.split(' ');
			if (components.length === 2) {
				const typeName = components[0];
				const variableName = components[1];
				if (typeName in GLOSSARY) {
					rustType = GLOSSARY[typeName];
					typelessLineRemainder = variableName;
				} else {
					console.log('Unknown non-primitive type:\n>', typeLine);
				}
			}
		}
		// continue for other types

		if (typelessLineRemainder.startsWith('*')) {
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
			console.log('Unparsed type information:\n>', typeLine);
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

	private collectRawMethods() {

	}

}

interface ObjectLine {
	comments: string,
	code: string
}

