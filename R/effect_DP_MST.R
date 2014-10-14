##
## Evaluates the effect of Ramer - Douglas - Peucker on simplifying tracks  
##
## DRME nov 04 - 2012
## dmiranda(at)uis(dot)edu(dot)co

##
## libraries
##

library(maptools)
library(rgeos)
library(nnclust)
library(shapefiles)

##
## functions
##

graph_mst <- function (l) {
  distrib<-l@lines[[1]]@Lines[1][[1]]@coords
  mst<-mst(l@lines[[1]]@Lines[1][[1]]@coords)
  plot(l, col="white");title("MST")
  segments(distrib[mst$from,1], distrib[mst$from,2], distrib[mst$to,1],distrib[mst$to,2],col="red")
}


graph_simpl <- function (m, tol) {
  l<-(gSimplify(m,tol=tol))
  plot(l);title(c("tol = ",tol))  
  graph_mst(l)
}


## data

    n= l = readWKT("LINESTRING(0 7,1 6,2 1,3 4,4 1,5 7,6 6,7 4,8 6,9 4)")

    par(mfrow=c(3,2))

    plot(l);title("Original")
    graph_mst(l)
    graph_simpl(n,1)
    graph_simpl(n,2)
    graph_simpl(n,4)
    graph_simpl(n,6)

