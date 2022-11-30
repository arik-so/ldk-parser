import {default as debugModule} from 'debug';

const debug = debugModule('ldk-parser:config');

export default class Config {
	static getHeaderPath(): string {
		// test unions
		// return '/Users/arik/Developer/ldk-parser/res/union_test.txt';

		// test results
		// return '/Users/arik/Developer/ldk-parser/res/result_test.txt';

		return '/Users/arik/Developer/ldk-c-bindings/lightning-c-bindings/include/lightning.h';
	}
}