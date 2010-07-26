program Marti_tracks_alpha;

// usos
uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, math,
  Crt;

//
// archivos a global stuff
//


// constantes
{$IFDEF CPU32}
{$I const32.pas}
 {$ENDIF}
 {$IFDEF CPU64} 
{$I const.pas}
{$ENDIF}



// tipos
{$I type.pas}


// variables GLOBALES
{$I var.pas}


// funciones
{$I track0.pas}
{$I track1.pas}


// procedimientos

{$I prockml.pas}
{$I procedures0.pas}
{$I procedures3.pas}
{$I ordenes.pas}
{$I files.pas}
{$I ui1.pas}


begin {main}
clrscr;

prekaos:=false;
kaos:=false;
kaos2:=false;
kaos3:=false;
sip:=false;
printkml:=false;
salidausada:=false;
hacertrack:=false; 

 
acomodar_arhivos;

kml0;

num_especies:=0;
numRespuestas:=0;

hicelistado:=false;
if TengoIn then entrar_datos_xy(tipo);
nspp:=num_especies;

if (beta='listar') then 
							begin
							enlistar_datos('listado.txt');
							deletefile(beta);
							halt;	
							end;


if TengoOrden then entrar_comandos else begin
										prekaos:=true;
										uinterface;
										end; 


cerrar_kml;
textbackground(white);
TextColor(black);

clrscr;
	writeln;
	writeln;
	writeln(' ____________________________________________________________________ ');
	writeln('|                                                                    |');

if not salidausada then 
					begin 
					deletefile(beta);
					writeln('|   WARNING NOTICE   :  NO OUTPUT WRITTEN                            |');
					end;

	writeln('|                                                                    |');
	writeln('|                    --- Thanks for using PGtrack ----               |');
	writeln('|                                                                    |');
	writeln('|     num sp ',num_especies,' num Answers ',nspp-num_especies,' -num tracks armed- ',numRespuestas,'. [Nodes=',nodes,']     |');
 	writeln('|                                                                    |');
	writeln('|____________________________________________________________________|');
	writeln;
	writeln;
end. {main}
