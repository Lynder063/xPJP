%{
#include "kalkul_float.tab.h"
#define YY_NO_UNPUT
%}

%option nounput
%option noinput

%%
[ \t]	;

[0-9]+ 	{ yylval.dval = atof(yytext); return NUMBER;}

sqrt	return SQRT;
log	return LOG;
"\n"    {yylineno++; return yytext[0]; }
.	return yytext[0];
%%
