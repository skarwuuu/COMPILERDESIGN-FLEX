#include <stdio.h>
#include <string.h>

void leftRecursion() {
    char nt, prod[10][50], alpha[10][50], beta[10][50];
    int n, i, ac=0, bc=0;

    printf("Non-terminal: ");
    scanf(" %c", &nt);
    printf("Number of productions: ");
    scanf("%d", &n);

    for(i=0; i<n; i++) {
        printf("Production %d: ", i+1);
        scanf("%s", prod[i]);
        if(prod[i][0] == nt)
            strcpy(alpha[ac++], prod[i]+1);
        else
            strcpy(beta[bc++], prod[i]);
    }

    printf("\n===== RESULT =====\n");
    for(i=0; i<bc; i++)
        printf("%c -> %s%c'\n", nt, beta[i], nt);

    for(i=0; i<ac; i++) {
        printf("%c' -> %s%c'", nt, alpha[i], nt);
        if(i < ac-1) printf(" | ");
    }
    printf(" | e\n");
}

void leftFactor() {
    char nt, prod[10][50], prefix[50]="";
    int n, i, len=0;

    printf("Non-terminal: ");
    scanf(" %c", &nt);
    printf("Number of productions: ");
    scanf("%d", &n);

    for(i=0; i<n; i++) {
        printf("Production %d: ", i+1);
        scanf("%s", prod[i]);
    }

    for(i=0; prod[0][i] && prod[1][i]; i++) {
        if(prod[0][i] == prod[1][i])
            prefix[len++] = prod[0][i];
        else break;
    }

    printf("\n===== RESULT =====\n");
    printf("%c -> %s%c'\n", nt, prefix, nt);
    for(i=0; i<n; i++) {
        printf("%c' -> %s", nt, prod[i]+len);
        if(i < n-1) printf(" | ");
    }
    printf("\n");
}

int main() {
    int ch;
    printf("1. Left Recursion\n2. Left Factoring\nChoice: ");
    scanf("%d", &ch);
    ch==1 ? leftRecursion() : leftFactor();
    return 0;
}