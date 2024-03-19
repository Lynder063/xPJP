all: comments wordcount

comments: comments.l	
	flex -o comments.c comments.l
	gcc -o comments comments.c -lfl

wordcount: wordcount.l
	flex -o wordcount.c wordcount.l
	gcc -o wordcount wordcount.c -lfl

clean:
	rm -f comments comments.c wordcount wordcount.c

