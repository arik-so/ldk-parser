import url from 'url';
import Parser from '../src/parser.mjs';
import Config from '../src/config.mjs';
import StructGenerator from '../src/generation/struct_generator.mjs';

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

			const chainMonitor = parser.glossary['LDKChainMonitor'];
			const generator = new StructGenerator(config);
			const output = generator.generateFileContents(chainMonitor);
			debugger
		});
	});

});