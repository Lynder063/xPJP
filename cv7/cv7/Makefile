all:
	lex parser3.l
	bison -d -v parser3.y
	gcc -o parser3 lex.yy.c parser3.tab.c -DYYDEBUG=1 -Wno-implicit -lfl

	lex parser4.l
	bison -d -v parser4.y
	gcc -o parser4 lex.yy.c parser4.tab.c -DYYDEBUG=1 -Wno-implicit -lfl

parser3:
	lex parser3.l
	bison -d -v parser3.y
	gcc -o parser3 lex.yy.c parser3.tab.c -DYYDEBUG=1 -Wno-implicit -lfl
parser4:
	lex parser4.l
	bison -d -v parser4.y
	gcc -o parser4 lex.yy.c parser4.tab.c -DYYDEBUG=1 -Wno-implicit -lfl
clean:
	rm *.output
	rm *.tab.h
	rm *.tab.c
	rm parser3
	rm parser4
	rm lex.yy.c
