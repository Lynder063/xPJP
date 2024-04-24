%{
#include "symtab.tab.h"	/* definitions from YACC */
#include "symtab.h"		/* definitions for symbol table */
#include <math.h>
%}

%option nounput
%option noinput

%%

print	return PRINT;
"++"	return INCREMENT;
"--"	return DECREMENT;


([0-9]+|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?) {
                yylval.dval = atof(yytext);
                return NUMBER;
        }

[A-Za-z_][A-Za-z0-9_]* {       
                yylval.symp  = symlook(yytext);
                return NAME;
        }


[ \t]	;
"$"	return 0; /* EOF - end of input */
"\n"    yylineno++; return yytext[0];
.	return yytext[0];
%%
