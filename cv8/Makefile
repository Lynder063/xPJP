CC = gcc
LIBS = -lfl -lm			# flex
LEX = flex -I
BISON = bison -d
CFLAGS = -Wno-implicit -Wall

DEP1=arit_vyraz_stub.tab.c arit_vyraz_stub.yy.c
DEP2=kalkul_int.tab.c kalkul_int.yy.c
DEP2B=kalkul_float.tab.c kalkul_float.yy.c

.SUFFIXES:                    # Delete the default suffixes
.SUFFIXES: .y .tab.c .l .yy.c # Define our suffix list

.y.tab.c:
	$(BISON) $<

.l.yy.c:
	$(LEX) -o$@ $<

all: arit_vyraz_stub kalkul_int #kalkul_float

arit_vyraz_stub: $(DEP1)
	$(CC) -o arit_vyraz_stub $(DEP1) $(LIBS) $(CFLAGS)

kalkul_int: $(DEP2)
	$(CC) -o kalkul_int $(DEP2) $(LIBS) $(CFLAGS)

xkalkul_float: $(DEP2B)
#	$(CC) -o kalkul_float $(DEP2B) $(LIBS) $(CFLAGS)

clean: 
	rm -f *.c *.h *.o arit_vyraz_stub kalkul_int 
  #kalkul_float
