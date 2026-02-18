%{
int p=0, n=0, z=0;
%}
%%
[+]?[1-9][0-9]*  { printf("+%s is Positive\n", yytext); p++; }
-[0-9]+          { printf("%s is Negative\n", yytext); n++; }
[+]?0            { printf("0 is Zero\n"); z++; }
"end"            { return 0; }
[ \t\n]          { }
.                { }
%%
int yywrap(){ return 1; }
int main(){
    printf("Enter numbers (type 'end' to finish):\n");
    yylex();
    printf("\nPositive: %d\nNegative: %d\nZeros: %d\n", p, n, z);
    return 0;
}