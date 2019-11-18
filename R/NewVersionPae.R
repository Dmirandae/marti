
##
## 2015 01 02
## newpae function
##



## pae as monophyletic nodes
## a list of terminals from the data matrix
## must return a vector of booleans
## and then chracter matrix must be reduced
## then two or more character are consider as support
## and plotted as species distribution

require(ape)

tree2 <- read.tree("funny2.tre")

plot(tree2)


# tree2 <- root(tree2,outgroup = "XXX")
# 
# plot(tree2)


data2 <- read.nexus.data("funny2.nex")

#data3 <- as.data.frame(t(data2))

data3 <- as.data.frame(data2)


names(data3)

## number of characters

numChacters <- length(rownames(data3))


## as previous line but retrieving the sequence of numbers

secuencia <- 1:length(data3[,1]) 


##
## vector of apomorphic characters as taxa with the character in quest
## is monophyletic
##

apos <- NULL

for (i in secuencia){
  
  terminals <- names(data3)[which(data3[i,]==1)]
    
  if (length(terminals) >1){
    apos[i] <- is.monophyletic(tree2,terminals)
  }
  
}

apos

length(apos)


data3
## revisar duplicado para tabla


## duplicados booleano
## http://stackoverflow.com/questions/12495345/find-indices-of-duplicated-rows
##
duplicados <- (duplicated(data3) | duplicated(data3, fromLast = TRUE))

length(duplicados)

RealPae <- apos & duplicados 


