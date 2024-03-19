%{
#include <stdio.h>
%}

%%

[ \t\n]         /* Ignoruj bílé znaky */
(ab|ba)[c-z0-9]*(ab|ba) {
    printf("%s is according to the grammar\n", yytext);
}
[a-z0-9]+       { printf("%s is not according to the grammar\n", yytext); }
.              

%%

