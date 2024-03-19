%{
#include <stdio.h>
%}

%%
ahoj    { printf("Ahoj\n"); }
[ \t\r\n]+   { /* Ignoruj bílé znaky */ }
.       { /* Ignoruj všechny ostatní znaky */ }
%%

int main() {
    yylex();
    return 0;
}

