%{
       /* libreriasde tokens*/ 
#include <stdio.h>
#include "y.tab.h"



%}
%option yylineno
    
entero                  [0-9]+  
suma                    [+]
resta                   [-]
multiplicacion          [*]
division                [/]




%%
{entero}               { yylval.ent = atoi(yytext); return entero; }
{suma}                 {  return suma;}
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


