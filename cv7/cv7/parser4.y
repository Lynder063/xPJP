%{
   void yyerror(char *);
   int yylex(void);
   #define YYDEBUG 1 /* redundant, typically included in makefile */
   #include <stdio.h>
   #include "parser4.tab.h"
%}

%%
S: A B {printf("Correct derivation.\n");};
A: 'a' 'h' | 'a' 'b' A 'c' | 'a' B 'c';
B: C D E ;
C: 'd' | 'e';
D: 'f' D | 'f';
E: B | 'g';
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

