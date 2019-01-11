%{
#include <math.h>
#include "scope-exp.h"

int yylex();
void yyerror(const char *);

%}
%union {
  struct expr_t expr;
  char *svalue;
  int ivalue;
}

%token <ivalue> NUMBER
%token <svalue> ID
%token LET LEX_ERR

%type <expr> exp
%type <ivalue> program;

%left '+' '-'
%left '*' '/' '%'
%right '^'
%right OP_UMINUS

%define parse.error verbose
%start program
%%
program : exp { $$ = 0; print_result(&$1, $$); }
        | program ';' exp { $$ = $1 + 1; print_result(&$3, $$); }
        ;

exp : exp '+' exp { $$.value = $1.value + $3.value;
                    $$.poison = $1.poison || $3.poison; }
    | exp '-' exp { $$.value = $1.value - $3.value;
                    $$.poison = $1.poison || $3.poison; }
    | exp '*' exp { $$.value = $1.value * $3.value;
                    $$.poison = $1.poison || $3.poison; }
    | exp '/' exp { $$.value = $1.value / $3.value;
                    $$.poison = $1.poison || $3.poison; }
    | exp '%' exp { $$.value = $1.value % $3.value;
                    $$.poison = $1.poison || $3.poison || ($3.value == 0); }
    | exp '^' exp { $$.value = pow($1.value, $3.value);
                    $$.poison = $1.poison || $3.poison; }
    | '-' exp %prec OP_UMINUS { $$ = $2; $$.value = -$$.value; }
    | NUMBER { $$.value = $1; $$.poison = 0; }
    | ID { $$ = get_value($1); free($1); }
    | '[' LET { push_scope(); } var_list ']'
      '{' exp '}' { $$ = $7; pop_scope(); }
    | '(' exp ')' { $$ = $2; }
    ;

var_list : var_list ',' var_decl
         | var_decl
         ;

var_decl : ID '=' NUMBER { decl_var($1, $3); }
         | ID '=' '?' { decl_var_input($1); }
         ;
%%

