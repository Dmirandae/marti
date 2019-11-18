


CountGbif <- function ( pais, genero, especie ) {
  
  
  ##
  ## libraries
  ##
  
  #library(dismo)
  
  ##http://data.gbif.org/ws/rest/occurrence/count?originisocountrycode=CO&scientificname=Salamandra+salamandra
  
  ## este sitio da ok
  #sitio <- "http://data.gbif.org/ws/rest/occurrence/count?originisocountrycode=CO&scientificname=Tyto+alba"
  
  ##
  ## variables
  ##
  
  #
  pais <- "CO"
  
  pais <- toupper(pais)
  
  #
  genero <- "Tyto"
  
  #
  especie <- "alba"
  
  sitio <- paste("http://data.gbif.org/ws/rest/occurrence/count?originisocountrycode=",
                 pais,"&scientificname=",genero,"+",especie,sep="")
  
  sitio
  
  X <- read.csv(url(sitio))
  
  
  #m = regexpr(".*totalMatched=",X[,1])
  #substr(X[,1],m+5,m+attr(m,"match.length")-1)
  
  ## tmp <-sub(".*totalMatched=", "",X[,1])
  ## no anda
  
  string = as.character(X[grep("totalMatched=", X[,1]),1])
  
  tmp <-sub(".*=","", string)
  
  numero <-as.numeric(gsub("/>","", tmp))
  
  
return(X)
}



#X[18,1]

##
## extraer "string" en r
## http://stackoverflow.com/questions/17215789/extract-a-substring-in-r-according-to-a-pattern
##


