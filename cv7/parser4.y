%{
   void yyerror(char *);
   int yylex(void);
   #define YYDEBUG 0 /* redundant, typically included in makefile */
   #include <stdio.h>
%}


%%
S : A B {printf("S->AB\n");}
A : 'a' 'h'  {printf("A->ah\n");}
 | 'a''b' A 'c' {printf("A->abAc\n");}
 | 'a' B 'c' {printf("A->aBc\n");}
B : C D E {printf("B->CDE\n");}
C : 'd' {printf("C->d\n");}
 | 'e' {printf("C->e\n");}
D : 'f' D {printf("D->fD\n");}
 | 'f' {printf("D->f\n");}
E : B {printf("E->B\n");}
 | 'g' {printf("E->g\n");}
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

