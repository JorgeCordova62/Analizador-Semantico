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
{entero}               { return entero;}
{suma}                 { return suma;}
{resta}                { return resta;}
{multiplicacion}       { return multiplicacion;}
{division}             { return division;}
" "                     ;
.                      { return *yytext;}



%%

/*Ejecucucion */
int yywrap(void){
    return 1;
}


