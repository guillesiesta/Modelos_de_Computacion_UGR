/*---— Sección de Declaraciones —------------*/
%{

#include <stdio.h>

int n, n1;
void escribir_datos (int dato1);

/*
	Descripción de las Expresiones Regulares

	mvnb = busca las palabras que contengan esa subcadena 
	han = busca palabras que han a solas. Seleccionamos mejor así las han para que no se las trague la regla an1
	an1 = palabras an solas
	np = palabras que contengan np
	pto = Mayuscula después de . o ...
	pto1 = error cuando haya dos puntos consecutivos
	mayus = mayúscula después de comienzo de interrogación
	mayus1 = mayúscula después de comiendo de exclamación
	mayus2 = mayús cula después de cierre de interrogación
	mayus3 = mayúscula después de cierre de exclamación
	comienzol = al comienzo de una línea tiene que haber una mayúscula o un número
	semana = los días de la semana se escriben en minúscula
	mes = los meses del año se escriben en minúscula
	paises = listado de 50 países. Los nombres de los países tienen que ir en mayúscula
	capitales = listado de algunas capitales. Los nombres de las capitales deben de ir en mayúscula.
	palabras = 
			¡SE ESCRIBE YENDO!
			Enserio no existe 
	b = se escriben con be todas las palabras a las cuales a la be le sigue otra consonante.
*/
%}

mvnb (.)+("mv"|"nb")+(.) 
han	("han")(" ")+
an1 (" ")*("an")[^A-Za-z]
np (.)+("np")+(.)
pto (.)*("..")?(".")(" ")*[a-z]+
pto1 (.)*("..")(.)*
mayus (.)*("¿")(" ")*[a-z]+
mayus1 (.)*("¡")(" ")*[a-z]+
mayus2 (.)*("?")(" ")*[a-z]+
mayus3 (.)*("!")(" ")*[a-z]+
comienzol ^[a-z]
semana ("Lunes")|("Martes")|("Miercoles")|("Jueves")|("Viernes")|("Sabado")|("Domingo")
mes ("Enero")||("Febrero")|("Marzo")|("Abril")|("Mayo")|("Junio")|("Julio")|("Agosto")|("Septiembre")|("Octubre")|("Noviembre")|("Diciembre")
paises ("españa")|("francia")|("Portugal")|("argentina")|("andorra")|("eeuu")|("alemania")|("brasil")|("holanda")|("inglaterra")|("italia")|("croacia")|("bielorrusia")|("irlanda")|("belgica")|("bulgaria")|("montenegro")|("camerun")|("canada")|("chile")|("china")|("japon")|("cuba")|("colombia")|("egipto")|("marruecos")|("dinamarca")|("ecuador")|("islandia")|("estonia")|("georgia")|("hungria")|("jamaica")|("lituania")|("luxemburgo")|("escocia")|("monaco")|("polonia")|("paraguay")|("rusia")|("serbia")|("senegal")|("suecia")|("suiza")|("turquia")|("ucrania")|("uruguay")|("venezuela")|("vietnam")|("zambia")

capitales ("madrid")|("paris")|("lisboa")|("washington")|("berlin")|("amsterdam")|("janeiro")|("londres")|("roma")|("zagreb")|("minsk")|("dublin")|("bruselas")|("sofia")|("podgorica")

palabras ("llendo")|("Llendo")|("enserio")|("Enserio")

b ("v")[^aeiou][a-z]+
%%
 /*---— Sección de Reglas —--------------*/

{mvnb}		{n++;ECHO; printf("\n");} 
{han}		{n1++;}
{an1}		{n++;ECHO; printf("\n");}
{np}		{n++;ECHO; printf("\n");}
{pto}		{n++;ECHO; printf("\n");}
{pto1}		{n++;ECHO; printf("\n");}
{mayus}		{n++;ECHO; printf("\n");}
{mayus1}	{n++;ECHO; printf("\n");}
{mayus2}	{n++;ECHO; printf("\n");}
{mayus3}	{n++;ECHO; printf("\n");}
{comienzol} {n++;ECHO; printf("\n");}
{semana}	{n++;ECHO; printf("\n");}
{mes}		{n++;ECHO; printf("\n");}
{paises}	{n++;ECHO; printf("\n");}
{capitales} {n++;ECHO; printf("\n");}
{palabras}	{n++;ECHO; printf("\n");}
{b}		{n++;ECHO; printf("\n");}
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

	n = 0; 
	yylex (); 
	escribir_datos(n);

return 0;
}

void escribir_datos (int dato1) {
	if(dato1>3){
		 printf ("\n¡Lo siento! Has sobrepasado el mínimo de faltas de ortografía básicas.\n");
		 printf ("\n- Número de faltas de ortografía básicas=%d\n",dato1);
	}else{ 
		printf ("\n¡Enhorabuena! No has sobrepasado el mínimo de faltas de ortografía básicas.\n");	 
		printf ("\n- Número de faltas de ortografía=%d\n",dato1);
	}
}
