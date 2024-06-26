%{
#include <math.h>
#include <stdio.h>

int yylex(void);
void yyerror(char*);
extern int yylineno;

double vbltable[26];
%}

%union { double dval; int var; }

%token INCREMENT DECREMENT SQRT LOG PRINT
%token <var> VARIABLE
%token <dval> NUMBER
%type <dval> expression

%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%

statement_list:	statement ';' '\n' 
	| statement_list statement ';' '\n'
	| error '\n' { printf("Error in a statement!\n"); }
	; 

statement:	VARIABLE '=' expression { vbltable[$1] = $3; }
	|	PRINT expression { printf("%4.2f\n", $2); }
	|	VARIABLE INCREMENT { vbltable[$1]++; }
	|	VARIABLE DECREMENT { vbltable[$1]--; }
	;

expression:	expression '+' expression { $$ = $1+$3; }
	|	expression '-' expression { $$ = $1-$3; }
	|	expression '*' expression { $$ = $1*$3; }
	|	expression '/' expression 
		{ 
			if ($3 == 0.0) 
			{ 
				yyerror("Division by zero error!\n"); 
				return 0;
			 } 
			else $$ = $1/$3; 
		}
	|	'-' expression %prec UMINUS { $$ = -$2; }
	|	'(' expression ')' { $$ = $2; }
	|	SQRT '(' expression ')' { $$ = sqrt($3); }
	|	LOG '(' expression ')' { $$ = log($3); }
 	|	NUMBER /* $$ = $1 is default action, can be left away */
	|	VARIABLE { $$ = vbltable[$1]; }
	;
%%

void yyerror (char *s)
{
  fprintf (stderr, "%s in line %d\n", s, yylineno);
}

main ()
{
  int i;

  for (i=0; i<26; i++) vbltable[i]=0.0; /* Initializing the table to zero */

  if(!yyparse ())
    printf("OK\n");
}


