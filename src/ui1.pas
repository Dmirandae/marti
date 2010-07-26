
procedure ventana;

begin
window(a1,a2,a3,a4);
clrscr;
end;


procedure marco;

begin {marco}

//
window(1,1,80,25);
//window(1,1,90,38);  
//window(1,1,85,38);  

clrscr;


textbackground(black);
 TextColor(darkgray);
 
  //acto := readkey;
  
  	ClrScr;
  	GotoXY(2,1);
  	//writeln;
  	writeln(' _____________________________________________________________________________');
  	writeln('|                                                                             |');
  	writeln('|                      M A R T I       T R A C K S                            |');
  	writeln('|_____________________________________________________________________________|');
  
  	GotoXY(56,6);
  	writeln('TRACK =                 ');
  	GotoXY(56,7);
  	writeln('[a]ll [g]roup [p]air    ');
  	GotoXY(56,8);
  	writeln('segment[t]rack   all[s] ');	
  	GotoXY(56,9);
  	writeln('[j]oin two tracks       ');
  	GotoXY(56,10);
  	writeln('join a gro[u]p of tracks');
  	GotoXY(56,11);
  	writeln('[l]ist tracks           ');
  	GotoXY(56,12);
  	writeln('[w]rite to kml  -all-   ');
  	GotoXY(56,13);
  	writeln('writ[e] to kml -results- ');
  	GotoXY(56,15);
  	writeln('Congruence =             ');
  	GotoXY(56,16);
  	writeln('gr[o]up    co[n]gru pair ');
  	GotoXY(56,18);
  	writeln('Decision rules =         ');
  	GotoXY(56,19);
  	writeln('[c]ut   [r]ules          ');
  	GotoXY(56,20);
  	writeln('[m]inimal congruence     ');
  	
  	GotoXY(56,22);
  	writeln('* q=close+quit           ');
  	GotoXY(56,23);
  	writeln('* z=delete prev. analyses');
  	
  	
	//TextColor (blue);
  	//textbackground(white);
  	GotoXY(4,20);
  	writeln('Original tracks= ',num_especies,'   Total tracks= ',nspp);
  	GotoXY(4,21);
  	writeln('Repeated= ',nrep,'  New tracks= ',nspp-num_especies);
  	
  	GotoXY(4,22);
  	  write('Cut=',corte:2:2);
  	  write('/ lmax=',regla1:2:2);
  	  write('/ lmin=',regla2:2:2);
  	writeln('/ lmax-line=',regla3:2:2);
  	GotoXY(4,23);
  	 writeln('printing kml?=',printkml,' / min congruence= ',congruencia_minima:2:2);
 	GotoXY(3,24);
  	writeln(version,'/',revision,' \ Input:',alpha,' \ Output:',beta);	
 	GotoXY(3,25);
  	//
  	writeln('___________________________________________________');
 
 	GotoXY(3,18);
  	//
  	writeln('___________________________________________________');
 
end; {marco}


procedure uinterface;

begin {UI}

 while lowercase(acto) <> 'q' do
  begin

clrscr;   
 
//
marco;
ventana;

 
	GotoXY(4,15);
	writeln('Press a key to perfom an analysis');
	GotoXY(16,18);
	acto := readkey;
	//textbackground(black);
	//TextColor (darkgray);
	if lowercase(acto) = 'l' then 
			begin
			//ventana;
			//clrscr;
			window(1,1,60,80);
			
			for itemp:=1 to nspp do
				begin
				if (pTrazo[itemp]^.num_tramos>0) then writeln(itemp,'. ',pTrazo[itemp]^.especie,' segm=',pTrazo[itemp]^.num_tramos,' l=',pTrazo[itemp]^.size:3:0,' general?=',pTrazo[itemp]^.g_track);
				end;
				sleep(5000);
				//if not hicelistado then 
				enlistar_datos('listado.txt');
				////sleep(1500);
			end;

 

	if lowercase(acto) = 'z' then nspp := num_especies; 


	if lowercase(acto) = 'v' then 
			begin
			clrscr;
			//for itemp:=1 to nspp do
				begin
				writeln('no implentado todavia');
				end;
				//sleep(500);
			end;
			

			

	if lowercase(acto) = 'w' then 
			begin
			clrscr;
			for itemp:=1 to nspp do
				begin
				if (pTrazo[itemp]^.num_tramos>0) then trck2kml(itemp);
				clrscr;
				writeln('Tracks 1 to ',nspp,' written to kml output');
				end;
			end;

	if (lowercase(acto) = 'e') and  (num_especies <> nspp) then 
			begin
			clrscr;
			for itemp:=1 to nspp do
				begin
				if (pTrazo[itemp]^.num_tramos>0) and pTrazo[itemp]^.g_track  then begin 
																					trck2kml(itemp);
																					writeln('Track ',itemp,' written to kml output');
																					sleep(100);
																					end;
				end;
			end;
			

	
		if lowercase(acto) = 'm' then 
			begin			
			GotoXY(5,11);
			writeln(' min congruence');
			GotoXY(25,11);
			readln(congruencia_minima);
			end;
	
	
		if lowercase(acto) = 'k' then 
			begin
			GotoXY(5,11);
			writeln(' [+] to print or [-] to not print kml');
			GotoXY(25,11);
			acto := readkey;
			if lowercase(acto) = '+' then printkml:=true;
			if lowercase(acto) = '-' then printkml:=false;
			end;
	
	
	if lowercase(acto) = 'a' then 
			begin
			comparar_por_grupos(1,num_especies);
							clrscr;
				writeln('Tracks from 1  to ',num_especies,' compared');				
			end;


	if lowercase(acto) = 'g' then
		begin 
		GotoXY(5,11);
		writeln('Track a GROUP: first / last');
		GotoXY(6,12);
		readln(num1,num2);
		if num2 > nspp then num2:= nspp;
		comparar_por_grupos(num1,num2);
						clrscr;
				writeln('Tracks from ',num1,' to ',num2,' compared');
		end;

		
		if lowercase(acto) = 'j' then
		begin 
		GotoXY(5,11);
		writeln('Join pair: T1 / T2');
		GotoXY(25,11);
		readln(num1,num2);
		reduce2tracks(num1,num2);
						clrscr;
				writeln('Tracks ',num1,' and ',num2,' merged');
		end;

		if lowercase(acto) = 'zz' then
		begin 
		{
		cuando une en la secuencia de entrada por 
		lo que no une de acuerdo al par mas similar
		una opcion es solo unir inicialmente
		con un valor muy alto
		quizas 0.95
		y despues gradualmente aumentar el corte
		
		o
		
		hacer una matriz de distancia entre tracks 
		por congruencia y usar un tipo prim
		para agrupar
		
		esto ultimo es lo mas eficiente n terminos de
		agrupamiento, pero tambien implica tiempo
		de computo
		
		}
		GotoXY(5,11);
		writeln('Join from: T1 to: T2');
		GotoXY(10,12);
		readln(num1,num2);
		//if (congruencia_minima>1.0000001) then congruencia_minima:=congruencia_minima/100; 
		if num2 > nspp then num2:= nspp;
		for itemp:=num1 to num2 do
			begin
			for itemp1:=itemp+1 to num2 do
				if  ((Ptrazo[itemp1]<> nil) and (Ptrazo[itemp]<> nil))
				and  ((Ptrazo[itemp]^.num_tramos> 0) and (Ptrazo[itemp1]^.num_tramos> 0))
				then begin
				if 
				 max (congruencia (itemp, itemp1, 'min'),congruencia (itemp1, itemp, 'min'))				 				 
				  > congruencia_minima
				then begin						
						if kaos then writeln('reducing ',itemp, ' y   ',itemp1);
						reduce2tracks(itemp, itemp1);
						end;
				end;
			end;
					if prekaos then 
					begin
					clrscr;
					writeln('Tracks from ',num1,' to ',num2,' merged if cong>',congruencia_minima:2:3);
					end;
		end;

		if lowercase(acto) = 'u' then
		begin 
		
		GotoXY(5,11);
		writeln('Join from: T1 to: T2');
		GotoXY(10,12);
		readln(num1,num2);
		if num2 > nspp then num2:= nspp;
		jointracks(num1,num2);
		end;


		
	if lowercase(acto) = 'o' then
		begin 
		GotoXY(5,11);
		writeln('Calculate congruence GROUP: first / last');
		GotoXY(25,13);
		readln(num1,num2);
		if num2 > nspp then num2:= nspp;
		ventana;
		congruencia_grupo(num1,num2);
		//sleep(500);
		end;

		
	if lowercase(acto) = 'p' then
		begin 
		GotoXY(5,11);
		writeln(' Track a pair:  one / two ');
		GotoXY(25,13);
		readln(num1,num2);
		comparar_par(num1,num2);	
		//sleep(500);
		end;

	if lowercase(acto) = 't' then
		begin 
		GotoXY(5,11);
		writeln(' Track T1 against all : out tracks ');
		GotoXY(25,13);
		hacertrack:=true;
		readln(num1);
		track_uno(num1);	
		//sleep(500);
		end;


	if lowercase(acto) = 'y' then
		begin 
		GotoXY(5,11);
		writeln(' Track T1 against all : out points ');
		GotoXY(25,13);
		hacertrack:=false;
		oldcorte:=corte;
		corte:=corte*0.75;
		readln(num1);
		track_uno(num1);	
		corte:=oldcorte;
		//sleep(500);
		end;


	if lowercase(acto) = 's' then
		begin 
		GotoXY(5,11);
		writeln(' Track all T1 against all T2 : out Tracks ');
		hacertrack:=true;
		GotoXY(25,13);
		//sleep(500);
		for num1:=1 to num_especies do track_uno(num1);	
		end;


	if lowercase(acto) = 'h' then
		begin 
		GotoXY(5,11);
		writeln(' Track all T1 against all T2 : out Points ');
		hacertrack:=false;
		GotoXY(25,13);	
		//sleep(500);
		oldcorte:=corte;
		corte:=corte*0.75;		
		for num1:=1 to num_especies do track_uno(num1);	
		corte:=oldcorte;
		end;



		
	if lowercase(acto) = 'n' then
		begin 
		GotoXY(5,11);
		writeln('congruence pair  one / two');
		GotoXY(25,13);
		readln(num1,num2);
		congruencia_par(num1,num2);
		sleep(5000);	
		end;

	if lowercase(acto) = 'c' then
		begin 
		GotoXY(5,11);
		writeln('cut value');
		GotoXY(25,13);
		readln(corte);
		end;
		
	if lowercase(acto) = 'r' then
		begin 
		GotoXY(5,11);
		writeln('enter lmax lmin lmax-line');
		GotoXY(25,13);
		readln(regla1,regla2,regla3);
		end;
end;
		ClrScr;
end; {UI}
