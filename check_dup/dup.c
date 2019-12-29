#include <stdio.h>
#include <string.h>

/* Some defines to make it better readable (ANSI-C doesn't know BOOL) */
#define BOOL    unsigned char
#define TRUE    1
#define FALSE   0

BOOL has_dup_chars(char *searchStr) {
    char *sPtr;  /* The pointer with which we search */
    char *eos;   /* End Of String position */
    int  length; /* Length of Search string (to avoid making two strlen-calls) */
    
    if (searchStr == NULL) {
        return FALSE;
    }

    /* If the search-string is longer than 255, it MUST contain duplicate chars/bytes */
    length = strlen(searchStr);
    if (length > 255) {
        return TRUE;
    }

    sPtr = searchStr; 
    eos = searchStr + length;
    while (sPtr < eos) {
        /* We take the char at current position and search for occurrence starting at 
         * current-position + 1 until end of the string */
        if (strchr(sPtr+1, *sPtr) != NULL) {
            return TRUE;
        }
        sPtr++;
    }
    return FALSE;
}


int main(int argc, char **argv) {
    char *searchStr = "Hello World!";
    if (has_dup_chars(searchStr)) {
        printf("Duplicate\n");
    }
    return 0;
}
