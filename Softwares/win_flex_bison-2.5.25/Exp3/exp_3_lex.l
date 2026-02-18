%{
#include <stdio.h>
char kw[100][20], id[100][20], num[100][20], flt[100][20], op[100][5], sym[100][5];
int kc=0, ic=0, nc=0, fc=0, oc=0, sc=0;
%}

%%
"int"|"float"|"if"|"else"|"return"|"while"|"for"  { strcpy(kw[kc++], yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                              { strcpy(id[ic++], yytext); }
[0-9]+\.[0-9]+                                      { strcpy(flt[fc++], yytext); }
[0-9]+                                              { strcpy(num[nc++], yytext); }
"+"|"-"|"*"|"/"|"="|">"|"<"|"=="|"!="              { strcpy(op[oc++], yytext); }
"{"|"}"|"("|")"|";"|","                             { strcpy(sym[sc++], yytext); }
[ \t\n]                                             { }
.                                                   { }
%%

int yywrap(){ return 1; }

int main(){
    char f[50];
    printf("Enter filename: ");
    scanf("%s", f);
    yyin = fopen(f, "r");
    yylex();

    printf("\nKeyword = ");
    for(int i=0; i<kc; i++) printf("%s%s", kw[i], i<kc-1?", ":"");

    printf("\nIdentifier = ");
    for(int i=0; i<ic; i++) printf("%s%s", id[i], i<ic-1?", ":"");

    printf("\nNumber = ");
    for(int i=0; i<nc; i++) printf("%s%s", num[i], i<nc-1?", ":"");

    printf("\nFloat = ");
    for(int i=0; i<fc; i++) printf("%s%s", flt[i], i<fc-1?", ":"");

    printf("\nOperator = ");
    for(int i=0; i<oc; i++) printf("%s ", op[i]);

    printf("\nSymbol = ");
    for(int i=0; i<sc; i++) printf("%s ", sym[i]);

    printf("\n");
    fclose(yyin);
    return 0;
}