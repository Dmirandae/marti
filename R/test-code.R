
setwd("/home/rafael/Dropbox/papers/martitracks/maRti-R/otherpacks")


##
## functions
##

require(ape)

require(maRti)

### source code 
# source("~/Dropbox/papers/Rpackages/MaRti/R/MST.Propincuity.R")
# 
# source("~/Dropbox/papers/Rpackages/MaRti/R/Propincuity.1.R")
# 
# source("~/Dropbox/papers/Rpackages/MaRti/R/Propincuity.2.R")
# 
# source("~/Dropbox/papers/Rpackages/MaRti/R/plot.Circle.R")



##
## desde igraph http://stackoverflow.com/questions/16605825/minimum-spaning-tree-with-kruskal-algorithm
##

##
## plot a radius
## tackoverflow.com/questions/23071026/drawing-circle-on-r-map
##



### read data

datos  <- read.csv("datos.csv",header = F)

## distance matrix

distance <- dist(datos, method = "euclidian")



##### clac 1

propincuidad <- MST.Propincuity(distance)

propincuidad.media <- mean(propincuidad)

propincuidad.desv <- sqrt(var(propincuidad))


## plotting

plot(datos,
     xlim=c(min(datos[,1]),max(datos[,1])),
     ylim=c(min(datos[,2]),max(datos[,2])))

apply(datos,1,function(df) plot.Circle(df[1],df[2],propincuidad.desv))




## clac 2

neopropincuidad.media <- mean(minimos[-eliminar])

neopropincuidad.media 
propincuidad.media

neopropincuidad.desv <- sqrt(var(minimos[-eliminar]))

neopropincuidad.desv
propincuidad.desv


## generar tres nubes de puntos muy densas, y poco cercanas entre nubes



plot(datos,xlim=c(min(datos[,1]),max(datos[,1])),ylim=c(min(datos[,2]),max(datos[,2])), main="standard propincuity")



apply(datos,1,function(df) plotCircle(df[1],df[2],propincuidad.desv))


apply(datos,1,function(df) plotCircle(df[1],df[2],neopropincuidad.desv))

## a evaluar
## kruskal con vegan
## http://stackoverflow.com/questions/16605825/minimum-spaning-tree-with-kruskal-algorithm



mean(minimum)


minimum %in% propincuidad

propincuidad %in% minimum
