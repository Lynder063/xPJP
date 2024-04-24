%{
#define YYDEBUG 1
#include <stdio.h>

void yyerror(char *);
int yylex(void);

%}

%token NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%

statement :	expression
	;

expression:	expression '+' expression
	|	expression '-' expression
	|	expression '*' expression
	|	expression '/' expression
	|	'-' expression %prec UMINUS
	|	'+' expression %prec UMINUS
	|	'(' expression ')'
	|	NUMBER
	;

%%

void yyerror (char *s)
{
   printf("Syntaktická chyba\n");
}

main ()
{
  if(!yyparse ())
  printf("OK\n");
}