data = read.csv("datos.csv",header=F)

EuclidDistPP <- function (EDpuntox,EDpuntoy) sqrt((EDpuntox[1]-EDpuntoy[1])^2+(EDpuntox[2]-EDpuntoy[2])^2)

long = length(data[,1]) 

              distancia = matrix(0,long,long)
              
  for (i in 1:(long-1)){
    for (j in (i+1):long){
      print(paste(i," ",j))
      distancia[j,i] = EuclidDistPP(data[i,],data[j,])
    }
  
}  

distancia


library(vegan)
?vegdist

dist.original = dist(data)

as.dist(distancia)

all.equal(as.dist(distancia),dist.original)

tr1 <- spantree(as.dist(distancia))


tr1$dist

plot(tr)
plot(tr, cmdscale(dis), type = "t")
plot(tr)
plot(tr, cmdscale(dis), type = "t")
tr
tr$dist
mean(tr$dist)
tr$dist
?dis
?vegdist
dis <- vegdist(dune, method="euclidian")
tr <- spantree(dis)
tr
plot(tr)
plot(tr, cmdscale(dis), type = "t")
data = read.csv("datos.csv",header=F)
data
dis <- vegdist(data, method="euclidian")
dis
tr <- spantree(dis)
tr
data
dis
tr
quit()


