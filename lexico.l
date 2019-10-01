%{
       /* libreriasde tokens*/ 
#include <stdio.h>
#include "y.tab.h"


%}
    
entero                  [0-9]+  
suma                    [+]
resta                   [-]
multiplicacion          [*]
division                [/]




%%
{entero}               {printf("entero"); return entero;}
{suma}                 {printf("suma"); return suma;}
{resta}                {printf("resta"); return resta;}
{multiplicacion}       {printf("multi"); return multiplicacion;}
{division}             {printf("divi"); return division;}
" "                     ;
.                      {printf("cualquiera"); return *yytext;}



%%

/*Ejecucucion */
int yywrap(void){
    return 1;
}


