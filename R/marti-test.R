##
setwd("/home/rafael/Dropbox/papers/martitracks/maRti-R/otherpacks")


## Tres posibles "soluciones" a la propincuidad media


library("devtools")
# 
# 
install_github("Dmirandae/marti")

library(marti)

datos  <- read.csv("datos.csv",header = F)


distance <- dist(datos, method = "euclidian")


require(ape)

## usando MST

propincuidad <- MST.Propincuity(distance)

propincuidad.media <- mean(propincuidad)

propincuidad.desv <- sqrt(var(propincuidad))


### var 1

neopropincuidad <- Propincuity.1(distance)

neopropincuidad.media <- mean(neopropincuidad)

neopropincuidad.desv <- sqrt(var(neopropincuidad))

##  var 2


neo2propincuidad <- Propincuity.2(distance)

neo2propincuidad.media <- mean(neo2propincuidad)

neo2propincuidad.desv <- sqrt(var(neo2propincuidad))


#### graficado

plot(datos,xlim=c(min(datos[,1]),max(datos[,1])),ylim=c(min(datos[,2]),max(datos[,2])))

apply(datos,1,function(df) plot.Circle(df[1],df[2],propincuidad.desv))

apply(datos,1,function(df) plot.Circle(df[1],df[2],neopropincuidad.desv))

apply(datos,1,function(df) plot.Circle(df[1],df[2],neo2propincuidad.desv))


propincuidad.desv - neopropincuidad.desv

propincuidad.desv - neo2propincuidad.desv

neo2propincuidad.desv - neopropincuidad.desv

