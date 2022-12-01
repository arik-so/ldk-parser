import {default as debugModule} from 'debug';

const debug = debugModule('ldk-parser:config');

export default class Config {

	getHeaderPath(): string {
		// test unions
		// return '/Users/arik/Developer/ldk-parser/res/union_test.h';

		// test results
		// return '/Users/arik/Developer/ldk-parser/res/result_test.h';

		// test traits
		// return '/Users/arik/Developer/ldk-parser/res/trait_test.h';

		return '/Users/arik/Developer/ldk-c-bindings/lightning-c-bindings/include/lightning.h';
	}
}