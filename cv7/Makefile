CC = gcc
FLEX = flex
BIS= bison

all: parser3 parser4

parser3: parser3.l parser3.y
	$(FLEX) -o parser3.yy.c parser3.l
	$(BIS) -o parser3.tab.c -d parser3.y
	$(CC) -o parser3 parser3.yy.c parser3.tab.c -lfl

parser4:
	$(FLEX) -o parser4.yy.c parser4.l
	$(BIS) -o parser4.tab.c -d parser4.y -v
	$(CC) -o parser4 parser4.yy.c parser4.tab.c -lfl

clean:
	rm -f parser3 parser3.yy.c parser3.tab.*
	rm -f parser4 parser4.yy.c parser4.tab.* parser4.output
 