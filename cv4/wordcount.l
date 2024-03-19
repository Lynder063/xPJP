%{
/* Define some variables here */
int lineCount=0;
int wordCount=0;
int charCount=0;
FILE *yyin;
%}


%%

        /* Rules here */
[\n]	{ ++lineCount; ++charCount; };
[a-zA-Z]+	{++wordCount; charCount += yyleng;};
.	{ ++charCount; };

%%

int main(int argc, char **argv)
{
        if ( argc > 1 )
              yyin = fopen(argv[1], "r");
        else
              yyin = stdin;
        yylex();
        printf("lines: %d words: %d characters: %d\n", lineCount, wordCount, charCount);
        return 0;
}
