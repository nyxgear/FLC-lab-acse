
%option noyywrap
UPPER [A-Z]

%%

{UPPER} { }

%%

int main(int argc, char* argv[]) {
  return yylex();
}
