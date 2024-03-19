%{
#include <stdio.h>
%}

%%
ahoj    { printf("Ahoj\n"); }
.       { /* Ignoruj všechny ostatní znaky */ }
%%

int main() {
    yylex();
    return 0;
}

