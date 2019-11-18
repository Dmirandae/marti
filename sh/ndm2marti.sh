
## nota:
##  el archivo debe tener todo en final de linea de linux

                        
## una posible ruta de inicio

## grep -n 'sp 0' $1 | awk -F: '{print $1}'
##   tail -n + $1> temp000

## pero debe tener un solo espacio etre sp y el numero

## ensayar sed sp\[0-9\].0



## retocando el archivo de entrada

sed 's/\[//g' $1 | sed 's/\]//g' | awk '(NF>1 && $1=="sp") {s= $3"_"$4"_"$5"_"$6} ; (NF==2 && $1!="sp") {print (s,$1,$2)}' | sed 's/__//g' >  $1.dat


##awk '( gsub("\[","",$0) && gsub("\]","",$0) && NF>1 && $1=="sp") {s= $3_$4_$5_$6} ; (NF==2 && $1!="spp") {print (s" "$1" "$2)}' $1 >  $1.dat



