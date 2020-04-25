

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *);
int yylex(void);
%}

%token barran nome numero ch1 ch2 c1 c2 v dp

%%
S:
    E barran {printf("VALIDO\n");}
    |
    ;

E: 
    ch1 ATRI ch2 {}
    | ch1 barran ATRI ch2 {}
    | ch1 barran ATRI barran ch2 {}
    | ch1 ATRI barran ch2 {}
    ;

ATRI:
    nome dp VAL {}
    | ATRI v barran ATRI {}
    | ATRI v ATRI {}
    ;

VAL:
    nome {}
    | numero {}
    | E {}
    | VETOR {}
    ;

VETOR:
    c1 c2 {}
    | c1 COISA c2 {}
    ;

COISA:
    nome {}
    | numero {}
    | VETOR {}
    | COISA v COISA {}
    ; 

%%

void yyerror(char *s) {
printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
