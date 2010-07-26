				for itemp:=1 to  nspp do
					begin
					for itemp1:=itemp+1 to nspp do
						if  ((Ptrazo[itemp1]<> nil) and (Ptrazo[itemp]<> nil))
						and  ((Ptrazo[itemp]^.num_tramos> 0) and (Ptrazo[itemp1]^.num_tramos> 0))
						then begin
							if (max (congruencia (itemp, itemp1, 'min'),congruencia (itemp1, itemp, 'min'))) > congruencia_minima
							then 
							begin						
								if prekaos then writeln('reducing ',itemp, ' y   ',itemp1);
								reduce2tracks(itemp, itemp1);
							end;
					end;
					
					end;
