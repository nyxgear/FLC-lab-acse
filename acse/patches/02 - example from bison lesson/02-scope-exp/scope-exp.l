%{
#include <stdio.h>
#include <string.h>
#include "scope-exp.h"
#include "scope-exp.parser.h"
%}
DIGIT [0-9]
ALPHA [A-Za-z_]
%option noyywrap
%%
[ \t\r\n]+   {}
{DIGIT}+ { yylval.ivalue = atoi(yytext); return NUMBER; }
"+"      { return '+'; }
"-"      { return '-'; }
"*"      { return '*'; }
"/"      { return '/'; }
"^"      { return '^'; }
"%"      { return '%'; }
";"      { return ';'; }
"?"      { return '?'; }
"="      { return '='; }
","      { return ','; }
"("      { return '('; }
")"      { return ')'; }
"["      { return '['; }
"]"      { return ']'; }
"{"      { return '{'; }
"}"      { return '}'; }
"let"    { return LET; }
{ALPHA}+ { yylval.svalue = strdup(yytext); return ID; }
.        { return LEX_ERR; }
%%
