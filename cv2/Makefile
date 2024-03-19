# Makefile pro projekt c_automat

# Název cílového souboru
EXEC_NAME = c_automat

# Kompilátor a flagy
CC = gcc
CFLAGS = -Wall -Wextra

# Zdrojové soubory
SOURCES = c_automat.c

# Vytvoření cílového souboru
$(EXEC_NAME): $(SOURCES)
	$(CC) $(CFLAGS) -o $(EXEC_NAME) $(SOURCES)

# Vyčištění projektu
clean:
	rm -f $(EXEC_NAME) *.o

# Spuštění programu
run: $(EXEC_NAME)
	./$(EXEC_NAME) "vstupní_slovo"

# Deklarace "PHONY" cílů
.PHONY: clean run

# Výchozí cíl
all: $(EXEC_NAME)

