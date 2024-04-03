%{
#include "parser3.tab.h"
%}

%%
"a" { return A_TOK; }
"b" { return B_TOK; }
"c" { return C_TOK; }
"d" { return D_TOK; }
"e" { return E_TOK; }
"f" { return F_TOK; }
"g" { return G_TOK; }
h { return H_TOK; }

. { yyerror("Invalid input"); }
\n { return 0; } /* EOF */
%%