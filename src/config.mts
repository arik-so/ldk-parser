import {default as debugModule} from 'debug';
import url from 'url';

const debug = debugModule('ldk-parser:config');

export default class Config {

	getHeaderPath(): string {
		const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
		return `${__dirname}/../../ldk-c-bindings/lightning-c-bindings/include/lightning.h`;
	}

	getOutputBaseDirectoryPath(): string {
		const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
		return `${__dirname}/../out`;
	}
}