function thinkpositive (valor:real ):boolean;

begin {thinkpositive}

if trunc(valor*100000)=abs(trunc(valor*100000)) then thinkpositive:=true else thinkpositive:= false;

end; {thinkpositive}
		

function otraverdad (contar0, contar1, i,j:longint):boolean;

begin

if (((dos_tramos(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j], 'drm')) >= 0.00000) and
    (abs(dos_tramos(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j], 'ces')) < regla1))
    { 1era= Se comparan dos tramos si la distancia maxima es 1.0000 y hay un  punto de uno de ellos en el otro}
     
    and { "or" fue cambiado por "and" fecha de modoficacion mayo 20 2010}
    (((dos_tramos(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j], 'drm')) >= 0.00000) and
    (abs(dos_tramos(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j], 'drm')) < regla2))
    {2da= O si la distancia minima entre ellos esta entre 0.000 y 0.2500 y hay un  punto de uno de ellos en el otro}
    or
    (((line_conte(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j])) 
    or (line_conte(pTrazo[contar1]^.tramo[j], pTrazo[contar0]^.tramo[i]))) and
    (abs(dos_tramos(pTrazo[contar0]^.tramo[i], pTrazo[contar1]^.tramo[j], 'sus')) < regla3))
        {3ra= O si cualquiera de los tramos esta contenido dentro de otro (los dos puntos de un tramos estan dentro del otro)
    y la distancia minima sea menor a 1.2500}

then otraverdad:= TRUE else otraverdad:= FALSE;

end;    


function verdad (especie1, especie2, tramo1,tramo2:longint ):boolean;

begin

if    (thinkpositive(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'drm'))) and
    (trunc(100000*abs(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'ces'))) < trunc(100000*regla1))

    { 1era= Se comparan dos tramos si la distancia maxima es 1.0000 y hay un  punto de uno de ellos en el otro}
     
    and { "or" fue cambiado por "and" fecha de modoficacion mayo 20 2010}
      (thinkpositive(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'drm'))) and
    (trunc(100000*abs(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'drm'))) < trunc(100000*regla2))

    {2da= O si la distancia minima entre ellos esta entre 0.000 y 0.2500 y hay un  punto de uno de ellos en el otro}
     or
      ((line_conte(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2])) 
    or  (line_conte(pTrazo[especie2]^.tramo[tramo2], pTrazo[especie1]^.tramo[tramo1]))) 
    and
    (trunc(100000*abs(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'sus'))) < trunc(100000*regla3))

{3ra= O si cualquiera de los tramos esta contenido dentro de otro (los dos puntos de un tramos estan dentro del otro)
    y la distancia minima sea menor a 1.2500}

then verdad:= TRUE else verdad:= FALSE;

end;   



function oldverdad (especie1, especie2, tramo1,tramo2:longint ):boolean;

begin

if    (((dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'drm')) >= 0.00000) and
    (abs(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'ces')) < regla1))

    { 1era= Se comparan dos tramos si la distancia maxima es 1.0000 y hay un  punto de uno de ellos en el otro}
     
    and { "or" fue cambiado por "and" fecha de modoficacion mayo 20 2010}
      (((dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'drm')) >= 0.00000) and
    (abs(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'drm')) < regla2))

    {2da= O si la distancia minima entre ellos esta entre 0.000 y 0.2500 y hay un  punto de uno de ellos en el otro}
    or
      (((line_conte(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2])) 
    or  (line_conte(pTrazo[especie2]^.tramo[tramo2], pTrazo[especie1]^.tramo[tramo1]))) 
    and
    (abs(dos_tramos(pTrazo[especie1]^.tramo[tramo1], pTrazo[especie2]^.tramo[tramo2], 'sus')) < regla3))

{3ra= O si cualquiera de los tramos esta contenido dentro de otro (los dos puntos de un tramos estan dentro del otro)
    y la distancia minima sea menor a 1.2500}

then oldverdad:= TRUE else oldverdad:= FALSE;

end;   



function congruencia (tramo1, tramo2: longint; tipo:string):real;

var 
i,
j: 
			integer;

longT1,
congo0:
			real;

bobo0:
			boolean;
			

begin
congo0:= 0.0;
longT1:= 0.0;


if sip then writeln('**0 ','1 ','i ','j ');

for i:=1 to pTrazo[tramo1]^.num_tramos do
	begin
		longT1:= longT1+pTrazo[tramo1]^.tramo[i]^.size;
	bobo0:= TRUE;

	for j:=1 to pTrazo[tramo2]^.num_tramos do
			begin
			
			if (verdad(tramo1,tramo2, i, j))  then 
				begin
				//
				if sip then writeln(' t1=',tramo1,' t2=',tramo2,' i=', i,' j=', j);
				if bobo0 then
						begin
						congo0:=congo0+pTrazo[tramo1]^.tramo[i]^.size;
						bobo0:= FALSE;
						if sip then writeln(longT1:3:3,' congo0=',congo0:3:3);
						end;
				
				
				end;
			end;
	end;
	

//if tipo='min' then congruencia:=min(congo0/longT1,congo1/longT2);
//if tipo='max' then congruencia:=max(congo0/longT1,congo1/longT2);


if tipo='min' then congruencia:=congo0/longT1;
if tipo='max' then congruencia:=congo0/longT1;
	
	
if congruencia<0.0001 then congruencia:= 0.001;

end;




function nuevos_puntos(Puntos_viejos: tipopuntos): tipopuntos;

var
i,
j
				: integer;

Puntos_temp
				: tipopuntos;



begin {cercania + nuevos puntos}
//
// evalua si dos puntos son iguales usando como regla el valor 
// 1. de corte que se lee de param.trck
// 2. la prom media (n-1) si se usa p como tercer parametro de entrada
//
new (Puntos_temp);
if kaos2 then gotoxy(2,10);
if kaos2 then writeln('en cercania, puntos inciales ',Puntos_viejos^.numero);

(*
	if ((tress='p') OR (tress='P'))  then 
	      			begin
	      				propincuidad;
	      				corte:=prop_media;
	      			end
	             else
	      			begin
	      				Assign (param,'param.trck');
	      				Reset  (param);
	      				readln (param, corte);
	      end;
*)	      
	for i:= 1   to Puntos_viejos^.numero do
	for j:= i+1 to Puntos_viejos^.numero do

	begin
if kaos3 then writeln ('Checking for common segments ',i,' ',j);

	if  (Puntos_viejos^.coord[i]<> nil) and (Puntos_viejos^.coord[j]<> nil) and iguales(Puntos_viejos^.coord[i],Puntos_viejos^.coord[j], corte) then
		begin
		Puntos_viejos^.coord[i]:=mediaarit (Puntos_viejos^.coord[i],  Puntos_viejos^.coord[j]);
		Puntos_viejos^.coord[j]^.x := -999.99;
		Puntos_viejos^.coord[j]^.y := -999.99;
		end;
	end;

{finaliza cercania}

{inicia nuevo vector de coordenadas sin repetidos}

if kaos3 then 
	begin
	gotoxy(2,10);
	writeln('new points');
	end;

j:=0;
	for i:= 1 to Puntos_viejos^.numero do
	begin
	//writeln (salida,i,' xP: ',Puntos_viejos[i]^.x:2:2,' yF: ',Puntos_viejos[i]^.y:2:2);
	if (Puntos_viejos^.coord[i]<> nil) and (Puntos_viejos^.coord[j]<> nil) and (Puntos_viejos^.coord[i]^.x> -999.99) and  ((Puntos_viejos^.coord[i]^.y> -999.99)) then
	// se usa -999.99 como dummy para indicar que el punto ya se uso, se podria eliminar el registro
	// pero esta solucion es un poco mas eficiente
	begin
	j:=j+1;
	new (Puntos_temp^.coord[j]);
	Puntos_temp^.coord[j]:=Puntos_viejos^.coord[i];
	end;
	end;

	Puntos_temp^.numero:=j;
	if kaos3 then gotoxy(2,10);
	if kaos3 then writeln('Viejos puntos ',Puntos_viejos^.numero);
	if kaos3 then gotoxy(3,10);
	if kaos3 then writeln('Nuevos puntos ',Puntos_temp^.numero);	
	if kaos3 then gotoxy(2,10);
	if kaos3 then writeln('nuevos Viejos puntos ',Puntos_temp^.numero);


nuevos_puntos:=Puntos_temp;


end; {cercania + nuevos puntos}

 
 function WhatIsChar( c:char ):string;
 var
   s : string;
 begin
   s := '';
   case c of
     '0' .. '9' : s := 'digit (0-9)';
     'a' .. 'z' : s := 'small letter (a-z)';
     'A' .. 'Z' : s := 'big letter (A-Z)';
     '+' , '-'  : s := 'sign (+ or -)';
   end;
   WhatIsChar := s;
 end;
 
 Function orden (S: String): String; { converts a string to upper case }

Var 
  P: Byte;
  m: integer;
Begin
    For P := 1 To Length (S) Do
      Begin
        m := pos (' ',s);
        delete (s,m,1);
        m := pos (#13,s);
        delete (s,m,1);
        m := pos (#10,s);
        delete (s,m,1);
        m := pos ('=',s);
        delete (s,m,1);
        m := pos (';',s);
        delete (s,m,1);
        m := pos (#9,s);
        delete (s,m,1);
        m := pos (#34,s);
        delete (s,m,1);
  
      End;
  orden := lowercase(S);
End; {uppercase}



