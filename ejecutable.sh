bison -yd Semantico.y
flex lexico.l
gcc y.tab.c lex.yy.c -o SoftSemantico
rm -r y.tab.c
rm -r y.tab.h
rm -r lex.yy.c

./salida < informacion.txt