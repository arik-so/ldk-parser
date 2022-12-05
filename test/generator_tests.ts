import url from 'url';
import Parser from '../src/parser.mjs';
import Config from '../src/config.mjs';
import StructGenerator from '../src/generation/struct_generator.mjs';
import {expect} from 'chai';
import {describe} from 'mocha';
import {
	RustNullableOption,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustVector
} from '../src/rust_types.mjs';
import NullableOptionGenerator from '../src/generation/nullable_option_generator.mjs';
import VectorGenerator from '../src/generation/vector_generator.mjs';
import ComplexEnumGenerator from '../src/generation/complex_enum_generator.mjs';
import ResultGenerator from '../src/generation/result_generator.mjs';
import PrimitiveWrapperGenerator from '../src/generation/primitive_wrapper_generator.mjs';

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

describe('Generator Tests', () => {

	describe('Struct Generation Tests', () => {
		it('should generate ChainMonitor partially', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/chain_monitor_test_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const chainMonitor = <RustStruct>parser.glossary['LDKChainMonitor'];
			const generator = new StructGenerator(config);
			const output = generator.generateFileContents(chainMonitor);

			expect(output).contains('public typealias ChainMonitor = Bindings.ChainMonitor');
			expect(output).contains('internal var cType: LDKChainMonitor?');
			expect(output).contains('public init(chainSource: Filter?) {');
			expect(output).contains('public func getClaimableBalances() -> [UInt8] {');
			expect(output).contains('internal func free() {');

			expect(output).contains('let chainSourceOption = Option_FilterZ(value: chainSource)');
			expect(output).contains('let nativeCallResult = ChainMonitor_free(self.cType!)');
		});

		it('should generate ChainMonitor completely', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/../res/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const chainMonitor = <RustStruct>parser.glossary['LDKChainMonitor'];
			const generator = new StructGenerator(config);
			const output = generator.generateFileContents(chainMonitor);
			// debugger
		});
	});

	describe('Nullable Option Generation Tests', () => {
		it('should generate binary option 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/option_u32_test.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			const option = <RustNullableOption>glossary['LDKCOption_u32Z'];
			const generator = new NullableOptionGenerator(config);
			const output = generator.generateFileContents(option);
			// debugger
		});
	});

	describe('Vector Generation Tests', () => {
		it('should generate Vec<Vec<RouteHop>>', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/vec_vec_route_hop_test.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			const routeVectorVector = <RustVector>glossary['LDKCVec_CVec_RouteHopZZ'];
			const generator = new VectorGenerator(config);
			const output = generator.generateFileContents(routeVectorVector);

			const routeVector = <RustVector>glossary['LDKCVec_RouteHopZ'];
			const subOutput = generator.generateFileContents(routeVector);
			const aggregateOutput = subOutput + output;
		});
	});

	describe('Complex Enum Generation Tests', () => {
		it('should generate payment send failure completely', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/../res/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const paymentSendFailure = <RustTaggedValueEnum>parser.glossary['LDKPaymentSendFailure'];
			const generator = new ComplexEnumGenerator(config);
			const output = generator.generateFileContents(paymentSendFailure);
		})
	});

	describe('Result Generation Tests', () => {
		it('should generate channel config decore error completely', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/../res/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const channelConfigDecodeError = <RustResult>parser.glossary['LDKCResult_ChannelConfigDecodeErrorZ'];
			const generator = new ResultGenerator(config);
			const output = generator.generateFileContents(channelConfigDecodeError);
		})
	});

	describe('Primitive Wrapper Generation Tests', () => {
		it('should generate LDKu5', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/../res/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const generator = new PrimitiveWrapperGenerator(config);

			const ldku5 = <RustPrimitiveWrapper>parser.glossary['LDKu5'];
			const ldkStr = <RustPrimitiveWrapper>parser.glossary['LDKStr'];
			const thirtyTwoBytes = <RustPrimitiveWrapper>parser.glossary['LDKThirtyTwoBytes'];

			const thirtyTwoBytesOutput = generator.generateFileContents(thirtyTwoBytes);
			const strOutput = generator.generateFileContents(ldkStr);
			const u5Output = generator.generateFileContents(ldku5);
			debugger
		})
	})

});