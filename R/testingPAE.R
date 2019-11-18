
######
##### getting lat/long data
#####

setwd("/home/disco2/Dropbox/papers/Rpackages/MaRti/test")

distributionalData <-read.csv("temp.txt", header = T, sep =" ")

distributionalData[,(2:3)] <- round(distributionalData[,(2:3)],2)

distributionalData <- unique(distributionalData)

head(distributionalData)

distributionalData$Species

## size of the grid 
sizeLat  <- 1
sizeLong <- 1


##
## create the pae matrix
##

source("createPAEMatrix.R")

PAEMatrix <- createPAEMatrix(distributionalData,
             sizeLat, sizeLong)


head(PAEMatrix)

##
## testing write.TNT.matrix
## the matrix is trasposed
##

source("writeTNTMatrix.R")

data <- t(PAEMatrix)



file <- "tmpPAE.mtr"



writeTNTMatrix(data,file)



####
####
#### running TNT
####
####


source("runTNT.R")



dataMatrix<- "tmpPAE.mtr"

runTNT(dataMatrix)


Sys.getenv("TERM")


Sys.setenv(EDITOR= "nano")

Sys.setenv(TERM= "xterm")


source("readTNTtree.R")

tree.File <- "tmpPAE.tre"

tree.File <- "tnt3.tre"


treePAE <- readTNTtree(tree.File)

plot(treePAE)
