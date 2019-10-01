/*Creación de un analizador semantico*/

%{
#include <stdio.h>

int yylex(void);
void yyerror(char *);


%}
%union{
    char *oper;
    int ent;
}
/* Tokens utilizados para la deteccion del analizador*/

%token <ent>    entero
%token <oper>   suma
%token <oper>   resta
%token <oper>   multiplicacion
%token <oper>   division

%%


/* Gramatica */

expr:   
        |   term masterm  
        ;

masterm:
            suma masterm
        |   resta masterm
        |
        ;


term:
        factor masfactor
        ;

masfactor:
            multiplicacion factor masfactor
        |   division factor masfactor
        |                                       {}
        ;


factor:  
        entero  {$$ = $1;}
        ;






%%

/* Ejecucion del programa*/

void yyerror(char *s){
    printf ("Error de sintaxis");


}

int main (void){

    yyparse();

    return 0;
}