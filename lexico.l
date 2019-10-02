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
{suma}                 { yylval.oper = yytext; return suma;}
{resta}                { yylval.oper = yytext;return resta;}
{multiplicacion}       { yylval.oper = yytext; return multiplicacion;}
{division}             { yylval.oper = yytext; return division;}
" "                     ;
'\n'                    ;
.                      { return *yytext;}



%%

/*Ejecucucion */
int yywrap(void){
    return 1;
}


