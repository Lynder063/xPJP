%{
/* #include prislusny sdileny soubor */
#include "parser3.tab.h"  
%}

%%
"a"		return(a_TOK);
"b"		return(b_TOK);
"c"		return(c_TOK);
"d"		return(d_TOK);
"e"		return(e_TOK);
"f"		return(f_TOK);
"g"		return(g_TOK);
"h"		return(h_TOK);
.		return(yytext[0]);
 \n		return 0;
%%
