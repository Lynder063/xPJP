%{
#include "parser4.tab.h"
%}

%%
[a-h] { return yytext[0]; }
. { yyerror("Invalid input"); }
\n { return 0; } /* EOF */
%%