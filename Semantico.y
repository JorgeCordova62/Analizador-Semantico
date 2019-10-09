/*Creación de un analizador semantico*/
%{
#include <stdio.h>

int yylex(void);
void yyerror(char *);
%}
%union{
    char *oper;
    char *carac;
    int ent;
    float flot;
}

/* Tokens utilizados para la deteccion del analizador*/
%token <flot>    flotante
%token <ent>    entero
%token <carac>    caracter
%left <oper>   suma
%left <oper>   resta
%left <oper>   multiplicacion
%left <oper>   division

%type <flot> factor
%type <flot> term
%type <flot> expr
%type <flot> inicial

%start  inicial
%%
/* Gramatica */

inicial:
        expr  {printf("Resultado es %.2f \n",$$);}
        ;

expr:   term                            
        | expr suma term           {
        if (sizeof($1) == 1 || sizeof($3) == 1)
        {
        printf("No se puede realizar sumas con caracteres\n");
        }
        else{
            int cambio = $1;
            int cambio2 = $3;

            if ($1 - cambio)
            {
                if ($3 - cambio2)
                {
                    $$ = $1 + $3;
                    printf("se sumarán\n");
                }
                else
                {
                    $$ = $1 + $3;
                    printf("se sumará  \n");
                }
            }
            else
            {
                if ($3 - cambio2)
                {
                $$ = $1 + $3;
                printf("se sumará \n");
                }
                else
                {
                $$ = $1 + $3;
                printf("Se sumarán\n");
                }
            }
            }
            } 
        | expr resta  term              {
        if (sizeof($1) == 1 || sizeof($3) == 1)
        {
        printf("No se puede realizar sumas con caracteres\n");
        }
        else{
            int cambio = $1;
            int cambio2 = $3;

            if ($1 - cambio)
            {
                if ($3 - cambio2)
                {
                    $$ = $1 - $3;
                    printf("se restaran\n");
                }
                else
                {
                    $$ = $1 - $3;
                    printf("se restarán  \n");
                }
            }
            else
            {
                if ($3 - cambio2)
                {
                $$ = $1 - $3;
                printf("se restarán \n");
                }
                else
                {
                $$ = $1 - $3;
                printf("Se restarán\n");
                }
            }
            }
            }
        ;




term:   factor
        |   term multiplicacion factor  {
        if (sizeof($1) == 1 || sizeof($3) == 1)
        {
        printf("No se puede realizar sumas con caracteres\n");
        }
        else{
            int cambio = $1;
            int cambio2 = $3;

            if ($1 - cambio)
            {
                if ($3 - cambio2)
                {
                    $$ = $1 * $3;
                    printf("se restaran\n");
                }
                else
                {
                    $$ = $1 * $3;
                    printf("se restarán  \n");
                }
            }
            else
            {
                if ($3 - cambio2)
                {
                $$ = $1 * $3;
                printf("se restarán \n");
                }
                else
                {
                $$ = $1 * $3;
                printf("Se restarán\n");
                }
            }
            }
            }
        ;




factor:  
        entero                          { $$ = $1;} 
        | flotante                      { $$ = $1;}
        ;






%%

/* Ejecucion del programa*/

void yyerror(char *s){
    printf ("No se acepta la operacion\n");


}

int main (void){

    yyparse();

    return 0;
}