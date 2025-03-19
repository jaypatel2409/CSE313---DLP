%{
#include <stdio.h>
%}

/* Define macros for token patterns */
KEYWORD    "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
CONSTANT    [0-9]+(\.[0-9]+)?
STRING      \"(\\.|[^\\\"])*\"|'(\\.|[^\\'])'
PUNCTUATION [(){}[\\],;:.]
OPERATOR    [+\-/*%=<>!&|^~]
COMMENT     \/\*([^*]|\*+[^*/])*\*+\/|\/\/.*
WHITESPACE  [ \t\n]+  

%%   // <---- Section separator

{KEYWORD}       { printf("Keyword: %s\n", yytext); }
{IDENTIFIER}    { printf("Identifier: %s\n", yytext); }
{CONSTANT}      { printf("Constant: %s\n", yytext); }
{STRING}        { printf("String: %s\n", yytext); }
{PUNCTUATION}   { printf("Punctuation: %s\n", yytext); }
{OPERATOR}      { printf("Operator: %s\n", yytext); }
{COMMENT}       { /* Ignore comments */ }
{WHITESPACE}    { /* Ignore white spaces */ }
.               { printf("Lexical Error: %s\n", yytext); }

%%   // <---- Section separator

int yywrap() { return 1; }

int main() {
    yylex();
    return 0;
}
