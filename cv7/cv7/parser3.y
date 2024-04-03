%{
   void yyerror(char *);
   int yylex(void);
   #define YYDEBUG 1 /* redundant, typically included in makefile */
   #include <stdio.h>
   #include "parser3.tab.h"
%}

%token A_TOK B_TOK C_TOK D_TOK E_TOK F_TOK G_TOK H_TOK

%%
S: A B {printf("Correct derivation.\n");};
A: A_TOK H_TOK | A_TOK B_TOK A C_TOK | A_TOK B C_TOK;
B: C D E ;
C: D_TOK | E_TOK;
D: F_TOK D | F_TOK;
E: B | G_TOK;

%%

void yyerror (char *s)
{
  /* fprintf (stderr, "%s\n", s); */
  printf("Incorrect derivation!\n");
}

int main(void)
{
#if YYDEBUG
  yydebug = 0;
#endif
	if(!yyparse())
		printf("End of input reached\n");
	return 0;
}

