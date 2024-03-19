/* define states */
%s COMMENT

%%
<INITIAL>"/*"           BEGIN (COMMENT);
<INITIAL>"//".*		;
<INITIAL>"*/"		{ 
			printf("Unmatching comment marks\n");
			yyterminate();
			 }
<INITIAL>.		ECHO;
<INITIAL>\n		ECHO;

<COMMENT>"*/"		BEGIN (INITIAL);
<COMMENT>.		;
<COMMENT>\n		;
<COMMENT>"/*"		{
			printf("Comments inside a comment not accepted\n");
			yyterminate();
			}
%%

int main()
{
        yylex();
        return 0;
}
