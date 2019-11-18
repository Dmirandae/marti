

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


data3
## revisar duplicado para talba


## duplicados booleano
duplicados <- duplicated(data3)

## quizas es esta ???
## http://stackoverflow.com/questions/12495345/find-indices-of-duplicated-rows
##
duplicados <- (duplicated(data3) | duplicated(data3, fromLast = TRUE))


## duplicado la tabla
data3[duplicados,]

sip funciona ok


########

data3[,1]%in%data3[duplicados,]

x[x%in%x[duplicated(x)]]
data3[data3&in&duplicated,]


#####################################################################################

data4 <- data3[apos,]

dist <- dist(data4)


distance.Matrix <- as.matrix(dist)
large.value <- max(distance.Matrix) + 1

diag(distance.Matrix) <- large.value

length(distance.Matrix[,1])

##
## el valor minimo es 1 ya que eso indica la 
## preswencia de dos o mas porque se ha eliminado la diagonal
## de auto similaridad
##

#pae.value <- 2

#mono <- function (x) {
 # if(length(which(x==0))>=pae.value){
  #  return(TRUE)}else{
   #   return(FALSE)  
    #}     
  #}


#apos.final <- apply(distance.Matrix,1,mono)

#apos.final


#data3
