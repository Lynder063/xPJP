#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

char buffer[30]; // Vstupní řetězec
int i = 0;       // Index ve vstupním řetězci

// Deklarace funkcí
void S();
void A();
void E();
void T();
void E1();
void T1();
void F();

// Funkce pro neterminál S
void S() {
    printf("S -> A = E\n");
    A();
    if (buffer[i] == '=') {
        printf("terminal =\n");
        i++;
        E();
    } else {
        printf("Chyba v S\n");
        exit(0);
    }
}

// Funkce pro neterminál A
void A() {
    if (islower(buffer[i])) {
        printf("terminal %c\n", buffer[i]);
        i++;
    } else {
        printf("Chyba v A\n");
        exit(0);
    }
}

// Funkce pro neterminál E
void E() {
    printf("E -> T E1\n");
    T();
    E1();
}

// Funkce pro neterminál T
void T() {
    printf("T -> F T1\n");
    F();
    T1();
}

// Funkce pro neterminál E1
void E1() {
    if (buffer[i] == '+') {
        printf("terminal +\n");
        printf("E1 -> + T E1\n");
        i++;
        T();
        E1();
    } else {
        printf("E1 -> <epsilon>\n");
    }
}

// Funkce pro neterminál T1
void T1() {
    if (buffer[i] == '*') {
        printf("terminal *\n");
        printf("T1 -> * F T1\n");
        i++;
        F();
        T1();
    } else {
        printf("T1 -> <epsilon>\n");
    }
}

// Funkce pro neterminál F
void F() {
    if (buffer[i] == '(') {
        printf("terminal (\n");
        printf("F -> ( E )\n");
        i++;
        E();
        if (buffer[i] == ')') {
            printf("terminal )\n");
            i++;
        } else {
            printf("Chyba: Nesparovane zavorky v F\n");
            exit(0);
        }
    } else if (buffer[i] == 'a') {
        printf("terminal a\n");
        printf("F -> a\n");
        i++;
    } else if (buffer[i] == 'b') {
        printf("terminal b\n");
        printf("F -> b\n");
        i++;
    } else {
        printf("Chyba: Spatny argument v F\n");
        exit(0);
    }
}

int main() {
    // Výpis gramatiky
    printf("Grammar:\n");
    printf("S -> A = E\n");
    printf("A -> [a-z]\n");
    printf("E -> T E1\n");
    printf("T -> F T1\n");
    printf("E1 -> + T E1 | epsilon\n");
    printf("T1 -> * F T1 | epsilon\n");
    printf("F -> (E) | a | b\n\n");

    printf("Zadejte vstupni retezec:\n");
    fgets(buffer, 30, stdin);
    printf("%s", buffer); // Vypíše vstup uživatele

    // Odebere nový řádek z bufferu, pokud existuje
    size_t len = strlen(buffer);
    if (len > 0 && buffer[len - 1] == '\n')
        buffer[--len] = '\0';

    S();

    printf("\n\nOK, aktualni vstup je generovan zadanou gramatikou.\n");

    return 0;
}

