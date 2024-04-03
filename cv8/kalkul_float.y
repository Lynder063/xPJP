%{
#include <math.h>
#include <stdio.h>

void yyerror(char *);
int yylex(void);
extern int yylineno;

%}

/* 
Zde budou nasledujici deklarace:

	%union pro typ dval odpovidaji formatu double

	Jmena a typy tokenu pro cislo, odmocninu a logaritmus, napr.
		%token <dval> NUMBER

	Prirazeni typu dval pravidlu expression

	Logika odstraneni konfliktu, stejna jako v predchozim prikladu

*/


%%

/*  Sem doplnte gramaticka pravidla pro opakovany statement, jednoduchy statement a expression
		opakovany statement: dve aktivni prave strany + pripadne upresnujici chybove hlaseni;
		statement:	pouze jedna prava strana ;
		expression:	deset alternativ pro pravou stranu ;
			zahrnuji vsechny predchozi pripady
			pridava se osetreni deleni nulou a akce pro funkce sqrt a log
*/

%%

void yyerror (char *s)
{
  /* oproti predchozimu prikladu zde zobrazte i cislo chyboveho radku */
}

int main(void)
{
  if(!yyparse ())
    printf("OK\n");
  return 0;
}

