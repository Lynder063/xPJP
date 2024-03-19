%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define STR_LENGTH 200
#define STR_AMOUNT 50

char strings[STR_AMOUNT][STR_LENGTH];
int first_free = 0;
%}

%%
"\""[^\n]*"\""    {
    // If a string literal is found
    strncpy(strings[first_free], yytext + 1, yyleng - 2); // Ignore quotes
    strings[first_free][yyleng - 2] = '\0'; // Terminate the string with '\0'
    first_free++; // Move to the next free index in the table
}

.    {
    // Ignore any other characters
}

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    yyin = input_file; // Set yyin to input_file

    yylex(); // Start lexical analysis

    printf("\n** Záhlaví **\n");
    for (int i = 0; i < first_free; i++)
        printf("\"%s\"\n", strings[i]); // Print the content of the symbol table

    fclose(input_file);
    return 0;
}

int yywrap(void) {
    return 1; // Indicate end of input
}

