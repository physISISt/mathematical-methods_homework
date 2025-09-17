#include <stdio.h>
#include <math.h> 

//V A R I A B L E S   G L O B A L E S
int n;
int m;//exponencial de la serie
int max_iter;//iteración máxima para calcular la convergencia
double suma;
double s_ant;//suma anterior
double tolr;//tolerancia
int conv;//convergencia
char continuar;
char funcion;//función del programa

int main() {

    printf("- - - - S E R I E: sum_{n=0}^inf 1/k^m - - - -\n");

    do{
        printf("\n Ingrese el valor del exponente de la serie 'm' (m debe ser > 0):\n(Para finalizar, ingrese otra tecla)\n");
        scanf(" %d", &m);
    
    do{
        printf("\n Desea calcular un valor de la serie para un determinado 'n' o calcular la convergencia? s:serie c:convergencia (s/c)\n (Para finalizar, ingrese otra tecla)\n");
        scanf(" %c", &funcion);

            if (funcion != 's' && funcion != 'c'){
            printf("-----\n");
            }
            else{
                if (funcion == 'c' ){
                    suma = 0.0;
                    max_iter = 1e6;
                    s_ant = 0.0;
                    tolr = 1e-7;
                    conv = 0;
                        for (int k = 1; k <= max_iter; k++) {
                            suma += 1.0 / pow(k, m);
                            if (fabs(suma - s_ant) < tolr) {
                                conv = 1;
                                printf("La serie parece converger en %.6f después de %d términos.\n", suma, k);
                                break;
                                }//if
                            s_ant = suma;
                        }//for

                            if (!conv) {
                                printf("La serie no converge (suma parcial sigue creciendo hasta %.9f).\n", suma);
                            }//if
                }//if funcion == c
    //-----------------------------------------------------------------------------------------------------
                if (funcion == 's'){
                    do{
                        suma=0.0;
                        printf("Ingresa el valor del numero de terminos n:");
                        scanf(" %d", &n);

                        for(int k = 1; k <= n; k++ ){
                            suma += 1.0/pow(k,m);
                        }
                    printf("La suma de la serie 1/k^%d hasta n=%d es: %.6f\n", m, n, suma);

                    printf("\n Desea calcular la serie 1/k^%d nuevamente para otro n? (s/n)", m);
                    scanf(" %c", &continuar); //Espacio antes de %c para ignorar saltos de línea
                    } while (continuar == 's' || continuar == 'S');
                }//if funcion == s

            //if (funcion != 'f' && funcion != 's' && funcion != 'c' )
            //  printf("Valor invalido. Ingrese s, c o f\n");



        }//else principal
    } while (funcion == 's' || funcion == 'c'); //do para serie y convergencia

        printf("Desea calcular los términos o la convergencia para otra serie, es decir, para un 'm' distinto? (s/n)");
        scanf(" %c", &continuar);

    }while (continuar == 's' || continuar =='S');//do principal 
    
     printf("\nPrograma finalizado correctamente.\n");
    return 0;
}
