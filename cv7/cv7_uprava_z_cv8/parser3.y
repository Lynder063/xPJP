%{
   #include <stdio.h>
%}

%token a_TOK b_TOK c_TOK d_TOK e_TOK f_TOK g_TOK h_TOK
%%
S: A B { printf("Correct derivation!\n"); };
A: a_TOK h_TOK | a_TOK b_TOK A c_TOK | a_TOK B c_TOK ;
B: C D E ;
C: d_TOK | e_TOK;
D: f_TOK D | f_TOK;
E: B | g_TOK ;
%%

void yyerror (char *s)
{
  printf("Incorrect derivation!\n");
}

int main(void)
{
yydebug = 0;
	if(!yyparse())
		printf("End of input reached\n");
	return 0;
}

