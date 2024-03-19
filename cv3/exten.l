%{
#include <stdio.h>
%}

%%
^.+\.txt$   { printf("%s: is a text file\n", yytext); }
^.+\.html$  { printf("%s: is a text file\n", yytext); }
^.+\.jpg$   { printf("%s: is a picture file\n", yytext); }
^.+\.png$   { printf("%s: is a picture file\n", yytext); }
^.+\.fig$   { printf("%s: is a picture file\n", yytext); }
^.+\.tiff$  { printf("%s: is a picture file\n", yytext); }
^.+\.rar$   { printf("%s: is an archive\n", yytext); }
^.+\.gz$    { printf("%s: is an archive\n", yytext); }
^.+\.tar$   { printf("%s: is an archive\n", yytext); }
^.+\.tgz$   { printf("%s: is an archive\n", yytext); }
\n
.        
%%
