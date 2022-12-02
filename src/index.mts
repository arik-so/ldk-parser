import Parser from './parser.mjs';
import Config from './config.mjs';
import Generator from './generation/index.mjs';

// add comments
let config = new Config();

const parser = new Parser(config);
parser.parse();

// const generator = new Generator(parser);
// generator.generateTypes();
debugger