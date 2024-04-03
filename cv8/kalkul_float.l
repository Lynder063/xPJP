%{
#include "h8_3.tab.h"
%}

%option nounput
%option noinput

%%
[ \t]	;		/* ignore white space */

[0-9]+ 	/*  preved obsah yytext na double/float
			vysledek predej do promenne yylval.dval
			vrat odpovidajci token
		*/		

sqrt	/* vrat odpovidajici token */
log		/* vrat odpovidajici token */
"\n"    {yylineno++; return yytext[0]; }
.	return yytext[0];
%%
