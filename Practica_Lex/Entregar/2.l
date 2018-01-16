/*----- Sección de Declaraciones --------------*/
%{

#include <stdio.h>

int nfecha, ntelefono, nmatricula, ndni, ncpostal;
void escribir_datos (int dato1, int dato2, int dato3, int dato4, int dato5);

%}

	/* Descripción

	fecha = Elije entre 4 opciones iniciales, introducir número comenzando por 0,1,2 y 3. Seguido viene un / o -  Después
			una cadena numérica que empiece por 0 o 1 para indicar el mes y por último una cadena de 4 que indique el número del año

	telefono 
		1.- Cadenas de números de 3 en 3 que pueden estar separadas (o no) por -
		2.- Cadena inicial de 3 números separadas (o no) por - y luego cadenas de 2 en 2 

	matricula = 
		1.- Para matrículas europeas. Cadena de 4 números separados por un - y luego otra cadena de 3 letras mayúsculas
		2.- Para matrículas no europeas. Cadena de caracteres de 1 a 3, separados por un - y después 2 caracteres en mayusculas 

	dni = Cadena de 8 cifras numéricas separadas (o no) por un - y después una letra mayúscula

	cpos = Cadena de 5 cifras numéricas */


fecha       ((0?[1-9])|(1[0-9])|(2[0-9])|(3[01]))(("/")|("-"))((0?[1-9])|(1[0-2]))(("/")|("-"))([1-9]{4}|[1-9]+)

telefono1    ([0-9]{3}("-")?[0-9]{3}("-")?[0-9]{3})
telefono2    ([0-9]{3}("-")?[0-9]{2}("-")?[0-9]{2}("-")?[0-9]{2})

matricula1   ([0-9]{4})("-")?([A-Z]{2,3})
matricula2	 ([A-Z]{1,3}("-")?[0-9]{4})("-")?([A-Z]{2})

dni          ([0-9]{8})("-")?[A-Z]

cpostal      ([0-9]{5})

%%
		/*----- Sección de Reglas ----------------*/

{fecha}   		{ nfecha++; ECHO; printf("\n");}
{telefono1}   	{ ntelefono++; ECHO; printf("\n");} 
{telefono2}		{ ntelefono++; ECHO; printf("\n");} 
{matricula1}	{ nmatricula++; ECHO; printf("\n");} 
{matricula2}	{ nmatricula++; ECHO; printf("\n");} 
{dni}			{ ndni++; ECHO; printf("\n");} 		
{cpostal}		{ ncpostal++; ECHO; printf("\n");} 

.	{} /*No imprime el resto*/
%%

		/*----- Sección de Procedimientos --------*/

int main (int argc, char *argv[]) {

  if (argc == 2) {
   yyin = fopen (argv[1], "rt");
   if (yyin == NULL) {
      printf ("El fichero %s no se puede abrir\n", argv[1]);
      exit (-1);
   }
  }

else yyin = stdin;

nfecha = ntelefono = nmatricula = ndni = ncpostal = 0;   
yylex ();   
escribir_datos(nfecha, ntelefono, nmatricula, ndni, ncpostal);

return 0;
}

void escribir_datos (int dato1, int dato2, int dato3, int dato4, int dato5) {
   printf ("\nFechas = %d\nTelefonos = %d\nMatrículas = %d\nDNI's = %d\nCP's = %d\n",dato1,dato2,dato3,dato4,dato5);
}

