import Parser from './parser.mjs';
import Config from './config.mjs';

// add comments
let config = new Config();
const parser = new Parser(config);
parser.parse();
debugger