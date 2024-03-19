%{
#include <stdio.h>
%}

%%
"main" {printf("MAIN\n");}
"printf" {printf("PRINTF\n");}
[\t\n]+ ;
\"[^\"\n]+\" {printf("STRING\n");}
. {printf("%c", yytext[0]);}
%%

int main() {
    yylex();
    return 0;
}

