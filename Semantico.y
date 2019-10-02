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
%type <ent> masfactor
%type <ent> term
%type <ent> masterm
%type <ent> expr

%start  expr
%%


/* Gramatica */

expr:   
        term masterm                { $2 = $<ent>0; $$ = $1; printf("** 1: %d ** \n",$$);} 
        ;

masterm:
            suma term masterm                { $2 =$<ent>0 - $2; $$ = $2;  printf("** 2: %d ** \n",$$);} 
        |   resta term masterm               { $2 =$<ent>0 - $2; $$ = $2;  printf("** 3: %d ** \n",$$);} 
        |                               { $$ =  $<ent>0; printf("** 4: %d ** \n",$$);} 
        ;


term:
        factor masfactor                {$2= $<ent>0; $$ = $2; printf("** 5: %d ** \n",$$);} 
        ;

masfactor:
            multiplicacion factor masfactor    { $3 = $<ent>0*$2; $$=$3; printf("** 6: %d ** \n", $$);}  
        |   division factor masfactor          { $3 = $<ent>0/$2; $$=$3; printf("** 7: %d ** \n", $$);} 
        |                                      { $$ = $<ent>0; printf("** 8: %d ** \n",$$);} 
        ;


factor:  
        entero                                  { $$ = $1; printf("** 9: %d ** \n",$$);} 
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