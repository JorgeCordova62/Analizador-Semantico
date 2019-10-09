#include <stdio.h>

int main()
{
    int num1 = 50;
    int num2 = 10;
    float flotante = 123456.456;
    float flotante2 = 12345126.456;
    int cambio, cambio2;
    cambio = flotante;
    cambio2 = flotante2;

    char caracter = '1';

    if (sizeof(caracter) == 1)
    {
        printf("++%lu++\n", sizeof(caracter));
    }
    else{
        if (num1 - cambio)
    {
        if (num2 - cambio2)
        {
            printf("se sumarán flotantes\n");
        }
        else
        {
            printf("se sumará  flotantes con un enteros\n");
        }
    }
    else
    {
        if (num2 - cambio2)
        {
            printf("se sumará flotantes con enteros)\n");
        }
        else
        {
            printf("Sse sumarán enteros\n");
        }

    }

    

        return 0;
    }
}