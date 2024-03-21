all: paser1 parser2

paser1: parser1.l
	flex -o parser1.c parser1.l
	gcc -o parser1 parser1.c -lfl

parser2: parser2.c
	gcc -o parser2 parser2.c

clean:
	rm -f parser1 parser1.c parser2

