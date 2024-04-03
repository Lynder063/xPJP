%{
   void yyerror(char *);
   int yylex(void);
   #define YYDEBUG 0 /* redundant, typically included in makefile */
   #include <stdio.h>
%}

%token a_TOK b_TOK c_TOK d_TOK e_TOK f_TOK g_TOK h_TOK

%%
 /* define grammar rules here */
S: A B {printf("S->AB\n");}
A: a_TOK h_TOK  {printf("A->ah\n");}
| a_TOK b_TOK A c_TOK {printf("A->abAc\n");}
| a_TOK B c_TOK {printf("A->aBc\n");}
B: C D E {printf("B->CDE\n");}
C: d_TOK  {printf("C->D\n");}
| e_TOK {printf("C->e\n");}
D: f_TOK D {printf("D->fD\n");}
| f_TOK {printf("D->f\n");}
E: B {printf("E->B\n");}
| g_TOK {printf("E->g\n");}
%%





void yyerror (char *s)
{
  /* fprintf (stderr, "%s\n", s); */
  printf("Incorrect derivation!\n");
}

int main(void)
{
#if YYDEBUG
  yydebug = 1;
#endif
	if(!yyparse()){
    printf("Correct derivation\n");
		printf("End of input reached\n");
  }
	return 0;
}

