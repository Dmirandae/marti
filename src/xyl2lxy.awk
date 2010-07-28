#!/usr/bin/awk -f

#
# the awsome b-bourbaki team
# DRME Junio 1 2010
#
# awk para pasar de xread (DNA) a phylip desde una salida de xread-;
# una sola linea
# uso tophylip.awk <in >out

{{print $3,$1,$2}}

 
