/*
 *	Symbol table entry
 */

#define MAXSYMS 50	/* maximum number of symbols */

struct symtab {
	char *name;
	double (*funcptr)();	/* a pointer to C function to call if entry is a function name */
	double value;
} symtab[MAXSYMS];

struct symtab *symlook(char *);
