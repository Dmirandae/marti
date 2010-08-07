program Marti_tracks_beta05;

{
        
        Copyright 2010 Daniel Rafael Miranda-Esquivel <dmiranda@uis.edu.co>
        
        This program is free software; you can redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation; either version 2 of the License, or
        (at your option) any later version.
        
        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.
        
        You should have received a copy of the GNU General Public License
        along with this program; if not, write to the Free Software
        Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
        MA 02110-1301, USA.
}


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
