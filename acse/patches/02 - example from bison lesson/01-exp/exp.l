%{
#include "exp.parser.h"
#include <stdio.h>
%}
DIGIT [0-9]
NL \n
%option noyywrap
%%
[ \t\r\n]+   {}
{DIGIT}+ { yylval.value = atoi(yytext); return NUMBER; }
"+"      { return '+'; }
"-"      { return '-'; }
";"      { return ';'; }
.        { return LEX_ERR; }
%%
