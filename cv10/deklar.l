%{
#include "deklar.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%option nounput
%option noinput


%%
[ \t]	;		/* ignore white space */

[0-9]+ 	{ yylval.dval = atof(yytext); return NUMBER; }
[a-z]	{ yylval.var = yytext[0]-'a'; return VARIABLE; }

"++"	return INCREMENT;
"--"	return DECREMENT;
sqrt	return SQRT;
log	return LOG;
print	return PRINT;
"\n"    yylineno++; return yytext[0];
.	return yytext[0];
%%
