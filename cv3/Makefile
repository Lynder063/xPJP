all: ahoj_1 ahoj_2 exten abba

ahoj_1: ahoj_1.l
	flex -o ahoj_1.c ahoj_1.l
	gcc -o ahoj_1 ahoj_1.c -lfl

ahoj_2: ahoj_2.l
	flex -o ahoj_2.c ahoj_2.l
	gcc -o ahoj_2 ahoj_2.c -lfl

exten: exten.l
	flex -o exten.c exten.l
	gcc -o exten exten.c -lfl

abba: abba.l
	flex -o abba.c abba.l
	gcc -o abba abba.c -lfl

clean:
	rm -f ahoj_1 ahoj_2 exten abba ahoj_1.c ahoj_2.c exten.c abba.c
