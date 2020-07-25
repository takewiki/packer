const path = require('path');

module.exports = {
  entry: {
    '#name#': './srcjs/exts/#name#.js'
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, './inst/packer'),
  },
  externals: {
    shiny: 'Shiny',
    jquery: 'jQuery',
  },
};