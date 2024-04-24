%{
#include "arit_vyraz.tab.h"
%}

%option nounput
%option noinput

%%
[0-9]+ { return NUMBER; }

[ \t]	;		/* ignore white space */
\n	return 0;	/* logical EOF */
.	return yytext[0];
%%
