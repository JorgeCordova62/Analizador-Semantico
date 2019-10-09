%{
       /* libreriasde tokens*/ 
#include <stdio.h>
#include "y.tab.h"
#include <string.h>
%}
%option yylineno

entero                  [0-9]+
flotante                {entero}\.{entero}
caracter                [a-z0-9A-z]
suma                    [+]
resta                   [-]
multiplicacion          [*]
division                [/]

%%
{flotante}              { yylval.flot = atof(yytext); return flotante; }
{entero}               { yylval.ent = atoi(yytext); return entero; }

{caracter}             { yylval.carac = yytext; return caracter;}
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


