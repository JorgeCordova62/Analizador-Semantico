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
        |   term masterm        {printf("1");}
        ;

masterm:
            suma masterm        {printf("2");}
        |   resta masterm       {printf("3");}
        |                       {printf("4");}
        ;


term:
        factor masfactor        {printf("5");}
        ;

masfactor:
            multiplicacion factor masfactor     {printf("6");}
        |   division factor masfactor           {printf("7");}
        |                                       {printf("8");}
        ;


factor:  
        entero                                  {printf("\n %d", $1);}
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