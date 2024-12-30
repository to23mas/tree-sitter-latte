/**
 * @file Parser for html extension Latte
 * @author Tomáš Míčka <to23mas@gmail.com>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check
// comment: () => seq('{*', /[^#]*\#+([^\}#][^#]*\#+)*/, '}'),
module.exports = grammar({
  name: "latte",
  rules: {
    source_file: $ => repeat($._node),
    _node: $ => choice($.comment, $.content),
    content: () => prec.right(repeat1(/[^\{]+|\{/)),
    comment: () => seq('{*', /[^*]*\*+([^\}*][^*]*\*+)*/, '}'),
  }
});
