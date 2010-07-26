Function Int2S (I : Longint) : String;

Var S : String;

begin
 Str (I,S);
 Int2S:=S;
end;



procedure escribir_puntos (Puntos_escribir: tipopuntos);

{
	25 mayo 2010
	
	escribe puntos en lugar de MST en el kml
	
	}
	
var

contador1
				: LongInt;



begin {escribir_puntos}

Puntos_escribir:=nuevos_puntos(Puntos_escribir);
salidausada:=true;
 for contador1:= 1 to Puntos_escribir^.numero do 
 	begin
 	writeln(salida,Puntos_escribir^.coord[contador1]^.x,' - ',Puntos_escribir^.coord[contador1]^.y);
 	//escribir un punto 		
 		end;
 	
 
end; {track_uno}



function recorrer_2_tramos (sp1, tramo1, sp2, tramo2:longint): tipopuntos; // ESTE recorre las especies contar0 y contar1


{
	25 mayo 2010
	
	compara dos tramos de track1
	y si verdad la respuesta es los
	respectivos puntos
	
	}

var

Puntos2tramos
		: tipopuntos;

begin {recorrer dos tramos}

if kaos3 then writeln('inicio recorrido con ',sp1,' ',sp2);


new(Puntos2tramos);
Puntos2tramos^.numero:=0;
comun:=false;

			
if (verdad(sp1,sp2, tramo1, tramo2)) or (verdad(sp2,sp1, tramo2, tramo1))   then

		begin
		adicionpuntos(Puntos2tramos,unir_tramos(pTrazo[sp1]^.tramo[tramo1], pTrazo[sp2]^.tramo[tramo2], 'q'));

		if buscandonodos then 
							begin
							pTrazo[sp1]^.tramo[tramo1]^.node :=true;
							pTrazo[sp2]^.tramo[tramo2]^.node :=true;
							end;

		end;

recorrer_2_tramos:=Puntos2tramos;

						

end;  {recorrer dos tramos}




procedure track_uno (track1 : LongInt);

{
	25 mayo 2010
	
	compara los tramos de track1
	con todos los tramos de todas las especies
	la respuesta es un MST por tramo
	
	}
	
var

contador1,
contador2,
contador3,
temp_repetidos
				: LongInt;


Puntos_track
		: tipopuntos;


begin {track_uno}
 for contador1:= 1 to pTrazo[track1]^.num_tramos do 
 	begin
 		temp_repetidos:=0;
		new (Puntos_track);
		Puntos_track^.numero:=0;
		if kaos3 then writeln('COMPARADA ENTRADA num respuestas ',numRespuestas);
		
	 	for contador2:= 1 to num_especies do
 		begin
 		if (contador1 <> contador2) then
 			begin
 			for contador3:= 1 to pTrazo[contador2]^.num_tramos do
 				begin
 					if kaos3 then 
 							begin
 				 			clrscr;
 							gotoxy(2,4);
 							writeln('Tracking ');
 							gotoxy(2,6);
 							writeln(' T 1 ',pTrazo[contador1]^.especie);
 							gotoxy(2,7);
 							writeln(' T 2 ',pTrazo[contador2]^.especie);
							end;
					adicionpuntos(Puntos_track,recorrer_2_tramos (track1, contador1, contador2, contador3));
					repetidos:=repetidos+1;
					if ((temp_repetidos > 15) and (Puntos_track^.numero  > 1)) or (Puntos_track^.numero  > 500) then
					begin
 					gotoxy(2,10);
 					writeln ('eliminating redundant points');
 					Puntos_track:=nuevos_puntos(Puntos_track);
 					repetidos:=0;
 					end;
 				
 				 			
		 			end; 			
 				
 				
 				end;
 
 		end;
 		
 
 		
 					if Puntos_track^.numero  > 1 then
						begin
						if hacertrack then 
						begin
						if kaos3 then writeln ('Tengo MST con',Puntos_track^.numero);
						especie_en_uso:=nspp+1;
						Puntos_track^.especie:='t'+pTrazo[track1]^.especie+'-'+Int2S(contador1);
						nombre_sp_en_uso:=puntos_track^.especie;
						armar_el_trazo(especie_en_uso,Puntos_track);
						pTrazo[especie_en_uso]^.especie:=puntos_track^.especie;
						end else if kaos3 then writeln ('NO Tengo MST ');
						end;
						if not hacertrack then escribir_puntos(Puntos_track);
 

 		
 		
 		end;
 	
 
end; {track_uno}



//
procedure buscarnodos (track1, minsp, maxsp : LongInt);

var

contador1,
contador2,
contador3,
temp_repetidos
				: LongInt;


				
Puntos_track
		: tipopuntos;

begin {buscarnodos}
 for contador1:= 1 to pTrazo[track1]^.num_tramos do 
 	begin
 		buscandonodos:=true;
 		nodoshay:=false;
		new (Puntos_track);
		Puntos_track^.numero:=0;
		Puntos_track^.especie:=pTrazo[track1]^.especie+IntToStr(track1);

 		temp_repetidos:=0;
 				
	 	for contador2:= minsp to maxsp do
 		begin
 		if (track1 <> contador2)
 		and (pTrazo[contador2] <> nil )
   		and (pTrazo[contador2]^.num_tramos > 0)
   		and (pTrazo[contador2]^.g_track)
   		then
 			begin
 			for contador3:= 1 to pTrazo[contador2]^.num_tramos do
 				begin
 					if prekaos then 
 							begin
 				 			clrscr;
 							gotoxy(2,4);
 							writeln('Tracking to get nodes');
 							gotoxy(2,6);
 							writeln(' Track 1 ',track1,' ',pTrazo[track1]^.especie,'. segment ',contador1/pTrazo[track1]^.num_tramos*100:3:2,' % ');
 							gotoxy(2,7);
 							writeln(' Track 2 ',contador2,' ',pTrazo[contador2]^.especie,'. segment ',contador3/pTrazo[contador2]^.num_tramos*100:3:2,' % ');
							end;		
					if 	not pTrazo[track1]^.tramo[contador1]^.node and not pTrazo[contador2]^.tramo[contador3]^.node
					then
					adicionpuntos(Puntos_track,recorrer_2_tramos (track1, contador1, contador2, contador3));
					
					repetidos:=repetidos+1;
					if ((temp_repetidos > 10) and (Puntos_track^.numero  > 2)) or (Puntos_track^.numero  > 40) then
					begin
 					Puntos_track:=nuevos_puntos(Puntos_track);
 					repetidos:=0;
 					end;
 					 			
		 			end; 										
 				end;
 		end;
 		
 		Puntos_track:=nuevos_puntos(Puntos_track);
 		repetidos:=0;
		if (Puntos_track <> nil) and 
		(Puntos_track^.numero > 0) 
		then 
			begin
			ptos2kml(Puntos_track,(contador1+track1+contador2));
			nodes:=nodes+1;
			if prekaos then writeln('nodes found, tracks ',pTrazo[track1]^.especie,' tm ',contador1,' with ',
			pTrazo[contador2]^.especie);
			end;
					
		dispose(Puntos_track);
 				
 		end;
 	
end; {buscarnodos}



//
procedure buscarendem (track1, minsp, maxsp : LongInt);

var

contador1,
contador2,
contador3,
temp_repetidos
				: LongInt;

Puntos_track
		: tipopuntos;

begin {buscarnodos}
new (Puntos_track);
Puntos_track^.numero:=0;
Puntos_track^.especie:='endem'+pTrazo[track1]^.especie+IntToStr(track1);
		
 for contador1:= 1 to pTrazo[track1]^.num_tramos do 
 	begin
		

 		temp_repetidos:=0;
 				
	 	for contador2:= minsp to maxsp do
 		begin
 		if (contador1 <> contador2) and
		(pTrazo[contador2] <> nil )
   		and (pTrazo[contador2]^.num_tramos > 0)
   		then
 			begin
 			for contador3:= 1 to pTrazo[contador2]^.num_tramos do
 				begin
 					if prekaos then 
 							begin
 				 			clrscr;
 							gotoxy(2,4);
 							writeln('Tracking  for nodes');
 							gotoxy(2,6);
 							writeln(' Track 1 ',pTrazo[track1]^.especie,' ',contador1);
 							gotoxy(2,7);
 							writeln(' Track 2 ',pTrazo[contador2]^.especie);
							end;		
					adicionpuntos(Puntos_track,recorrer_2_tramos (track1, contador1, contador2, contador3));
					repetidos:=repetidos+1;
					if ((temp_repetidos > 10) and (Puntos_track^.numero  > 2)) or (Puntos_track^.numero  > 40) then
					begin
 					Puntos_track:=nuevos_puntos(Puntos_track);
 					repetidos:=0;
 					end;
 				
 				 			
		 			end; 			
 				
 				
 				end;
 
 		end;
 		
 		end;
 		Puntos_track:=nuevos_puntos(Puntos_track);
 		repetidos:=0;
		if (Puntos_track <> nil) and 
		(Puntos_track^.numero > 0) 
		then 
			begin
			ptos2kml(Puntos_track,(contador1+track1+contador2));
			if prekaos then writeln('nodes found tracks ',pTrazo[track1]^.especie,' tm ',contador1,' with ',
			pTrazo[contador2]^.especie);
			end;
			
		dispose(Puntos_track);
 				
 	
end; {buscarnodos}


