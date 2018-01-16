/*----- Sección de Declaraciones --------------*/
%{

#include <stdio.h>

int ncomentario, ncomentario1;
void escribir_datos (int dato1, int dato2);

%}

	/* Descripción

	comentario /* = Cadena que empiece por /* y finalice en * / y en medio caracteres cualquiera que deben aparecer 1 o más veces

	comentario // =  Cadena que comience por // seguida de uno o varios caracteres*/


comentario  (("/*")(.)*("*/"))
comentario1  (("//")(.)*)

%%
		/*----- Sección de Reglas ----------------*/

{comentario}    {ncomentario++; ECHO; printf("\n");}
{comentario1}   {ncomentario1++; ECHO; printf("\n");}

. {} // No se imprime el resto
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

ncomentario = ncomentario1 = 0;   
yylex ();   
escribir_datos(ncomentario, ncomentario1);

return 0;
}

void escribir_datos (int dato1, int dato2) {
   printf ("Comentarios /**/ = %d\nComentarios // = %d\n",dato1, dato2);  
}









