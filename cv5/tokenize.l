%{
#include <stdio.h>
int lineno = 1;
%}

%%
"main"      { printf("tok_main\t\t%d\n", lineno); }
"int"       { printf("tok_int\t\t\t%d\n", lineno); }
"void"      { printf("tok_void\t\t%d\n", lineno); }
"return"    { printf("tok_return\t\t%d\n", lineno); }
"{"         { printf("tok_lbrace\t\t%d\n", lineno); }
"}"         { printf("tok_rbrace\t\t%d\n", lineno); }
"("         { printf("tok_lparen\t\t%d\n", lineno); }
")"         { printf("tok_rparen\t\t%d\n", lineno); }
";"         { printf("tok_semicolon\t\t%d\n", lineno); }
"="         { printf("tok_equal\t\t%d\n", lineno); }
"+"         { printf("tok_plus\t\t%d\n", lineno); }
"*"         { printf("tok_mult\t\t%d\n", lineno); }
[a-zA-Z]+	{ printf("tok_id\t\t%s\t%d\n", yytext, lineno); }
-?[0-9]+	{ printf("tok_intconst\t%s\t%d\n", yytext, lineno); }
[ \t]+          ;
\n              { lineno++; } // Inkrementace čísla řádku
.               { 
			printf("Unrecognized\t%s\t%d\n", yytext, lineno);
			yyterminate();
		 }
%%

int main(int argc, char *argv[]) {
    printf("TOKEN\t\tATTRI\tLINENO\n");
    if (argc != 2) {
        fprintf(stderr, "Použití: %s soubor.c\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        fprintf(stderr, "Chyba: Nelze otevřít vstupní soubor '%s'\n", argv[1]);
        return 1;
    }

    yyin = input_file; // Nastavení vstupního souboru pro Flex
    yylex(); // Volání lexikální analýzy
    fclose(input_file);
    return 0;
}
