%{
#include "kalkul_int.tab.h"
#define YY_NO_UNPUT
%}

%option nounput
%option noinput


%%
[0-9]+	yylval=atoi(yytext);return NUMBER;		
		
[ \t]	;		/* ignore white space */
\n	return 0;	/* logical EOF */
.	return yytext[0];
%%
