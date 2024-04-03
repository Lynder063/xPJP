%{
/* #include prislusny sdileny soubor */
#include "parser4.tab.h"
%}


%%
[a-h]	 {return *yytext;}
\n	 {return 0;}  /* EOF */
%%