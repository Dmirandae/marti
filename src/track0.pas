
(*
funciones
 *)

Function pto_linea (Tsegmento: tipotramo; Tcoor: TCoord): real;
{entrada un tramo, y un punto, reporta una distancia negativa si el punto no esta dentro del tramo, positivo dentro tramo}
(*31 enero 2009*)
var
px,
py,
u,
com1,
com2,
dplinea1,
dplinea2:  real;

begin

com2 := (sqr(Tsegmento^.Ncoord^.x-Tsegmento^.Scoord^.x)+(sqr(Tsegmento^.Ncoord^.y-Tsegmento^.Scoord^.y)));
com1 := (((Tcoor^.x-Tsegmento^.Scoord^.x)*(Tsegmento^.Ncoord^.x-Tsegmento^.Scoord^.x))+((Tcoor^.y-Tsegmento^.Scoord^.y)*(Tsegmento^.Ncoord^.y-Tsegmento^.Scoord^.y)));
u:= com1/com2;

if ((u < EPS) or (u > 1)) then
	begin
{operacion fuera de tramo}
	px:= (sqrt((sqr(Tcoor^.x-Tsegmento^.Ncoord^.x))+(sqr(Tcoor^.y-Tsegmento^.Ncoord^.y))));
	py:= (sqrt((sqr(Tcoor^.x-Tsegmento^.Scoord^.x))+(sqr(Tcoor^.y-Tsegmento^.Scoord^.y))));
	dplinea1:= min (px, py);
	pto_linea:= dplinea1*(-1.0);
	end
else

	begin
{dentro del tramo}
	px := Tsegmento^.Scoord^.x + u * (Tsegmento^.Ncoord^.x-Tsegmento^.Scoord^.x);
	py := Tsegmento^.Scoord^.y + u * (Tsegmento^.Ncoord^.y-Tsegmento^.Scoord^.y);
	dplinea2 := (sqrt((sqr(Tcoor^.x-px))+(sqr(Tcoor^.y-py))));
	pto_linea:= dplinea2;
	end;
end;


function line_conte (Ttramo1, Ttramo2: tipotramo): boolean;
(* Esta funcion reporta el valor de 1, si alguno de los tramos
esta incluido en otro, es decir si los dos puntos del tramos mas
pequehno se encuentran en el rango del tramo mas grande, al igual
que si los dos tramos tienen el mismo tamahno deberia reporta
r el numero 1 ya que los cuatro puntos estan dentro de la linea *)

var
tmp_a,
tmp_b,
tmp_c,
tmp_d: real;

begin
	tmp_a:= (pto_linea(Ttramo1, Ttramo2^.Scoord)); //writeln (salida,'a=',tmp_a:2:5);

	tmp_b:= (pto_linea(Ttramo1, Ttramo2^.Ncoord)); //writeln (salida,'b=',tmp_b:2:5);

	tmp_c:= (pto_linea(Ttramo2, Ttramo1^.Scoord)); //writeln (salida,'c=',tmp_c:2:5);

	tmp_d:= (pto_linea(Ttramo2, Ttramo1^.Ncoord)); //writeln (salida,'d=',tmp_d:2:5);

if (((Ttramo1^.size) >= (Ttramo2^.size)) and ((Tmp_a >= 0.0 )and (Tmp_b >= 0.0))) or
   (((Ttramo2^.size) >= (Ttramo1^.size)) and ((Tmp_c  >= 0.0 )and (Tmp_d >= 0.0))) then
 // Si el tramo 1 es mas grande que el 2, y los puntos de 2 estan adentro del rango de la linea 1.entonces el tramo2 esta contenido en el tramo 1

   begin
   line_conte:= TRUE; //writeln (salida,'linea_contenida= ',line_conte);
   end

   else

   begin
   line_conte:= FALSE; //writeln (salida,'linea_contenida=', line_conte);
   end;

end;



function dos_tramos(Ttramo1, Ttramo2: tipotramo ; operacion :string):real;

var
tmp_a,
tmp_b,
tmp_c,
tmp_d,
tmp_a1,
tmp_b1,
tmp_c1,
tmp_d1,
tmax,
tmaxa, tmaxb, tmaxc, tmaxd,
tmin,
tmina,tminb, tminc, tmind,
tmax_dentro: real;
	
begin
	tmp_a:= (pto_linea(Ttramo1, Ttramo2^.Scoord)); //writeln (salida,'a=',tmp_a:2:5);
	
	tmp_b:= (pto_linea(Ttramo1, Ttramo2^.Ncoord)); //writeln (salida,'b=',tmp_b:2:5);

	tmp_c:= (pto_linea(Ttramo2, Ttramo1^.Scoord)); //writeln (salida,'c=',tmp_c:2:5);

	tmp_d:= (pto_linea(Ttramo2, Ttramo1^.Ncoord));  //writeln (salida,'d=',tmp_d:2:5);


tmax_dentro:= max(max(max(tmp_a, tmp_b),tmp_c),tmp_d);

   if tmp_a < 0.0 then tmp_a1 := abs(tmp_a) else tmp_a1 := tmp_a; // writeln (salida,'a*=',tmp_a);
   if tmp_b < 0.0 then tmp_b1 := abs(tmp_b) else tmp_b1 := tmp_b; // writeln (salida,'b*=',tmp_b);
   if tmp_c < 0.0 then tmp_c1 := abs(tmp_c) else tmp_c1 := tmp_c; // writeln (salida,'c*=',tmp_c);
   if tmp_d < 0.0 then tmp_d1 := abs(tmp_d) else tmp_d1 := tmp_d; // writeln (salida,'d*=',tmp_d);


tmax:= max(max(max(tmp_a1, tmp_b1),tmp_c1),tmp_d1);

if (tmp_a = tmax * (-1.0)) and (tmp_a < 0.0) then tmaxa:= (tmax* (-1.0));
if (tmp_b = tmax * (-1.0)) and (tmp_b < 0.0) then tmaxb:= (tmax* (-1.0));
if (tmp_c = tmax * (-1.0)) and (tmp_c < 0.0) then tmaxc:= (tmax* (-1.0));
if (tmp_d = tmax * (-1.0)) and (tmp_d < 0.0) then tmaxd:= (tmax* (-1.0));


if ((tmaxa < 0.0) or (tmaxb < 0.0) or (tmaxc < 0.0) or (tmaxd < 0.0)) then tmax:= tmax* (-1.0);


tmin:= min(min(min(tmp_a1, tmp_b1),tmp_c1),tmp_d1);

if (tmp_a = tmin * (-1.0)) and (tmp_a < 0.0) then tmina:= (tmin* (-1.0));
if (tmp_b = tmin * (-1.0)) and (tmp_b < 0.0) then tminb:= (tmin* (-1.0));
if (tmp_c = tmin * (-1.0)) and (tmp_c < 0.0) then tminc:= (tmin* (-1.0));
if (tmp_d = tmin * (-1.0)) and (tmp_d < 0.0) then tmind:= (tmin* (-1.0));

if ((tmina < 0.0) or (tminb < 0.0) or (tminc < 0.0) or (tmind < 0.0)) then tmin:= tmin* (-1.0);

//writeln (salida,'e*=',tmin);
if operacion = 'drm' then dos_tramos := tmin;
if operacion = 'ces' then dos_tramos := tmax;
if operacion = 'med' then dos_tramos := (abs(tmin)+ abs(tmax))/2;
if operacion = 'sus' then dos_tramos := tmax_dentro;
//writeln (salida,'d*=',tmin);

//writeln (salida,'dis_max=',tmax);
//writeln (salida,'dis_min=',tmin);
//writeln (salida,'dis_min=',tmin);
end;


Function dist_x (Tcoor1, Tcoor2: TCoord): Real; { distancia por puntos}

begin {distancia}

dist_x := abs(Tcoor1^.x - Tcoor2^.x);

end; {distancia}


Function dist_x (x: extended; Tcoor1: TCoord): Real; { distancia por puntos}

begin {distancia}

dist_x := abs(x - Tcoor1^.x );

end; {distancia}




Function dist_y (Tcoor1, Tcoor2: TCoord): Real; { distancia por puntos}

begin {distancia}

dist_y := abs(Tcoor1^.y - Tcoor2^.y);

end; {distancia}


Function dist_y (y: extended; Tcoor1: TCoord): Real; { distancia por puntos}

begin {distancia}

dist_y := abs(y - Tcoor1^.y);

end; {distancia}




{overload estas dos para trazos completos y no solo puntos}


Function euclid (Tcoor1, Tcoor2: TCoord): Real; { distancia euclidiana en angulos rectos }

begin {distancia_euclidiana}

euclid := (((dist_x (Tcoor1, Tcoor2))*(dist_x (Tcoor1, Tcoor2)))+((dist_y (Tcoor1, Tcoor2))*(dist_y (Tcoor1, Tcoor2))));

if euclid > 0.0001 then euclid := Sqrt(euclid) else euclid := 0.001; 

end; {distancia_euclidiana}




Function manhat (Tcoor1, Tcoor2: TCoord): Real; { distancia city-block en angulos rectos }

begin {distancia_manhathan}

manhat := (abs (dist_x (Tcoor1, Tcoor2))) + (abs(dist_y (Tcoor1, Tcoor2)));

end; {distancia_manhathan}




// funcion promedio entre puntos de cordenadas

Function mediaarit  (tTcoor1, tTcoor2: TCoord):  TCoord;
//
// media aritmetica entre puntos por x y por y
//
    begin

	new (mediaarit);
	mediaarit^.x := (tTcoor1^.x + tTcoor2^.x)/2;
	mediaarit^.y := (tTcoor1^.y + tTcoor2^.y)/2;

    end;






{las funciones de iguales entre coordenadas con sin propincuidad calculada}



Function iguales  (tTcoor1, tTcoor2: TCoord):  boolean; {la clasica con corte de proincuidad media}

    begin

	iguales :=  (abs(tTcoor1^.x - tTcoor2^.x) < prop_media) and (abs(tTcoor1^.y - tTcoor2^.y) < prop_media);

    end;



Function iguales  (tTcoor1, tTcoor2: TCoord ; delta : real):  boolean; {con corte de proíncuidad propuesta}

    begin

	iguales :=  (abs(euclid(tTcoor1,tTcoor2))) < delta ;

    end;



Function iguales  (tTcoor1, tTcoor2: TCoord ; deltax, deltay : real):  boolean; {dos corte de propíncuidad propuesta}

    begin

	iguales :=  (abs(tTcoor1^.x - tTcoor2^.x) < deltax ) and (abs(tTcoor1^.y - tTcoor2^.y) < deltay);

    end;





Function angulo (Tcoor1, Tcoor2: TCoord): Real; { angulo usando arctano arcsin de los lados, expresado en rads }

    begin {angulo}

    if  (dist_y (Tcoor1, Tcoor2) = 0) then angulo:= arcsin((dist_x (Tcoor1, Tcoor2))/ (euclid (Tcoor1, Tcoor2)))
    else angulo := arctan ((dist_x (Tcoor1, Tcoor2))/ (dist_y (Tcoor1, Tcoor2)));

    end; {angulo}







Function alnorte (Ttrazo1: tipotramo): tipotramo;

// dadas las corrdenadas las mas grandes para x seran norte


begin {alnorte}
	new (alnorte);
	new (alnorte^.Ncoord);
	new (alnorte^.Scoord);

if ( Ttrazo1^.Scoord^.x  >  Ttrazo1^.Ncoord^.x ) then
    begin

	alnorte^.Ncoord := Ttrazo1^.Scoord;
	alnorte^.Scoord := Ttrazo1^.Ncoord;

    end

else

alnorte := Ttrazo1;

end; {alnorte}



Function occidente (Ttrazo1: tipotramo): tipotramo;

// dadas las corrdenadas las mas grnades para y seran norte
// siempre y cuando esten en el mismo valor de x


begin {occidente}
	new (occidente);
	new (occidente^.Ncoord);
	new (occidente^.Scoord);

if ( Ttrazo1^.Scoord^.x  =  Ttrazo1^.Ncoord^.x ) and  ( Ttrazo1^.Scoord^.y  <  Ttrazo1^.Ncoord^.y ) then
    begin

	occidente^.Ncoord := Ttrazo1^.Scoord;
	occidente^.Scoord := Ttrazo1^.Ncoord;

    end

else

occidente := Ttrazo1;

end; {occidente}


