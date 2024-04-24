CC = gcc
LIBS = -lfl -lm			# flex
LEX = flex -I
BISON = bison -d
CFLAGS = -Wno-implicit -Wall

DEP1=deklar.tab.c deklar.yy.c
DEP2=symtab.tab.c symtab.yy.c

.SUFFIXES:                    # Delete the default suffixes
.SUFFIXES: .y .tab.c .l .yy.c # Define our suffix list

.y.tab.c:
	$(BISON) $<

.l.yy.c:
	$(LEX) -o$@ $<

all: deklar symtab

deklar: $(DEP1)
	$(CC) -o deklar $(DEP1) $(LIBS) $(CFLAGS)

symtab: $(DEP2)
	$(CC) -o symtab $(DEP2) $(LIBS) $(CFLAGS)

clean: 
	rm -f *.c *.tab.h *.o deklar symtab
