//
// aqui van las variables globales 
//

var

// enteros cortos y largos


num1,
num2,
numpuntos,
N,

TWEIGHT,
num_especies,
iTemp,
iTemp1,
iTemp2,
iTemp3,
repetidos,
especie_en_uso,

nrep,
nspp,
numRespuestas,
nodes

		: LongInt;


// reales

rtemp,
regla1,
regla2,
regla3,
corte,
oldcorte,
congruencia_minima,
prop_media    		(* el valor de cercania media entre puntos para corte de igualdad           *)
		: real;




//
//strings
//


nombre_sp_en_uso
		: string;

tipo
		:tipodatos;
//
uno,
stemp1,
alpha,
beta,
gamma
		: string[15];

acto
		: string[1];
		



//
// the others such other
//




       W          : ARRNN;

       closeto,
       dist,
       TEDGE1,  TEDGE2  :  ARRN;

       CONNECT    : boolean;


ptrazo
		: matriz_de_trazos;
		

entrada,
param,
salida,
ordenes,
listado
		: Text ;
		
tengoIn,
tengoOut,
tengoParam,
tengoOrden,
comun,
sip,
printkml,
prekaos,
kaos,
kaos2,
kaos3,
hacertrack,
salidausada,
hicelistado,
ordenok,
buscandonodos,
nodoshay,
kmlall,
kmlgen
				: boolean;


