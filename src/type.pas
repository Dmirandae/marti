// un punto geografico, dos reales //

TYPE
   Tcoord = ^coord;        (* tipo basico del analisis un punto son dos coordenadas *)
      coord = RECORD
             x, y:
                           real;
      END;




// un tramo, unidad de comparacion, dos puntos geograficos, tamaño, angulo y si es general_track //

TYPE
   tipotramo = ^tramo;		(* tipo basico del analisis un trazo son dos puntos y chismes *)
   tramo = RECORD
 //            num_tramo:
 //                           LongInt;

	     Ncoord, Scoord:
	    		    		TCoord;		      (*  coordenadas punto 1 y punto 2 *)

	     angle, size:
                            real;
         
         node:
                            boolean;
			   
      END;

// la matriz de tramos sin info adicional //

TYPE
matriz_de_tramos
                = array [1..maxpuntos] of tipotramo;



// un trazo como matriz de tramos e info adicional: tamaño, limites //

TYPE
   tipotrazo = ^trazo;				 
   
   trazo = RECORD
             num_trazo,
             num_tramos:
                           LongInt;

	     	 Max_X, Max_Y,
             Min_X, Min_Y,
             size:
	    		    		real;

             g_track, 
             g_node:
                            boolean;

   			especie:
   						string;
   				

             tramo:
                            matriz_de_tramos;

      END;


TYPE

    matriz_de_trazos        = array [1..(maxsp*3)] of tipotrazo;


//
// abril 06 2010
// incluida matriz de puntos para manejar los puntos como estructura completa
// incluido tamanho
//

TYPE

//matriz_de_puntos = array [1..maxpuntos] of Tcoord;
matriz_de_puntos = array [1..maxpuntos] of Tcoord;


TYPE
   tipopuntos = ^puntos;				 (* puntos y el numero de puntos *)
   
   puntos = RECORD
   especie
   					:	string;
	numero:
						integer; // numero de puntos
						
	coord:
                matriz_de_puntos; // matriz de coordenadas

END;

TYPE

	ARRNN
		= array	[1..maxpuntos,1..maxpuntos] of LongInt;

	ARRN
		= array[1..maxpuntos] of LongInt;

tipodatos
		= string[3];
