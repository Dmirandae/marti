//cosas raras

// se debne eliminar todos los puntos1 y pasar todo a objetos

procedure pause;

begin
  WriteLn('Waiting until a key is pressed');
  repeat
  until KeyPressed;
 { The key is not Read,
   so it should also be outputted at the commandline}
end;




procedure matriz_distancia(Puntos_matriz: tipopuntos);

var
i,j: integer;


begin {matriz_distancia}

if prekaos then writeln('calculando distancia');
	begin
	// inicializado del a matriz a valor inf
	// writeln (salida,numpuntos);
	for i:= 1 to Puntos_matriz^.numero do
	for j:= 1 to Puntos_matriz^.numero do
	begin
		W[i,j]:=INF;
		if kaos3 then writeln (salida,i,'**',j);
		if kaos3 then writeln (salida,j,' P x: ',Puntos_matriz^.coord[j]^.x:2:2,' P y: ',Puntos_matriz^.coord[j]^.y:2:2);

	end;
	end;

	// calculado de euclid entre puntos y matriz
	for i:= 1   to Puntos_matriz^.numero do
	for j:= i+1 to Puntos_matriz^.numero do
	begin
	//  
	W[i,j]:=(round(100*euclid(Puntos_matriz^.coord[i], Puntos_matriz^.coord[j])));
	W[j,i]:=(round(100*euclid(Puntos_matriz^.coord[j], Puntos_matriz^.coord[i])));
      if j > 1 then 
        begin
        closeto[j]:=1;
        DIST[j]:=W[1,j];
	end;

	end;

if kaos3 then begin
			writeln(salida, numpuntos);
			for i:= 1 to Puntos_matriz^.numero do
				begin
					for j:= 1 to Puntos_matriz^.numero do
					write(salida, W[i,j],' ');
					writeln(salida);
					end;
end;

end; {matriz_distancia}





procedure PRIM;

   var U,K,MIN,TCOUNT:LongInt;
//       closeto,DIST       :ARRN;
begin
gotoxy(2,10);
if prekaos then writeln('inicio prim');
//N:= Puntos_en_uso^.numero;
   closeto[1]:=0;
	// for I:=2 to N do begin
	//  closeto[I]:=1;  DIST[I]:=W[1,I];
	//  write(salida,i,'   ',closeto[I],' -dist ',DIST[I]);
	// end;
   
   TCOUNT:=0;  TWEIGHT:=0;
   CONNECT:=true;                             (* INITIALIZATION OVER *)
   while (TCOUNT < N-1) and CONNECT  do begin
      MIN:=INF;
      for K:=2 to N do
         if closeto[K] <> 0 then
            if DIST[K] < MIN then begin
               U:=K;  MIN:=DIST[K];
 //              writeln('procesando 1 ',k/n*100:2:1,'%');
            end;
      if DIST[U] >= INF then CONNECT:=false
      else begin
         TCOUNT:=TCOUNT+1;  TWEIGHT:=TWEIGHT+DIST[U];
         TEDGE1[TCOUNT]:=closeto[U];  TEDGE2[TCOUNT]:=U;
         closeto[U]:=0;
         for K:=2 to N do
            if closeto[K] <> 0 then
               if W[K,closeto[K]] > W[K,U] then begin
                  DIST[K]:=W[K,U]; closeto[K]:=U;
 //              writeln('procesando 2 ',k/n*100:2:1,'%');
               end
      end  (* ELSE: NOT (DIST[U] >= INF) *)
   end  (* WHILE (TCOUNT < N-1) ... *);
   gotoxy(2,11);
   if prekaos then writeln('prim done');
   
end;  (* PRIM *)



procedure Armar_un_trazo (contar : LongInt; puntos_trazo: tipopuntos);

var
i,
j,
counter
		: LongInt;

begin {Armar_un_trazo}
clrscr;
 
  begin
if prekaos then writeln('starting MST constructor');
                
               new (pTrazo[contar]);


		if pTrazo[especie_en_uso] <> nil then nombre_sp_en_uso:=pTrazo[especie_en_uso]^.especie;		
		
        pTrazo[contar]^.especie:=nombre_sp_en_uso+'_';



                
                pTrazo[contar]^.num_tramos:=N-1;

                pTrazo[contar]^.size:= TWEIGHT;

if kaos3 then begin
				writeln('nuevo ptrazo in ',contar);

				writeln('name MST= ',pTrazo[contar]^.especie);

				writeln('size= ',pTrazo[contar]^.size:3:3);
                
				writeln('track ',pTrazo[contar]^.especie,'. Num segments= ',pTrazo[contar]^.num_tramos);

				writeln('num points= ',puntos_trazo^.numero);
				
				end;
				

    for counter := 1 to N-1 do
    begin

	i:=TEDGE1[counter];
	j:=TEDGE2[counter];
				new (pTrazo[contar]^.tramo[counter]);


				new (pTrazo[contar]^.tramo[counter]^.Ncoord);                
                new (pTrazo[contar]^.tramo[counter]^.Scoord);


if kaos3 then writeln(puntos_trazo^.coord[i]^.x,'-',puntos_trazo^.coord[i]^.y,'*',
        				puntos_trazo^.coord[j]^.x,'-',puntos_trazo^.coord[j]^.y);
                
    pTrazo[contar]^.tramo[counter]^.Ncoord^.x := puntos_trazo^.coord[i]^.x;
	pTrazo[contar]^.tramo[counter]^.Ncoord^.y := puntos_trazo^.coord[i]^.y;
    pTrazo[contar]^.tramo[counter]^.Scoord^.x := puntos_trazo^.coord[j]^.x;
    pTrazo[contar]^.tramo[counter]^.Scoord^.y := puntos_trazo^.coord[j]^.y;

	pTrazo[contar]^.tramo[counter] 			:=  occidente(alnorte(pTrazo[contar]^.tramo[counter]));
	pTrazo[contar]^.tramo[counter]^.size	:=  euclid(pTrazo[contar]^.tramo[counter]^.Ncoord, pTrazo[contar]^.tramo[counter]^.Scoord);
	pTrazo[contar]^.tramo[counter]^.angle 	:=  angulo(pTrazo[contar]^.tramo[counter]^.Ncoord, pTrazo[contar]^.tramo[counter]^.Scoord);
	
    end;

  end;
  
  numRespuestas:=numRespuestas+1;

//
// para imprimir
//

if printkml then trck2kml(contar);

if prekaos then writeln('MST constructor finished ',numRespuestas);
end; {Armar_un_trazo}



procedure reduce2tracks (contar0, contar1 : LongInt);

var

puntosTemporales
			:tipopuntos;
			
i,
j
			:longInt;			
			
nombre
			:string;			

begin {reduce2track1}
nrep:=nrep+1;
if prekaos then writeln('reducing ',Ptrazo[contar0]^.especie,' - ',Ptrazo[contar1]^.especie);
if ((Ptrazo[contar0]<> nil) and (Ptrazo[contar1]<> nil))
 		and ((Ptrazo[contar0]^.num_tramos> 0) and (Ptrazo[contar1]^.num_tramos> 0))
 		 then
 		 begin
 		  begin
 		    new(puntosTemporales);
 		    puntosTemporales^.numero:=(Ptrazo[contar0]^.num_tramos+Ptrazo[contar0]^.num_tramos)*2;
 		    for i:=1 to Ptrazo[contar0]^.num_tramos do
 		    begin
 		    new(puntosTemporales^.coord[i+(i-1)]);//norte
 		    puntosTemporales^.coord[i+(i-1)]:=pTrazo[contar0]^.tramo[i]^.Ncoord;
 		    new(puntosTemporales^.coord[i+i]); // sur
 		    puntosTemporales^.coord[i+i]:=Ptrazo[contar0]^.tramo[i]^.SCoord;
 		    end;
 		  	nombre:=Ptrazo[contar0]^.especie;
 		  	nombre:=nombre+Ptrazo[contar1]^.especie;
 		  	
 		  	for j:=1 to Ptrazo[contar1]^.num_tramos do
 		    begin
 		    new(puntosTemporales^.coord[i+i+(j-1)+j]);//norte
 		    puntosTemporales^.coord[i+i+(j-1)+j]:=pTrazo[contar1]^.tramo[j]^.Ncoord;
 		    new(puntosTemporales^.coord[i+i+j+j]); // sur
 		    puntosTemporales^.coord[i+i+j+j]:=Ptrazo[contar1]^.tramo[j]^.SCoord;
 		    end;
 		  	if kaos3 then writeln ('puntos temporales post union= ',PuntosTemporales^.numero);
 		  	
 		  	puntosTemporales:=nuevos_puntos(puntosTemporales);
 		  	matriz_distancia(puntosTemporales);
			N:= puntosTemporales^.numero;
 		  	PRIM;
 		  	if kaos3 then writeln ('prim puntos1= ',puntosTemporales^.numero);
 		  	if contar1 < contar0 then 
 		  							begin
 		  							i:=contar0;
 		  							j:=contar1;
 		  							contar0:=j;
 		  							contar1:=i;
 		  							end;
 		  	//
 		  	dispose(Ptrazo[contar0]);

 		  	//especie_en_uso:=contar0;
 		  	if prekaos then writeln ('asignacion de especie en uso');
 		  	Armar_un_trazo(contar0,puntosTemporales);
 		  	if puntosTemporales <> nil then dispose (puntosTemporales);
 		  	Ptrazo[contar0]^.especie:=nombre;
 		  	Ptrazo[contar0]^.g_track:=true;

 		  	if Ptrazo[contar1] <> nil then dispose(Ptrazo[contar1]);
 		  	new(Ptrazo[contar1]);
 		  	Ptrazo[contar1]^.num_tramos:=0; 		  	
 		  	end;
 		  	
 		 end;
		if prekaos then writeln('tracks ',Ptrazo[contar0]^.especie,' - ',Ptrazo[contar1]^.especie,' joint'); 		 
end;{reduce2tracks1}


procedure jointracks (minim, maxim :longint);

var

i,j
		: longint;

rtemp
		: real;	
		
begin {jointracks}


	for i:=minim to maxim do
			begin
			for j:=minim+1 to maxim do
				if  ((Ptrazo[i]<> nil) and (Ptrazo[j]<> nil))
				and  ((Ptrazo[i]^.num_tramos> 0) and (Ptrazo[j]^.num_tramos> 0))
				and (i<>j)
				then 
				begin				
				rtemp:=max(congruencia (i, j, 'min'), congruencia(j, i, 'min'));
				if (rtemp > congruencia_minima) 	then 
						begin						
						clrscr;
						if kaos then writeln(rtemp,'reduciendo ',i, ' y   ',j);
						reduce2tracks(i,j);
						end;
				end;
			end;
					
					
			if prekaos then begin
							clrscr;
							writeln('Tracks from ',minim,' to ',maxim,' merged if cong>',congruencia_minima:2:3);
							end;

end; {jointracks}




procedure jointracksotro (minim, maxim :longint);

var

i,j
		: longint;

rtemp
		: real;		


begin {jointracks}


	for i:=minim to maxim do
			begin
			for j:=minim+1 to maxim do
				if  ((Ptrazo[i]<> nil) and (Ptrazo[j]<> nil))
				and  ((Ptrazo[i]^.num_tramos> 0) and (Ptrazo[j]^.num_tramos> 0))
				and (i<>j)
				then 
				begin				
				rtemp:=max(congruencia (i, j, 'min'), congruencia(j, i, 'min'));
				if (rtemp > congruencia_minima) 	then 
						begin						
						clrscr;
						if kaos then writeln(rtemp,'reduciendo ',i, ' y   ',j);
						reduce2tracks(i,j);
						end;
				end;
			end;
					
					
			if prekaos then begin
							clrscr;
							writeln('Tracks from ',minim,' to ',maxim,' merged if cong>',congruencia_minima:2:3);
							end;

end; {jointracks}



procedure jointracks_old (minim, maxim :longint);

var

i,j
		: longint;

rtemp
		: real;		


begin {jointracks}

//if (congruencia_minima>1.0000001) then congruencia_minima:=congruencia_minima/100; 

if maxim > nspp then maxim:= nspp;


	for i:=minim to maxim do
			begin
			for j:=minim+1 to maxim do
				if  ((Ptrazo[i]<> nil) and (Ptrazo[j]<> nil))
				and  ((Ptrazo[i]^.num_tramos> 0) and (Ptrazo[j]^.num_tramos> 0))
				and (i<>j)
				then 
				begin				
				rtemp:=max(congruencia (i, j, 'min'), congruencia(j, i, 'min'));
				if (rtemp > congruencia_minima) 	then 
						begin						
						clrscr;
						if kaos then writeln(rtemp,'reduciendo ',i, ' y   ',j);
						reduce2tracks(i,j);
						end;
				end;
			end;
					
					
			if prekaos then begin
							clrscr;
							writeln('Tracks from ',minim,' to ',maxim,' merged if cong>',congruencia_minima:2:3);
							end;

end; {jointracks}


procedure enlistar_datos(nombrearchivo:string);

begin {enlistar_datos_xyl}

	assign(listado,nombrearchivo);
	rewrite(listado);
	writeln(listado,'#num especies= ',num_especies);
	writeln(listado,'#num total tracks= ',nspp);	
for itemp:=1 to nspp do
				begin
				if (pTrazo[itemp]^.num_tramos>0) then 
				begin
				writeln(listado, itemp,'. ',pTrazo[itemp]^.especie,' ',pTrazo[itemp]^.num_tramos,' ',pTrazo[itemp]^.size:3:3,' gtrack ',pTrazo[itemp]^.g_track);
				end;
				end;
	close(listado);
	hicelistado:=true; 												
end; {enlistar_datos_xyl}



procedure adicionpuntos (a,b: tipopuntos);

var
i
		:	longint;


begin {adicionpuntos}

if kaos3 then writeln('numeros puntos pre ',a^.numero,' ',b^.numero);

for i:=a^.numero+1 to a^.numero+b^.numero
do
begin
new (a^.coord[i]);
a^.coord[i]:=b^.coord[(i-a^.numero)];
if kaos3 then writeln('numeros pasos en ',i);
end;
a^.numero:=a^.numero+b^.numero;

if kaos3 then writeln('numeros puntos post ',a^.numero,' ',b^.numero);
end; {adicionpuntos}





// entradas


procedure entrar_trazos;

// ESTE LEE TRAZOS
var
i,
contar
: integer;


begin {entrar_trazos}

		if prekaos then writeln('Entrando datos.');
// lee los parametros iniciales

readln (entrada, num_especies);


// inicializar datos de la estructura general

i:= 0;
nspp := num_especies;
if kaos3 then writeln('primera asignacion de nspp ',nspp);

for contar:=1 to num_especies do

begin
                new (pTrazo[contar]);

                readln (entrada, pTrazo[contar]^.especie);

                readln (entrada, pTrazo[contar]^.size);
                
                readln (entrada, pTrazo[contar]^.num_tramos);

if prekaos then writeln('Datos de la especie ',pTrazo[contar]^.especie,'  ',contar/num_especies*100:2:2,' %'); 
begin

for i:= 1 to  pTrazo[contar]^.num_tramos do
		begin
                new (pTrazo[contar]^.tramo[i]);
                new (pTrazo[contar]^.tramo[i]^.Ncoord);
                new (pTrazo[contar]^.tramo[i]^.Scoord);


		pTrazo[contar]^.num_trazo:= i;

// esta es lectura basica de las cordenadas de un tramo, los dos puntos en la misma linea

	readln (entrada, 
	pTrazo[contar]^.tramo[i]^.Ncoord^.x, 
	pTrazo[contar]^.tramo[i]^.Ncoord^.y,
    pTrazo[contar]^.tramo[i]^.Scoord^.x, 
    pTrazo[contar]^.tramo[i]^.Scoord^.y);

        // actividades de orientar y medir


	pTrazo[contar]^.tramo[i] 		:=  occidente(alnorte(pTrazo[contar]^.tramo[i]));
	pTrazo[contar]^.tramo[i]^.size	:=  euclid(pTrazo[contar]^.tramo[i]^.Ncoord, pTrazo[contar]^.tramo[i]^.Scoord);

	pTrazo[contar]^.tramo[i]^.angle :=  angulo(pTrazo[contar]^.tramo[i]^.Ncoord, pTrazo[contar]^.tramo[i]^.Scoord);
	end;

end;
end;
end; {entrar_trazos}



procedure escribir_especie (contar0:longint);

 // ESTE escribe datos de la especie contar0 en texto y sin formato

var
i
: integer;


begin {escribe_especie}

              writeln (salida, pTrazo[contar0]^.especie);

              writeln (salida, pTrazo[contar0]^.size);
                
              writeln (salida, pTrazo[contar0]^.num_tramos);


for i:= 1 to  pTrazo[contar0]^.num_tramos do
		begin

	writeln (salida, 
	pTrazo[contar0]^.tramo[i]^.Ncoord^.x, pTrazo[contar0]^.tramo[i]^.Ncoord^.y,
    pTrazo[contar0]^.tramo[i]^.Scoord^.x, pTrazo[contar0]^.tramo[i]^.Scoord^.y);


	end;


end;  {escribe_especie}


// procedimientos de salidas



function unir_tramos(Ttramo1, Ttramo2: tipotramo ; operacion :string):tipopuntos;

var

i : integer;

Puntos_unir
		: tipopuntos;

begin {unir_tramos}
//
new(Puntos_unir);
if kaos3 then writeln('empezando imprimir con ',operacion);

if operacion = 'l' then 
begin
//if (Ttramo1^.size > Ttramo2^.size) then 
//begin
//writeln (salida,Ttramo1^.Ncoord^.x:2:4,' ',Ttramo1^.Ncoord^.y:2:4);
///writeln (salida,Ttramo1^.Scoord^.x:2:4,' ',Ttramo1^.Scoord^.y:2:4);
//end
//else
//begin
//writeln (salida,Ttramo2^.Ncoord^.x:2:4,' ',Ttramo2^.Ncoord^.y:2:4);
//writeln (salida,Ttramo2^.Scoord^.x:2:4,' ',Ttramo2^.Scoord^.y:2:4);
//end;
end;

if operacion = 'c' then 
begin
//if Ttramo1^.size < Ttramo2^.size then 
//writeln (salida,Ttramo1^.Ncoord^.x:2:4,' ',
//Ttramo1^.Ncoord^.y:2:4,' ',Ttramo1^.Scoord^.x:2:4,' ',Ttramo1^.Scoord^.y:2:4)
//else
//writeln (salida,Ttramo2^.Ncoord^.x:2:4,' ',
//Ttramo2^.Ncoord^.y:2:4,' ',Ttramo2^.Scoord^.x:2:4,' ',Ttramo2^.Scoord^.y:2:4);
end;

//
// revisar el calculo de medias
// marzo 24 2009
//

if operacion = 'm' then 
begin
//writeln (salida,
//mediaarit(Ttramo1^.Ncoord,Ttramo2^.Ncoord)^.x:2:4,' ',
//mediaarit(Ttramo1^.Ncoord,Ttramo2^.Ncoord)^.y:2:4);
//writeln (salida,
//mediaarit(Ttramo1^.Scoord,Ttramo2^.Scoord)^.x:2:4,' ',
//mediaarit(Ttramo1^.Scoord,Ttramo2^.Scoord)^.y:2:4)

end;


if operacion = 'q' then 

begin

for i:= 1 to 4 do
        begin
        new (Puntos_unir^.coord[i]);
        end;
        
        Puntos_unir^.coord[1]^.x := Ttramo1^.Ncoord^.x;
        Puntos_unir^.coord[1]^.y := Ttramo1^.Ncoord^.y;
        Puntos_unir^.coord[2]^.x := Ttramo1^.Scoord^.x;
        Puntos_unir^.coord[2]^.y := Ttramo1^.Scoord^.y;
        Puntos_unir^.coord[3]^.x := Ttramo2^.Ncoord^.x;
        Puntos_unir^.coord[3]^.y := Ttramo2^.Ncoord^.y;
        Puntos_unir^.coord[4]^.x := Ttramo2^.Scoord^.x;
        Puntos_unir^.coord[4]^.y := Ttramo2^.Scoord^.y;
                       
         
end;
Puntos_unir^.numero:=4;
unir_tramos:=nuevos_puntos(Puntos_unir);

end; {unir_tramos}



procedure escribir_trazos; // ESTE escribe TRAZOS
var
contar
: integer;


begin {escribe_trazos}

writeln (salida, num_especies);

for contar:=1 to num_especies do

escribir_especie(contar);

end; {escribe_trazos}


// operaciones de tramos

//operaciones entre trazos


function recorrer_2_especies (contar0, contar1:longint): tipopuntos; 

// ESTE recorre las especies contar0 y contar1

var
i,
j
: integer;


Puntos2sp
		: tipopuntos;

begin {recorrer dos especies}
//
if kaos3 then writeln('inicio recorrido con ',contar0,' ',contar1);
//
// reglas de control para tracks vacios?
// trcks de un solo punto!
//

new(Puntos2sp);
Puntos2sp^.numero:=0;
comun:=false;


if ((pTrazo[contar0]^.num_tramos > 0) and (pTrazo[contar1]^.num_tramos > 0))
	and
	((pTrazo[contar0]<> nil) and (pTrazo[contar1]<> nil))
	and
	(contar0<>contar1)
	then
	begin

for i:= 1 to  pTrazo[contar0]^.num_tramos do
    	begin
		for j:= 1 to  pTrazo[contar1]^.num_tramos do
			begin
            if (verdad(contar0,contar1, i, j)) 
            or (verdad(contar1,contar0, j, i))   then
            begin

               adicionpuntos(Puntos2sp,unir_tramos(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j], 'q'));
               comun:=true;

            end;   

            end;
    	end;
	end;
	
recorrer_2_especies:=nuevos_puntos(Puntos2sp);

if prekaos or kaos3 then gotoxy (2,8);

if comun and  prekaos then writeln ('common segments ',Puntos2sp^.numero/4:3:0) else if prekaos then writeln ('NO common segments');

end;  {recorrer dos especies}




// operaciones entre puntos

procedure propincuidad (Puntos_prop:tipopuntos);

var
i,j,k: integer;
suma: real;

begin {propincuidad}
k:=0;
suma:=0.0;
//
// evalua la media de las distancias eculidiadas entre los puntos
//

	for i:= 1   to Puntos_prop^.numero do
	for j:= i+1 to Puntos_prop^.numero do

	begin
	k:=k+1;
	suma:=suma+abs(euclid (Puntos_prop^.coord[i],  Puntos_prop^.coord[j]));
	end;
	if numpuntos < 10 then k:= k+10;	
	prop_media:= suma/(k*4.1);
end; {propincuidad}




procedure new_tramo(contar: longint);

begin
gotoxy(2,10);
if prekaos then writeln ('procese salida ', contar);

end;



procedure armar_el_trazo (contar99 : LongInt; puntos_en_uso: tipopuntos);

begin {armar_el_trazo}
clrscr;
if prekaos then writeln('armando el trazo');

if pTrazo[contar99] <> nil then if prekaos then writeln ('construyendo el trazo para los puntos congruentes',pTrazo[contar99]^.especie);

puntos_en_uso:=nuevos_puntos(puntos_en_uso);

if (puntos_en_uso^.numero > 1) then 
		begin
		matriz_distancia(puntos_en_uso);
		N:= Puntos_en_uso^.numero;
		PRIM;
		if (CONNECT = true) and (puntos_en_uso^.numero > 1) then 
 			begin

 			if prekaos then writeln('Track exists');
 			nspp:=nspp+1;
 			armar_un_trazo(nspp,puntos_en_uso);
 			
 			if nspp > maxsp*3-1 then begin
									writeln('num. of tracks overflowed');
									writeln('Please consider 64 bits version');
									writeln('or change parameters');
									cerrar_kml;
									halt;
									end;
 			

 			if kaos3 then begin
 							writeln('nspp sumo 1 a las respuestas anteriores ',nspp);
 							
 							writeln('llamando al armador de un solo trazo');
 							
 							writeln('puntos en uso',puntos_en_uso^.numero);
 							
 							writeln('N= ',N,' -- numrespuestas=  ',nspp);
 							
 							end;
 			 
			end;
		end

			else if prekaos then writeln('No hago trazo con menos de 2 puntos');


end; {armar_el_trazo}




procedure comparar_por_grupos (contar0, contar1 : LongInt);

var

contador1,
contador2
			: LongInt;

tmpcong
			: real;

Puntos_grupos
		: tipopuntos;


begin {comparar_por_grupos}
 for contador1:= contar0 to contar1 do 
 	begin
		new (Puntos_grupos);
		Puntos_grupos^.numero:=0;

		if kaos3 then writeln('COMPARADA ENTRADA num respuestas ',numRespuestas);

	 	for contador2:= contar0 to contar1 do
		begin
			if (contador1 <> contador2)			
			and  (pTrazo[contador1]^.especie<>pTrazo[contador2]^.especie)
			and	((pTrazo[contador1] <> nil) 
			and (pTrazo[contador2] <> nil)) 
			and	((pTrazo[contador1]^.num_tramos > 0) 
			and (pTrazo[contador2]^.num_tramos > 0))
			then
			begin
				if prekaos then 
								begin						
								clrscr;
								gotoxy(2,4);
								writeln('Tracking ');
								gotoxy(2,5);
								writeln(' T 1 ',contador1,' =',pTrazo[contador1]^.especie);
								gotoxy(2,6);
								writeln(' T 2 ',contador2,' =',pTrazo[contador2]^.especie);		
								end;
								
//				// aqui la comparada del par para ver si se unen o no!

			adicionpuntos(Puntos_grupos,recorrer_2_especies (contador1, contador2));

			if kaos3 then writeln ('eliminando puntos redundantes');	

			Puntos_grupos:=nuevos_puntos(Puntos_grupos);

			if prekaos then begin
							gotoxy(2,10);
							writeln (' MST ??');
							gotoxy(2,11);
							writeln (pTrazo[contador1]^.especie,'  ',pTrazo[contador2]^.especie);
							gotoxy(2,12);
							writeln ('points',Puntos_grupos^.numero );
							writeln('answers ',numRespuestas); 
							end;
							
 			
		
		end; // if si lo hago o no

		end;// contador2

			if Puntos_grupos^.numero  > 1 then

				begin //inicia armador de trazo
				if prekaos then writeln ('Tengo MST con ',Puntos_grupos^.numero,' puntos.');
				especie_en_uso:=contador1;
				armar_el_trazo(especie_en_uso,Puntos_grupos);
				pTrazo[nspp]^.g_track:=true;
				pTrazo[contador1]^.g_track:=false;
				pTrazo[contador2]^.g_track:=false;
				pTrazo[nspp]^.especie:=pTrazo[contador1]^.especie+pTrazo[contador2]^.especie;

				end
				 else 
				begin
				if prekaos then writeln ('NOP, NO tengo MST');
				end; // finaliza  armador

		if Puntos_grupos <> nil then dispose(Puntos_grupos);

	end; // contador1

				
if prekaos then writeln ('number of tracks generated ',nspp);
sleep(100);				
end; {comparar_por_grupos}




procedure comparar_por_grupos_new (contar0, contar1 : LongInt);

var

contador1,
contador2
			: LongInt;

tmpcong
			: real;

Puntos_grupos
		: tipopuntos;


begin {comparar_por_grupos}
 for contador1:= contar0 to contar1 do 
 	begin
		new (Puntos_grupos);
		Puntos_grupos^.numero:=0;

		if kaos3 then writeln('COMPARADA ENTRADA num respuestas ',numRespuestas);

	 	for contador2:= contar0 to contar1 do
		begin
			if (contador1 <> contador2)			
			and  (pTrazo[contador1]^.especie<>pTrazo[contador2]^.especie)
			and	((pTrazo[contador1] <> nil) 
			and (pTrazo[contador2] <> nil)) 
			and	((pTrazo[contador1]^.num_tramos > 0) 
			and (pTrazo[contador2]^.num_tramos > 0))
			and	(pTrazo[contador1]^.g_track) 
			and	(pTrazo[contador2]^.g_track) 
			
			then
			begin
				if prekaos then 
								begin						
								clrscr;
								gotoxy(2,4);
								writeln('Tracking ');
								gotoxy(2,5);
								writeln(' T 1 ',contador1,' =',pTrazo[contador1]^.especie);
								gotoxy(2,6);
								writeln(' T 2 ',contador2,' =',pTrazo[contador2]^.especie);		
								end;
								
//				// aqui la comparada del par para ver si se unen o no!

			adicionpuntos(Puntos_grupos,recorrer_2_especies (contador1, contador2));

			if kaos3 then writeln ('eliminando puntos redundantes');	

			Puntos_grupos:=nuevos_puntos(Puntos_grupos);

			if prekaos then begin
							gotoxy(2,10);
							writeln (' MST ??');
							gotoxy(2,11);
							writeln (pTrazo[contador1]^.especie,'  ',pTrazo[contador2]^.especie);
							gotoxy(2,12);
							writeln ('points',Puntos_grupos^.numero );
							writeln('answers ',numRespuestas); 
							end;
							
 			
		
		end; // if si lo hago o no

		end;// contador2

			if Puntos_grupos^.numero  > 1 then

				begin //inicia armador de trazo
				if prekaos then writeln ('Tengo MST con ',Puntos_grupos^.numero,' puntos.');
				especie_en_uso:=contador1;
				armar_el_trazo(especie_en_uso,Puntos_grupos);
				pTrazo[nspp]^.g_track:=true;
				pTrazo[contador1]^.g_track:=false;
				pTrazo[contador2]^.g_track:=false;
				pTrazo[nspp]^.especie:=pTrazo[contador1]^.especie+pTrazo[contador2]^.especie;

				end
				 else 
				begin
				if prekaos then writeln ('NOP, NO tengo MST');
				end; // finaliza  armador

		if Puntos_grupos <> nil then dispose(Puntos_grupos);

	end; // contador1

				

end; {comparar_por_grupos}



procedure comparar_por_grupos_t1 (contar0, contar1 : LongInt);

// este hace trazos por pares y los acumula como trazos separados

var

contador1,
contador2
			: LongInt;

tmpcong
			: real;

Puntos_grupos
		: tipopuntos;


begin {comparar_por_grupos}
 for contador1:= contar0 to contar1 do 
 	begin
		for contador2:= contar0 to contar1 do
		begin
			
			if (contador1 <> contador2)
			
			and  (pTrazo[contador1]^.especie<>pTrazo[contador2]^.especie)
			and	((pTrazo[contador1] <> nil) and (pTrazo[contador2] <> nil)) 
			and	((pTrazo[contador1]^.num_tramos > 0) and (pTrazo[contador2]^.num_tramos > 0))
			then
			begin
				if prekaos then 
								begin						
								clrscr;
								gotoxy(2,4);
								writeln('Tracking ');
								gotoxy(2,5);
								writeln(' T 1 ',contador1,' =',pTrazo[contador1]^.especie);
								gotoxy(2,6);
								writeln(' T 2 ',contador2,' =',pTrazo[contador2]^.especie);		
								end;
			new (Puntos_grupos);
			Puntos_grupos^.numero:=0;
			if kaos3 then writeln(' num answers ',numRespuestas);
	 	
								
//				// aqui la comparada del par para ver si se unen o no!
			adicionpuntos(Puntos_grupos,recorrer_2_especies (contador1, contador2));
			if kaos3 then writeln ('eliminating redundant points');	
			Puntos_grupos:=nuevos_puntos(Puntos_grupos);
			if prekaos then begin
							gotoxy(2,10);
							writeln ('MST ??');
							gotoxy(2,11);
							writeln (pTrazo[contador1]^.especie,'  ',pTrazo[contador2]^.especie);
							gotoxy(2,12);
							writeln ('points',Puntos_grupos^.numero );
							writeln('answers ',numRespuestas); 
							end;
							
 			
			if Puntos_grupos^.numero  > 1 then
				begin
				if prekaos then writeln ('MST =',Puntos_grupos^.numero-1,' segments');
				especie_en_uso:=contador1;
				armar_el_trazo(especie_en_uso,Puntos_grupos);
				pTrazo[nspp]^.g_track:=true;
				pTrazo[contador1]^.g_track:=false;
				pTrazo[contador2]^.g_track:=false;
				pTrazo[nspp]^.especie:=pTrazo[contador1]^.especie+pTrazo[contador2]^.especie;
				writeln(especie_en_uso,'####',pTrazo[nspp]^.g_track,'####',nspp,'--',pTrazo[nspp]^.especie);		 
				end
				 else 
				begin
				if prekaos then writeln ('NOP, NO tengo MST');
				end; // contruye armador

		end; // if si lo hago o no
		

		end;// contador2

	if Puntos_grupos <> nil then dispose(Puntos_grupos);
	end; // contador1

				

end; {comparar_por_grupos-t1}



procedure comparar_par (contar0, contar1 : LongInt);

var

contador1,
contador2
				: LongInt;

Puntos_par
		: tipopuntos;				




begin {comparar_por_pares}
new (Puntos_par);
Puntos_par^.numero:=0;
contador1:=contar0;
contador2:=contar1;

			Puntos_par:=recorrer_2_especies (contador1, contador2);
	
 			Puntos_par:=nuevos_puntos(Puntos_par);

 
 			if prekaos then begin
 							writeln('Tracking :',pTrazo[contador1]^.especie,' and  ',pTrazo[contador2]^.especie);
 							writeln('congruence. min a ',contador1,'  ',contador2,' = ',congruencia (contador1,contador2,'min'):2:2);writeln('congruencia min b ',contador2,'  ',contador1,' = ',congruencia (contador2,contador1,'min'):2:2);
 							writeln ('MST???');
 							end;
 			
 
 			 
		if Puntos_par^.numero  > 1 then
			begin
			if prekaos then writeln ('yep, MST');
			especie_en_uso:=nspp+1;
			 armar_el_trazo(contador1,Puntos_par);
			end
			else if prekaos then writeln ('NOP, NO MST');
			if Puntos_par <> nil then dispose (Puntos_par);


end; {comparar_por_pares}


procedure congruencia_grupo (contar0, contar1 : LongInt);

var

contador1,
contador2
			: LongInt;

begin {congruencia_grupo}
if prekaos then writeln('calculo de congruencia ');
writeln();
if prekaos then writeln('triangulo superior max, inferior min');
writeln();



for contador1:= contar0 to contar1 do 
	 begin
	 for contador2:= contar0 to contar1 do
 		if contador1 <> contador2 then 
 			begin
 			if kaos3 then write(Ptrazo[contador1]^.especie,'-',Ptrazo[contador2]^.especie,' ');
 			
 			if  ((Ptrazo[contador1]<> nil) and (Ptrazo[contador2]<> nil))	
 			and ((Ptrazo[contador1]^.num_tramos> 0) and (Ptrazo[contador2]^.num_tramos> 0))
 		 	then 
 				begin
 				salidausada:=true;
 		
 				if prekaos then begin 
 								write(' min=',
 								min(congruencia(contador1, contador2,'min'), congruencia(contador2, contador1,'min')):1:2);
 								writeln(' max=',
 								max(congruencia(contador1, contador2,'min'),congruencia (contador2, contador1, 'min')):1:2);
 								writeln();
 								end;
 								
 								
		 		end
 		 		else if prekaos then writeln('empty ');
		
			end;
		
		
	end;	


end; {congruencia_grupo}



//esto debe ser una funcion
procedure congruencia_par (contar0, contar1 : LongInt);

begin {congruencia_par}

 		if  ((Ptrazo[contar0]<> nil) and (Ptrazo[contar1]<> nil))
 		and ((Ptrazo[contar0]^.num_tramos> 0) and (Ptrazo[contar1]^.num_tramos> 0))
 		 then 
 		begin
 		if prekaos then writeln('min=',min(congruencia (contar0, contar1, 'min'), congruencia (contar1, contar0, 'min')):2:2,'  ');
 		if prekaos then writeln('max=',max(congruencia (contar0, contar1, 'min'), congruencia (contar1, contar0, 'min')):2:2)
 		 end;
 		 //else write('empty ');
		writeln();
		if kaos3 then sleep(2000);
		
end; {congruencia_par}



procedure entrar_datos_xy(datos:tipodatos);

// coordenadas
//
// ESTE ENTRA PUNTOS COMO DATOS
//

var
i
		: integer;
	

especie0,
especie1
		: string;
		
x,
y,
tempcorte
		: real;		

puntos_entrada
		: tipopuntos;


procedure entrar_un_punto;

begin {entrar_un_punto}


if datos='xyl' then readln (entrada,x,y,especie0);
if datos='lxy' then readln (entrada,especie0,x,y);

especie0:=orden(especie0);

if especie1 = especie0 then begin
	i:=i+1;
	new(puntos_entrada^.Coord[i]);
	puntos_entrada^.numero:=i;
	puntos_entrada^.Coord[i]^.x:=x;
	puntos_entrada^.Coord[i]^.y:=y;
		if i >2 then puntos_entrada:=nuevos_puntos(puntos_entrada);
	i:= puntos_entrada^.numero;
		if kaos3 then writeln (i,' ',x:2:2,' ',y:2:2,' ',especie0);
		if prekaos then 
				begin
				gotoxy(2,6);
				writeln (' reading points ',i,' ',especie0);
				end;


end
else begin
	
	nombre_sp_en_uso:=especie1;
	if puntos_entrada^.numero > 1 then
	begin
	armar_el_trazo(num_especies,puntos_entrada);
	especie1:=especie0;
	i:=1;
	if prekaos then writeln (num_especies,'  track sp ',nombre_sp_en_uso,' reading species ',especie0);
	
	dispose(puntos_entrada);
	new(puntos_entrada);
	puntos_entrada^.numero:=i;
	num_especies:=num_especies+1;
	if prekaos then writeln('num_especies:= ',num_especies);
	new(puntos_entrada^.Coord[i]);
	puntos_entrada^.Coord[i]^.x:=x;
	puntos_entrada^.Coord[i]^.y:=y;
	if kaos3 then writeln ('aqui hago la primera asignacion',i,' ',x:2:2,' ',y:2:2,' ',especie0);	
	end else begin
	if prekaos then writeln ('NO track for ',especie1);
	
	especie1:=especie0;
	
	if prekaos then writeln(' reading species ',especie0);
	i:=1;
	dispose(puntos_entrada);
	new(puntos_entrada);
	puntos_entrada^.numero:=i;
	if prekaos then writeln('num_especies:= ',num_especies);
	new(puntos_entrada^.Coord[i]);
	puntos_entrada^.Coord[i]^.x:=x;
	puntos_entrada^.Coord[i]^.y:=y;
	if kaos3 then writeln ('aqui hago la primera asignacion',i,' ',x:2:2,' ',y:2:2,' ',especie0);	
	end;

	while  not eof(entrada) do entrar_un_punto;
	end;
end; {entrar_un_punto}


begin {entrar_datos}

					tempcorte:=corte;
					corte:=corte_inicial;


if datos='xyl' then readln (entrada,x,y,especie1);
if datos='lxy' then readln (entrada,especie1,x,y);


especie1:=orden(especie1);

especie0:=especie1;
if prekaos then writeln(' Reading species ',especie0);

reset(entrada);
i:=0;

new(puntos_entrada);
num_especies:=num_especies+1;
if prekaos then writeln('num_especies:= ',num_especies);

while (especie0 = especie1) and not eof(entrada) do entrar_un_punto;

	nombre_sp_en_uso:=especie1;
	puntos_entrada:=nuevos_puntos(puntos_entrada);
	if puntos_entrada^.numero > 1 then armar_el_trazo(num_especies,puntos_entrada);
	if num_especies >nspp then num_especies:=nspp;
	if puntos_entrada <> nil  then dispose(puntos_entrada);
	
corte:=tempcorte;
end; {entrar_datos}


procedure soloverdad;
begin
		for itemp:=1 to nspp do
				begin
				if (pTrazo[itemp]^.num_tramos>0) and pTrazo[itemp]^.g_track  then trck2kml(itemp);
				clrscr;
				writeln('Tracks ',itemp,' to ',nspp,' written to kml output');
				end;
end;



// falta un funcion clean que elimine las cosas que se parecne al 100% con ods rutinas num_sp y nspp
