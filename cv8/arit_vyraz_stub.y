%{
#include <stdio.h>

void yyerror(char *);


%}



/* V prvni fazi reseni zde nebude nic */
/* Ve druhe fazi reseni sem doplnite logiku odstraneni konfliktu */
%token NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UNARY

%%

/*  Sem doplnte gramaticka pravidla pro statement a expression
	statement:	pouze jedna prava strana ;
	expression:	osm alternativ pro pravou stranu ;
*/

statement: 
  expression
	;
	
expression: 
  expression '+' expression
	|	expression '-' expression
	|	expression '*' expression
	|	expression '/' expression
	|	'-' expression %prec UNARY
	|	'+' expression %prec UNARY
	|	'(' expression ')'
	|	NUMBER
	;


%%
void yyerror (char *s)
{
   printf("Syntakticka chyba\n");
}

main ()
{
  if(!yyparse ())
  printf("OK\n");
}
