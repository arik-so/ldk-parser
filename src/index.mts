import Parser from './parser.mjs';
import Config from './config.mjs';
import Generator from './generation/index.mjs';

(async () => {
	// add comments
	let config = new Config();

	const parser = new Parser(config);
	parser.parse();

	const generator = new Generator(parser);

	// optional, only if we wanna remove existing artifacts
	// generator.initializeOutputDirectory();

	await generator.generateTypes();
	await generator.generateFunctions();
})();