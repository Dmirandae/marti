
procedure unodos1;
		begin
			gotoxy(4,4);
			writeln('Input file');
			gotoxy(5,5);
			repeat
			readln(alpha);
			until alpha <> '';
			if orden(alpha)='q' then halt;
			if not FileExists(alpha) then			 
										begin
										gotoxy(6,6);
										writeln ('file :[',alpha,'] does not exist, give a valid file');
										unodos1;
										end;
			alpha:=orden(alpha);
			writeln ('file :[',alpha,'] exists');
			tengoIn:=true;
		end;

procedure unodos2;
		begin
		clrscr;
			gotoxy(4,4);
			writeln('Output file');
						gotoxy(5,5);
			repeat
			readln(beta);
			until beta <> '';
			if FileExists(beta) then			 
									begin
									gotoxy(6,6);
									writeln ('file :[',beta,'] exists, give a valid file or press r to rewrite');
									repeat
									readln(uno);
									until uno <> '';
									if orden(uno)='r' then TengoOut:=true else unodos2;
									end;
			beta:=orden(beta);
			writeln ('otuput file :[',beta,']');
			TengoOut:=true;
			Assign (salida, beta);
			Rewrite  (salida);					 	  			
		end;


procedure acomodar_arhivos;
begin {acomodar_archivos}

alpha:=ParamStr(1);
beta:=ParamStr(2);
gamma:=ParamStr(3);

corte:= 0.250;
regla1:=0.500;
regla2:=0.250;
regla3:=0.750;
congruencia_minima:=0.85;
tipo:='xyl';


	if (alpha='') then unodos1 else 	
	if FileExists(alpha)  then tengoIn:=true else unodos1;

	if (beta='') then beta:=alpha+'.kml' else 
			if FileExists(beta) then 
					begin 
					writeln ('otuput file :[',beta,'] exists'); 
					sleep(5000); 
					unodos2; 
					end 
			else begin 
				TengoOut:=true;
				Assign (salida, beta);
				Rewrite  (salida);
				end;
						
	
if TengoIn then 
			begin
			Assign (entrada, alpha);
			Reset  (entrada);
			if not TengoOut then 
								begin 
								beta:=alpha +'.kml';
								TengoOut:=true;
								Assign (salida, beta);
								Rewrite  (salida);
					 	     	end;						
 	     	end;
							
		
			if gamma = '' then tengoParam := false else
			if FileExists(gamma)  then tengoParam := true else tengoParam := false;
				

TengoOrden:=tengoParam;

if TengoParam then 
			begin
 				Assign  (param, gamma);
        		Reset  (param); 
        		readln(param,stemp1,uno);  
        		if (orden(stemp1)='data') and (orden(uno)='xyl') then tipo:='xyl';
        		if (orden(stemp1)='data') and (orden(uno)='lxy') then tipo:='lxy';
        		close(param);
        		end;
 
if  TengoOrden then 
 				begin
					Writeln ('There is a bash file');
        			Assign  (ordenes,gamma);
        			Reset  (ordenes);    
      			end;
        	

writeln(alpha,#9,' Infile:   ',TengoIn);
writeln(beta,#9, ' Outfile:  ',TengoOut);
writeln(gamma,#9,' Param:    ',TengoParam);

//halt;

end; {acomodar_archivos}

