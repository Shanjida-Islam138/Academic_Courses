%{
#include<stdio.h>
int line = 1;
%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { printf("%d %s keyword\n", line, yytext); }

"//".* { printf("%d %s comment\n", line, yytext); }

[0-9]+ { printf("%d %s constant\n", line, yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("%d %s identifier\n", line, yytext); }

">="|"<="|"=="|"!="|">"|"<" { printf("%d %s logical_op\n", line, yytext); }

"+"|"-"|"*"|"/" { printf("%d %s arithmetic_op\n", line, yytext); }

"=" { printf("%d %s assign_op\n", line, yytext); }

"("|")"|"{"|"}"|"["|"]" { printf("%d %s parenthesis\n", line, yytext); }

";"|","|":" { printf("%d %s punctuation\n", line, yytext); }

[ \t]+ ;

\n { line++; }

. ;
%%

int yywrap() { return 1; }

int main()
{
    yyin = fopen("input.c", "r");
    if(!yyin) {
        printf("Error: input.c file pawa jayni!\n");
        return 1;
    }
    yylex();
    return 0;
}
