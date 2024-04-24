%{
#include <math.h>
#include <stdio.h>

void yyerror(char *);
int yylex(void);
extern int yylineno;

%}
%union { double dval;}

%token SQRT LOG
%token <dval> NUMBER
%type <dval> expression

%left '-' '+'
%left '*' '/'
%nonassoc UNARY


%%

statement_list: statement ';' '\n'
	| statement_list statement ';' '\n'
	| error '\n' { printf("Error in a statement! \n"); }
	;

statement :	expression {printf("Value: %f\n",$1);}
	;

expression:	expression '+' expression	{$$=$1+$3;}
	|	expression '-' expression	{$$=$1-$3;}
	|	expression '*' expression	{$$=$1*$3;}
	|	expression '/' expression
		{
			if($3 == 0.0)
			{
				yyerror("Division by zero error!\n");
				return 0;
			}
			else $$=$1/$3;
		}
	|	'-' expression %prec UNARY	{$$=-$2;}
	|	'+' expression %prec UNARY	{$$=$2;}
	|	'(' expression ')'		{$$=$2;}
	|	SQRT '(' expression ')'		{$$ = sqrt($3);}
	|	LOG '(' expression ')'		{$$ = log($3);}
	|	NUMBER				{$$=$1;}
	;

%%

void yyerror(char *s)
{
    fprintf(stderr, "Line %d: %s\n", yylineno, s);
}

int main(void)
{
  if(!yyparse ())
    printf("OK\n");
  return 0;
}

