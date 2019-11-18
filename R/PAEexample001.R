
##
## to test PAE in marti/cleog 
##
######
##### getting lat/long data
#####



setwd("/home/rafael/Dropbox/papers/Rpackages/MaRti/paeInMarti")

args <- commandArgs(trailingOnly = TRUE)

if (length(args)!=0){datos <- (args[1])}else{datos<-"cycas-marti.dat"}


distributionalData <-read.csv(datos, header = T, sep =" ")
distributionalData[,(2:3)] <- round(distributionalData[,(2:3)],2)
distributionalData <- unique(distributionalData)
#names(distributionalData)<- c("Species","Latitude","Longitude")
## size of the grid 

sizeLat  <- 0.5
sizeLong <- 0.5
##
## create the pae matrix
##
setwd("/home/rafael/Dropbox/papers/Rpackages/MaRti/paeInMarti")
source("sourcePAE.R")
PAEMatrix <- createPAEMatrix(distributionalData,
             sizeLat, sizeLong)
colnames(PAEMatrix) <- paste("A",colnames(PAEMatrix),sep = "")
##
## testing write.TNT.matrix
## the matrix is transposed
##
data <- t(PAEMatrix)
writeTNTMatrix(data,"tmpPAE.mtr")
####
####
#### running TNT
####
####
runTNT("tmpPAE.mtr")
## read TNT tree
treePAE <- readTNTtree("tmpPAE.tre")
#
plot(treePAE)
## create data.frame
dataPAE <- as.data.frame(data)
    ## funcion para ver si esta en todas las areas
    allT <- function(x){all(x==T)}
    Groups <- prop.part(treePAE)
      
    dataPAE <- as.data.frame(data)
    
    length(dataPAE) 
      ListPAE  <- list()
      tmpListPAE  <- list()
      for (i in 3:length(Groups)){
        tmpNewGroups <-   treePAE$tip.label[Groups[][[i]]]
        tmpListPAE [[1]] <- tmpNewGroups
        tmpGroups <- (dataPAE[tmpNewGroups,]==1)
        tmpAPO  <- apply(tmpGroups,2,allT)
        listado <- labels(which(tmpAPO))
        for (j in listado){
          tmpAPO[labels(tmpAPO)==j] <- all(row.names(dataPAE)[which(dataPAE[,j]==1)] %in% tmpNewGroups)
            
          }

        RealLabels <-  labels(tmpGroups)[[2]][tmpAPO]
        tmpListPAE [[2]] <-RealLabels
        ListPAE [[i-2]] <-tmpListPAE 
        numSpecie <-  which(colnames(dataPAE)%in%labels(tmpGroups)[[2]][tmpAPO])
        dataPAE  <-   dataPAE[,-c(numSpecie)]
      }
    
    
    numActaulPAE <-  (length(ListPAE)+1)
    
    SumTrue <- function (x){sum(x)==T}
    
    print(dataPAE)

    dataPAEb <- as.data.frame(dataPAE[,apply(dataPAE,2,SumTrue)] )

    rownames(dataPAEb) <- rownames(dataPAE)

    #!!dataPAEb
    #!!dataPAEc <- dataPAE[,apply(dataPAE,2,SumTrue)] 

    #!!dataPAEc <- apply(dataPAE,2,SumTrue)

    ##!print(rownames(dataPAE[(which(dataPAE[,
    ##!      dataPAEc]==1)),]))
##



    dataPAE <- dataPAEb

##print(dataPAE)

## se complica cuando la tabla es un vector
## quizas mejor extraer los nombrs de las especies de cada uno ya que son 
## una sola


    for (i in row.names(dataPAE)){
      tmpGroups <- (dataPAE[i,]==1)
      print(i)
      print(tmpGroups)
      
      tmpAPO  <- apply(tmpGroups,2,allT)
      
      print(tmpAPO)
      
      tmpListPAE [[1]] <- row.names(tmpGroups)
      tmpListPAE [[2]] <-labels(tmpGroups)[[2]][tmpAPO]
      ListPAE [[numActaulPAE]] <-tmpListPAE       
      numActaulPAE <-  numActaulPAE +1      
      
    }

  #print("results")  

  for (i in 1:length(ListPAE)){
   # print(c(ListPAE[[i]][[1]],ListPAE[[i]][[2]]),max.levels = 5)
  }

