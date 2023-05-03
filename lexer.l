%{
#include <stdio.h>
%}

%option noyywrap

T_RES        (procedure|array|node|if|then|elseif|else|case|endcase|while|do|endwhile|repeat|until|loop|forever|for|endfor|input|output|call|return|stop|end|floor|ceil|log|goto|by)
T_UnaryOp    (not)
T_ExpoOp     (\^)
T_MDOp       (\*|\/|mod)
T_ASOp       (\+|-)
T_RelOp      (==|<=|>=|!=|<|>)
T_LogicOp    (and|or)
T_AssignOp   (=)
T_Delim      ([,:;\(\)\[\]\{\}])
T_ID         ([a-zA-Z_][a-zA-Z0-9_]*)
T_NumLit     (-?([0-9]+(\.[0-9]+)?))
T_StrLitD    \"([^\"]|\\.)*?\"
T_StrLitS    \'([^\']|\\.)*?\'

%%

{T_RES}      { printf("Keyword: %s\n", yytext); }
{T_UnaryOp}  { printf("Unary Operator: %s\n", yytext); }
{T_ExpoOp}   { printf("Exponentiation: %s\n", yytext); }
{T_MDOp}     { printf("Multiplication or Division Operator: %s\n", yytext); }
{T_ASOp}     { printf("Addition or Subtraction Operator: %s\n", yytext); }
{T_RelOp}    { printf("Relational Operator: %s\n", yytext); }
{T_LogicOp}  { printf("Logical Operator: %s\n", yytext); }
{T_AssignOp} { printf("Assignment Operator: %s\n", yytext); }
{T_Delim}    { printf("Delimiter: %s\n", yytext); }
{T_ID}       { printf("Identifier: %s\n", yytext); }
{T_NumLit}   { printf("Numeric Literal: %s\n", yytext); }
{T_StrLitD}  { printf("String Literal: %s\n", yytext); }
{T_StrLitS}  { printf("String Literal: %s\n", yytext); }

[ \t\n]+      { /* Ignore whitespace, tab, and newline characters */ }
.             { printf("Unrecognized character: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}
