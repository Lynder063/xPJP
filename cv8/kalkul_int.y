%{
#include <stdio.h>

void yyerror(char *);
int yylex(void);

int result; // Shared variable to store the result of arithmetic expressions
%}

%token NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UNARY

%%

statement:
	expression { printf("Value: %d\n", $1); }
	;

expression:
	expression '+' expression { $$ = $1 + $3; }
	| expression '-' expression { $$ = $1 - $3; }
	| expression '*' expression { $$ = $1 * $3; }
	| expression '/' expression { $$ = $1 / $3; }
	| '-' expression %prec UNARY { $$ = -$2; }
	| '+' expression %prec UNARY { $$ = $2; }
	| '(' expression ')' { $$ = $2; }
	| NUMBER { $$ = $1; }
	;

%%

void yyerror(char *s)
{
	printf("Syntakticka chyba\n");
}

int main()
{
	if (!yyparse())
		printf("OK\n");
	return 0;
}