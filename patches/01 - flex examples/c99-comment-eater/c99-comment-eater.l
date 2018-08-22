
%x COMMENT
%option noyywrap

%{
  #define MAX_DEPTH 10
  
  int nest = 0;
  int caller[MAX_DEPTH];
%}

%%

<INITIAL>[^/]*      { ECHO; }
<INITIAL>"/"+[^*/]* { ECHO; }
<INITIAL>"/*"       {
                      caller[nest++] = YY_START;
                      BEGIN(COMMENT);
                    }

<COMMENT>[^/*]*
<COMMENT>"/"+[^*/]*
<COMMENT>"/*"       {
                      caller[nest++] = YY_START;
                      BEGIN(COMMENT);
                    }
<COMMENT>"*"+[^*/]*
<COMMENT>"*"+"/"    { BEGIN ( caller [-- nest ]); }

%%

int main(int argc , char* argv[]) {
  return yylex();
}
