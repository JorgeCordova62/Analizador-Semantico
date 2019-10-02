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
%left <oper>   suma
%left <oper>   resta
%left <oper>   multiplicacion
%left <oper>   division

%type <ent> factor
%type <ent> term
%type <ent> expr
%type <ent> inicial

%start  inicial
%%


/* Gramatica */

inicial:
        expr  {printf("Resultado es %d \n",$$);}
        ;

expr:   term                            
        | expr suma     term           {$$ = $1 + $3;} 
        | expr resta  term              { $$ = $1 - $3;}
        ;




term:   factor
        |   term multiplicacion factor  {$$ = $1 * $3;}
        |   term division factor        {$$ = $1 / $3;}
        ;




factor:  
        entero                          { $$ = $1;} 
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