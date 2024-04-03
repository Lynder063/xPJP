CC = gcc
LIBS = -lfl
LEX = flex
BISON = bison -d -v
CFLAGS = -Wno-implicit -DYYDEBUG=1 -g

DEP1=parser3.tab.c parser3.yy.c


.SUFFIXES:						# Delete the default sufixes
.SUFFIXES: .y .tab.c .l .yy.c   # Define our suffix list

.y.tab.c:
		$(BISON) $<

.l.yy.c:
		$(LEX) -o$@ $<

all: parser3

parser3: $(DEP1)
	$(CC) $(CFLAGS) -o $@ $(DEP1) $(LIBS)

clean:
	rm -f parser3 parser3.tab.c parser3.tab.h parser3.yy.c parser3.output