import * as chai from 'chai';
import Config from '../src/config.mjs';

import * as url from 'url';
import Parser from '../src/parser.mjs';
import {
	ContextualRustType,
	OpaqueRustStruct,
	RustLambda,
	RustPrimitive,
	RustStruct,
	RustTrait
} from '../src/rust_types.mjs';

class TestConfig extends Config {
	private headerPath: string;
	constructor(headerPath: string) {
		super();
		this.headerPath = headerPath;
	}

	getHeaderPath(): string {
		return this.headerPath;
	}
}

describe('Parser Tests', () => {

	it('should parse trait 01', () => {
		const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
		const config = new TestConfig(`${__dirname}/fixtures/trait_test_01.h`);
		const parser = new Parser(config);
		parser.parse();
		const glossary = parser.glossary;
		const glossaryKeys = Object.keys(glossary);

		chai.expect(glossaryKeys.length).equals(3);
		chai.expect(glossaryKeys).contains('LDKRecord');
		chai.expect(glossaryKeys).contains('LDKLogger');

		const ldkRecord = glossary['LDKRecord'];
		chai.assert(ldkRecord instanceof RustStruct);
		chai.expect(ldkRecord.name).equals('LDKRecord');
		chai.expect(ldkRecord.documentation).equals('A Record, unit of logging output with Metadata to enable filtering\nModule_path, file, line to inform on log\'s source');

		const recordFieldKeys = Object.keys(ldkRecord.fields);
		chai.expect(recordFieldKeys.length).equals(2);

		const innerField = ldkRecord.fields['inner'];
		chai.assert(innerField instanceof ContextualRustType);
		chai.expect(innerField.contextualName).equals('inner');
		chai.expect(innerField.documentation).equals('A pointer to the opaque Rust object.\nNearly everywhere, inner must be non-null, however in places where\nthe Rust equivalent takes an Option, it may be set to null to indicate None.');
		chai.expect(innerField.isConstant).equals(true);

		const innerType = innerField.type;
		chai.assert(innerType instanceof OpaqueRustStruct);
		chai.expect(innerType.name).equals('LDKnativeRecord');

		const isOwnedField = ldkRecord.fields['is_owned'];
		chai.assert(isOwnedField instanceof ContextualRustType);
		chai.expect(isOwnedField.contextualName).equals('is_owned');
		chai.expect(isOwnedField.documentation).equals('Indicates that this is the only struct which contains the same pointer.\nRust functions which take ownership of an object provided via an argument require\nthis to be true and invalidate the object pointed to by inner.');

		const isOwnedType = isOwnedField.type;
		chai.assert(isOwnedType instanceof RustPrimitive);
		chai.expect(isOwnedType.cSignature).equals('bool');
		chai.expect(isOwnedType.swiftRawSignature).equals('Bool');

		const ldkLogger = glossary['LDKLogger'];
		chai.assert(ldkLogger instanceof RustTrait);
		chai.expect(ldkLogger.name).equals('LDKLogger');
		chai.expect(ldkLogger.documentation).equals('A trait encapsulating the operations required of a logger');

		const identifier = ldkLogger.identifierField;
		chai.assert(identifier instanceof ContextualRustType);
		chai.expect(identifier.contextualName).equals('this_arg');
		chai.expect(identifier.documentation).equals('An opaque pointer which is passed to your function implementations as an argument.\nThis has no meaning in the LDK, and can be NULL or any other value.');

		const identifierType = identifier.type;
		chai.assert(identifierType instanceof RustPrimitive);
		chai.expect(identifierType.cSignature).equals('void');
		chai.expect(identifierType.swiftRawSignature).equals('Void');

		chai.expect(ldkLogger.lambdas.length).equals(2);
		const logLambda = ldkLogger.lambdas[0];
		const freeLambda = ldkLogger.lambdas[1];

		chai.assert(logLambda instanceof RustLambda);
		chai.assert(freeLambda instanceof RustLambda);

		chai.expect(logLambda.name).equals('log');
		chai.expect(freeLambda.name).equals('free');

		chai.expect(logLambda.documentation).equals('Logs the `Record`');
		chai.expect(freeLambda.documentation).equals('Frees any resources associated with this object given its this_arg pointer.\nDoes not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.');

		chai.assert(logLambda.returnValue.type instanceof RustPrimitive);
		chai.assert(freeLambda.returnValue.type instanceof RustPrimitive);

		const logArguments = logLambda.arguments;
		chai.expect(logArguments.length).equals(1);

		const logArgument = logArguments[0];
		chai.assert(logArgument instanceof ContextualRustType);
		chai.expect(logArgument.contextualName).equals('record');
		chai.expect(logArgument.isPointer).equals(true);
		chai.expect(logArgument.isConstant).equals(true);
		chai.expect(logArgument.isNullable).equals(false);
		chai.expect(logArgument.type).equals(ldkRecord);
	})

})