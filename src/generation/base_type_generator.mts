import Config from '../config.mjs';
import {RustType} from '../rust_types.mjs';

/**
 * Generates just one individual type. Each kind has its own implementation.
 */
export abstract class BaseTypeGenerator {

	protected config: Config;

	constructor(config: Config) {
		this.config = config;
	}

	/**
	 *
	 * @param type
	 */
	abstract generate(type: RustType);

}