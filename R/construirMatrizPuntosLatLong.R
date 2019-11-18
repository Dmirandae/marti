library(ape)
library(picante)

set.seed(12345)


## funciones



posicionEnCuadricula <- function(val, min=0,interval=0.25) {
 
return(paste("A",ceiling((val- min)/interval),sep=""))
  
}

## DISTRIBUCIONES Y COORDENADAS 

#Tabla de coordenadas de 10000 puntos con dist. uniforme
x <- runif(1000,min=0, max=1)
y <- runif(1000, min=0, max=1)


 nombres <- rep(paste(rep("t",10),1:10,sep=""),100)

 
 posicion <- paste(posicionEnCuadricula(x,interval=0.25), posicionEnCuadricula(y,interval=0.2),sep="_")

coordenate<-data.frame(nombres,x,y, posicion)

coordenate  <- coordenate[order(coordenate$nombres),]



tablaDatos <- table(coordenate$nombres,coordenate$posicion)

## contabilizado las riquezas

tablaDatos

## solo incidencias
tablaDatos[tablaDatos > 1] <- 1

tablaDatos

class(tablaDatos)
