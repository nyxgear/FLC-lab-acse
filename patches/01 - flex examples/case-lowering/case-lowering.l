
%option noyywrap
UPPER [A-Z]

%%

{UPPER} { printf("%c", tolower(*yytext)); }

%%

int main(int argc, char* argv[]) {
  return yylex();
}
