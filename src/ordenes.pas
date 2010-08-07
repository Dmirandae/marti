



procedure entrar_comandos;

var
i,
j,
min,max
		: longint;
	
orden0:
               char;
               
orden1
		: string;
		

				
		
procedure lectura_ordenes;
begin
ordenok:=false;
orden1:='';
repeat
read(ordenes,orden0);
if orden0='#' then  begin readln(ordenes); lectura_ordenes; end;
orden1:=orden1+orden0; 
until  (orden0=' ') or (orden0=';') or (eof(ordenes)) or (eoln(ordenes));
orden1:=orden(orden1);
end;


begin {entrar_comandos}

				prekaos:=true;
				clrscr;
   				max:=num_especies;
   				min:=1;
   				kmlgen:=true;

writeln ('Reading instructions...');
i:=0;
while (not eof(ordenes)) do 
begin
lectura_ordenes;
orden1:=orden(orden1);
i:=i+1;
clrscr;
if (not eof(ordenes)) then writeln ('Reading line ',i,' = ',orden1);


 if orden1 =  'printkml' then
   				begin
   				ordenok:=true;
   				printkml:=true;
				end; 

 if orden1 =  'noprintkml' then
   				begin
   				ordenok:=true;
   				printkml:=false;
				end; 


 if orden1 =  'croizat0' then
   				begin
   				ordenok:=true;
				printkml:=false;
				salidausada:=true;
   				jointracks(1,num_especies);
				enlistar_datos('prelista0.txt');
   				comparar_por_grupos(1,num_especies);
				enlistar_datos('prelista1.txt');
				if nspp > num_especies then jointracks(num_especies+1,nspp);
				enlistar_datos('postlista.txt');	
				soloverdad;
   				end;

 if orden1 =  'croizat1' then
   				begin
   				ordenok:=true;
   				printkml:=false;
   				comparar_por_grupos(1,num_especies);
				salidausada:=true;
				oldcorte:=corte;				
				if nspp > num_especies then jointracks(num_especies+1,nspp);
				corte:=oldcorte;		
				soloverdad;  
   				end;


 if orden1 =  'kmlgen' then
   				begin
   				ordenok:=true;
   				kmlgen:=true;
   				end;


 if orden1 =  'kmlall' then
   				begin
   				ordenok:=true;
   				kmlgen:=false;
   				kmlall:=true;
   				end;



if (orden1 =  'dataxyl') or (orden1 =  'datalxy')   then
   				begin
   				ordenok:=true;
   				if orden1 =  'dataxyl' then tipo:='xyl';
   				if orden1 =  'datalxy' then tipo:='lxy';
   				end;

if orden1 =  'set' then
   				begin
   				if kaos3 then begin
   				writeln('old values ---');
   				writeln(corte:3:2);
   				writeln(regla1:3:2);
   				writeln(regla2:3:2);
   				writeln(regla3:3:2);
				writeln(congruencia_minima:3:2);
   				end;
   				ordenok:=true;
   				lectura_ordenes;
   				ordenok:=true;
   				orden1:=orden(orden1);
   				readln(ordenes,rtemp);
   				writeln('set ---',orden1,' to',rtemp);
   				if orden1 =  'cv' then corte:=rtemp;
   				if orden1 =  'lmax' then regla1:=rtemp;
   				if orden1 =  'lmin' then regla2:=rtemp;
   				if orden1 =  'maxline' then regla3:=rtemp;
   				if orden1 =  'ci' then congruencia_minima:=rtemp;
   				if kaos3 then begin   				
   				writeln('new values ',orden1);
   				writeln(corte:3:2);
   				writeln(regla1:3:2);
   				writeln(regla2:3:2);
   				writeln(regla3:3:2);
   				writeln(congruencia_minima:3:2);
								end;
   				end;

if orden1 =  'quiet' then
   				begin
   				ordenok:=true;
   				sip:=false;
   				prekaos:=false;
   				kaos:=false;
   				kaos2:=false;
   				kaos3:=false;
   				end;


if (orden1 =  'quiet1') or (orden1 = 'noquiet') then
   				begin
   				ordenok:=true;
   				sip:=false;
   				prekaos:=true;
   				kaos:=false;
   				kaos2:=false;
   				kaos3:=false;
   				end;


if orden1 =  'noquiet3' then
   				begin
   				ordenok:=true;
   				sip:=true;
   				prekaos:=true;
   				kaos:=true;
   				kaos2:=true;
   				kaos3:=true;
   				end;



if orden1 =  'group' then
   				begin
   				ordenok:=true;
   				readln(ordenes,min,max);
   				if max < min then 
   							begin
   							itemp:=max;
   							max:=min;
   							min:=itemp;
   							end;   				 
   				end;


if orden1 =  'trackgroup' then
   				begin
   				ordenok:=true;
				printkml:=true;
				salidausada:=true;
  				comparar_por_grupos(min,max);
   				printkml:=false;
   				end;


if orden1 =  'tracksp' then
   				begin
   				ordenok:=true;
				printkml:=true;
				salidausada:=true;
  				comparar_por_grupos(1,num_especies);
   				printkml:=false;
   				end;
 
  
if (orden1 =  'tracknew') and (num_especies < nspp) then
   				begin
   				ordenok:=true;
				printkml:=true;
				salidausada:=true;
  				comparar_por_grupos(num_especies,nspp);
   				printkml:=false;
   				end;
 
 
if (orden1 =  'trackjoinnew') then
   				begin
   				ordenok:=true;
   				printkml:=true;
				salidausada:=true;
				itemp:=nspp;
  				comparar_por_grupos_new(1,nspp);
  				if  nspp > itemp then jointracks(itemp+1,nspp);
   				printkml:=false;
   				end;
 
if orden1 =  'joingroup' then
   				begin
   				ordenok:=true;
  				jointracks(min,max);
   				end;

if orden1 =  'reducegroup' then
   				begin
   				ordenok:=true;
   				for itemp := min+1 to max do 
  				reduce2tracks(min,itemp);
   				end;

 
if orden1 =  'jointrackgroup' then
   				begin
   				ordenok:=true;
				printkml:=true;
				salidausada:=true;
				jointracks(min,max);
 				comparar_por_grupos(min,max);
   				printkml:=false;
   				end;



 if orden1 =  'nodes' then
   				begin
   				ordenok:=true;
   				printkml:=false;
   				nodes:=0;
   				for itemp:= 1 to nspp do
   					begin
   					prekaos:=true;   					
   					if (pTrazo[itemp] <> nil )
   					and (pTrazo[itemp]^.num_tramos > 0)
   					and (pTrazo[itemp]^.g_track)
   					then
   					begin
   					buscarnodos(itemp,1,nspp);
   					end;
   					end;
   				salidausada:=true;
   				end;





 if orden1 =  'endemism' then
   				begin
   				ordenok:=true;
   				printkml:=false;
   				jointracks(1,num_especies); 
   				enlistar_datos('listado-end.txt');  				
   				for itemp:= 1  to num_especies do
   					begin
   					prekaos:=true;   					
   					if (pTrazo[itemp] <> nil )
   					and (pTrazo[itemp]^.num_tramos > 0)
   					then buscarendem(itemp,1,num_especies);
   					end;
   				salidausada:=true;
   				end;
 
 
 if orden1 =  'retrack0' then
   				begin
   				ordenok:=true;
   				printkml:=false;
   				prekaos:=true;   					
   				jointracks(1,num_especies);   				
   				comparar_por_grupos(1,num_especies);
				printkml:=true;	
				jointracks(num_especies+1,nspp);
				itemp2:=nspp;
   				comparar_por_grupos(num_especies+1,nspp);
   				enlistar_datos('retrack.txt');
   				for itemp3:= itemp2+1 to nspp do
   					begin
   					if (pTrazo[itemp] <> nil )
   					and (pTrazo[itemp]^.num_tramos > 0)
   					then
   					buscarnodos(itemp,num_especies+1,nspp);
   					end;
   				salidausada:=true;
   				end;

 
 if orden1 =  'retrack1' then
   				begin
   				ordenok:=true;
   				printkml:=false;
   				prekaos:=true;   					
   				jointracks(1,num_especies);   				
   				comparar_por_grupos(1,num_especies);
				printkml:=true;	
				jointracks(num_especies+1,nspp);
				itemp2:=nspp;
   				comparar_por_grupos(num_especies+1,nspp);
   				jointracks(itemp2+1,nspp);
   				enlistar_datos('retrack1.txt');
   				for itemp3:= itemp2+1 to nspp do
   					begin
   					if (pTrazo[itemp] <> nil )
   					and (pTrazo[itemp]^.num_tramos > 0)
   					then
   					buscarnodos(itemp,itemp2+1,nspp);
   					end;
   				salidausada:=true;
   				end;

 
sleep(500);
if (not ordenok) and (not eof(ordenes)) then begin 
	writeln('Cannot understand ', orden1);
	sleep(5000);
	end;

 end;
 
end; {entrar_comandos}





procedure pre_set;

var
i,
j,
min,max
		: longint;
	
orden0:
               char;
               
orden1
		: string;

setcv,
setlmax,
setlmin,
setmaxl,
setci
		: boolean;

				
		
procedure lectura_ordenes;
begin
ordenok:=false;
orden1:='';
repeat
read(ordenes,orden0);
if orden0='#' then  begin readln(ordenes); lectura_ordenes; end;
orden1:=orden1+orden0; 
until  (orden0=' ') or (orden0=';') or (eof(ordenes)) or (eoln(ordenes));
orden1:=orden(orden1);
end;


begin {pre_set}

				prekaos:=true;
				clrscr;
   				max:=num_especies;
   				min:=1;
   				kmlgen:=true;

writeln ('Reading presetting...');
i:=0;
while (not eof(ordenes)) do 
begin
lectura_ordenes;
orden1:=orden(orden1);
i:=i+1;
clrscr;
if (not eof(ordenes)) then writeln ('Reading line ',i,' = ',orden1);


 if orden1 =  'printkml' then
   				begin
   				ordenok:=true;
   				printkml:=true;
				end; 

 if orden1 =  'noprintkml' then
   				begin
   				ordenok:=true;
   				printkml:=false;
				end; 


 if orden1 =  'kmlgen' then
   				begin
   				ordenok:=true;
   				kmlgen:=true;
   				end;


 if orden1 =  'kmlall' then
   				begin
   				ordenok:=true;
   				kmlgen:=false;
   				kmlall:=true;
   				end;


if (orden1 =  'dataxyl') or (orden1 =  'datalxy')   then
   				begin
   				ordenok:=true;
   				if orden1 =  'dataxyl' then tipo:='xyl';
   				if orden1 =  'datalxy' then tipo:='lxy';
   				end;

if orden1 =  'set' then
   				begin
   				if kaos3 then begin
   				writeln('old values ---');
   				writeln(corte:3:2);
   				writeln(regla1:3:2);
   				writeln(regla2:3:2);
   				writeln(regla3:3:2);
				writeln(congruencia_minima:3:2);
   				end;
   				ordenok:=true;
   				lectura_ordenes;
   				ordenok:=true;
   				orden1:=orden(orden1);
   				readln(ordenes,rtemp);
   				writeln('set ---',orden1,' to',rtemp);
   				if (orden1 =  'cv')       and not setcv    then 
														begin 
														corte:=rtemp;
														setcv:=true;
														end;
   				if (orden1 =  'lmax')     and not setlmax  then 
														begin 
														regla1:=rtemp;
														setlmax:=true;
														end;
   				if (orden1 =  'lmin')     and not setlmin  then 
														begin 
														regla2:=rtemp;
														setlmin:=true;
														end;
   				if (orden1 =  'maxline')  and not setmaxl  then 
														begin 
														regla3:=rtemp;
														setmaxl:=true;
														end;
   				if (orden1 =  'ci')       and not setci    then 
														begin 
														congruencia_minima:=rtemp;
														setci:=true;
														end;
   				if kaos3 then begin   				
   				writeln('new values ',orden1);
   				writeln(corte:3:2);
   				writeln(regla1:3:2);
   				writeln(regla2:3:2);
   				writeln(regla3:3:2);
   				writeln(congruencia_minima:3:2);
								end;
   				end;

if orden1 =  'quiet' then
   				begin
   				ordenok:=true;
   				sip:=false;
   				prekaos:=false;
   				kaos:=false;
   				kaos2:=false;
   				kaos3:=false;
   				end;


if (orden1 =  'quiet1') or (orden1 = 'noquiet') then
   				begin
   				ordenok:=true;
   				sip:=false;
   				prekaos:=true;
   				kaos:=false;
   				kaos2:=false;
   				kaos3:=false;
   				end;


if orden1 =  'noquiet3' then
   				begin
   				ordenok:=true;
   				sip:=true;
   				prekaos:=true;
   				kaos:=true;
   				kaos2:=true;
   				kaos3:=true;
   				end;

 end;
 
end; {pre_set}
