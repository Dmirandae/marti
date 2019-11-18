
##
## to test PAE in marti/cleog 
##


######
##### getting lat/long data
#####

setwd("/home/rafael/Dropbox/papers/Rpackages/MaRti/paeInMarti")

distributionalData <-read.csv("cycas-marti.dat", header = F, sep =" ")

distributionalData[,(2:3)] <- round(distributionalData[,(2:3)],2)

distributionalData <- unique(distributionalData)

names(distributionalData)<- c("Species","Latitude","Longitude")

#!!head(distributionalData)

#!!distributionalData$Species

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

#!!head(PAEMatrix,2)


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


#!!Sys.getenv("TERM")
#!!Sys.setenv(EDITOR= "nano")
#!!Sys.setenv(TERM= "xterm")


## read TNT tree

treePAE <- readTNTtree("tmpPAE.tre")

#
plot(treePAE)


## create data.frame

dataPAE <- as.data.frame(data)

#!!names(dataPAE)

#!!rownames(dataPAE)


##!! un objeto con las especies que estan en el nodo
##!! test explicixcto con lso dos numeros

##!!tmp0 <- (dataPAE[c(2,5),]==1)
#!!labels(tmp0)
#!!tmp0[1,]==T & tmp0[2,]==T  
##!! los labels de las que son T & T
#!!labels(tmp0)[[2]][tmp0[1,]==T & tmp0[2,]==T]

##!! idem pero en numeros
##!!  which(tmp0[1,]==T & tmp0[2,]==T)



##!! labels de todos los que son all T
    ## funcion para ver si esta en todas las areas
    allT <- function(x){all(x==T)}

    ##!!realAPO  <- apply(tmp0,2,allT)
    ##!!labels(tmp0)[[2]][realAPO]
    ##!!which(realAPO==T)



    Groups <- prop.part(treePAE)
      

    dataPAE <- as.data.frame(data)

    #!!which(data[,"Zamia_fairchildiana"]==1)
    

    length(dataPAE) 
    ##!! no es la forma correcta
    ##!!     head(dataPAE)
    ##!! row.names(dataPAE)[which(dataPAE[2,]==1)]

      ListPAE  <- list()
      tmpListPAE  <- list()

      for (i in 3:length(Groups)){
        
        ##!!  i<-4
              
        tmpNewGroups <-   treePAE$tip.label[Groups[][[i]]]
        tmpListPAE [[1]] <- tmpNewGroups
        
        
        tmpGroups <- (dataPAE[tmpNewGroups,]==1)
        
        
        tmpAPO  <- apply(tmpGroups,2,allT)
        
        listado <- labels(which(tmpAPO))
        
        ##!!dataPAE[,tmpAPO]
        
        for (j in listado){
           #!!j <- "Zamia_fairchildiana"
          tmpAPO[labels(tmpAPO)==j] <- all(row.names(dataPAE)[which(dataPAE[,j]==1)] %in% tmpNewGroups)
                    
        }
        
        
        ##!! algo raro aqui
        
        #!!tmpNumber <- apply(tmpGroups,2,sum)==length(tmpGroups)
        
        #!!tmpAPO & tmpNumber
        
        ##!! revisar AQUI como escoger las especies que son solo del clado
        
        RealLabels <- 
          labels(tmpGroups)[[2]][tmpAPO]
        #!![apply(
         #!! dataPAE[,
          #!!        labels(tmpGroups)[[2]][tmpAPO]
           #!!       ],
            #!!   2,sum)
        #!! ==
         #!! ]
        
        
        tmpListPAE [[2]] <-RealLabels
        
        ListPAE [[i-2]] <-tmpListPAE 
        
        
        numSpecie <-  which(colnames(dataPAE)%in%labels(tmpGroups)[[2]][tmpAPO])
        dataPAE  <-   dataPAE[,-c(numSpecie)]
        ##!!        ListPAE [[i-2]][2] <- c(numSpecie)
      }

    

    numActaulPAE <-  (length(ListPAE)+1)

    ListPAE
    
    SumTrue <- function (x){sum(x)==T}
    
    dataPAE <- dataPAE[,apply(dataPAE,2,SumTrue)] 

    #!!length(dataPAE)
  
    ##!! mejro con subsetting y revisando?


    for (i in row.names(dataPAE)){
      #!!      i  <-  treePAE$tip.label[2]
      #!!               i <- 1
      ##!! i <- "A111"
      tmpGroups <- (dataPAE[i,]==1)
      tmpAPO  <- apply(tmpGroups,2,allT)
      tmpListPAE [[1]] <- row.names(tmpGroups)
      tmpListPAE [[2]] <-labels(tmpGroups)[[2]][tmpAPO]
      ListPAE [[numActaulPAE]] <-tmpListPAE
      
      ##!!print(ListPAE[[numActaulPAE]][1])
      
      #!!print(i)
      #!!print(ListPAE [[numActaulPAE]])
      ##!!numSpecie <-  which(colnames(dataPAE)%in%tmpListPAE[[2]])
      ##!!      ListPAE [[numActaulPAE]][2] <- c(numSpecie)
      ##!!print(paste("numero:",numActaulPAE,"--long:",length(dataPAE)))
      ##!!dataPAE  <-   dataPAE[,-c(numSpecie)]
      ##!!print(paste("post:",length(dataPAE)))
      ##!!if (length(dataPAE)==0){print("nos jodimos")}
      numActaulPAE <-  numActaulPAE +1
      
      
    }

length(ListPAE)

#!!for (i in 1:length(ListPAE)){
 #!! print(ListPAE[[i]][1])
  #!!print(ListPAE[[i]][2])
  
#!!}

ListPAE


#!!treePAE$tip.label
