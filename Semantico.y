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
%type <ent> factor;
%%


/* Gramatica */

expr:   
        |   term masterm                { printf("** 1 ** \n");} 
        ;

masterm:
            suma masterm                { printf("** 2 ** \n");} 
        |   resta masterm               { printf("** 3 ** \n");} 
        |                               { printf("** 4 ** \n");} 
        ;


term:
        factor masfactor                { printf("** 5 ** \n");} 
        ;

masfactor:
            multiplicacion factor masfactor    { printf("** 6 ** \n");}  
        |   division factor masfactor          { printf("** 7 : %d ** \n", $1);} 
        |                                      { printf("** 8 ** \n");} 
        ;


factor:  
        entero                                  { $$ = $1; printf("-- %d -- \n", $1);} 
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