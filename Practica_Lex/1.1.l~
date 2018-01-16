/*---— Sección de Declaraciones —------------*/
%{

#include <stdio.h>

int nw, nc;
void escribir_datos (int dato1, int dato2);

%}

	 /* Descripción 

		web =  Elección de una cadena entre cuatro para elegir, seguido de una cadena de caracteres no vacía, un punto y otra cadena
		de 2-4 caracteres en el intervalo a-z o un punto y después una cadena no vacía seguida de un punto y de un intervalo de caracteres de a-z

		correo = Cadena de caracteres cualquiera excepto vacía (+), seguido de un @, otra cadena no vacia, seguido de un punto
		y otra cadena de 2 a 4 caracteres en el intervalo de a-z */


web ((http:"//www.")|(www".")|(https:"//www.")|(https:"//")|(http:"//"))[^ (.)]+((".")([a-z]{2,4})|(".")[^ (.)]+(".")([a-z]{2,4})) 
correo (.)+("@")(.)+(".")([a-z]{2,4})
 


%%
 /*---— Sección de Reglas —--------------*/

{web} { nw++; ECHO; printf("\n");} 
{correo} { nc++; ECHO; printf("\n"); } 
. {} /*No imprime el resto*/
%%

 /*---— Sección de Procedimientos —------*/
int main (int argc, char *argv[]) {

 if (argc == 2) {
 yyin = fopen (argv[1], "rt");
 if (yyin == NULL) {
 printf ("El fichero %s no se puede abrir\n", argv[1]);
 exit (-1);
 }
 }

else yyin = stdin;

nw = nc =0; 
yylex (); 
escribir_datos(nw, nc);

return 0;
}

void escribir_datos (int dato1, int dato2) {
 printf ("\n- Número de webs=%d\n- Número de emails=%d\n",dato1,dato2);
}
