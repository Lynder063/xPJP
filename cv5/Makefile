all: tokenize stattab

tokenize: tokenize.l
	flex -o tokenize.c tokenize.l
	gcc -o tokenize tokenize.c -lfl

stattab: stattab.l
	flex -o stattab.c stattab.l
	gcc -o stattab stattab.c -lfl

clean:
	rm -f tokenize stattab tokenize.c stattab.c

