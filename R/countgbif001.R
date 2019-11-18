CountGbif <- function (pais, genero, especie) {
  
  sitio <- paste("http://data.gbif.org/ws/rest/occurrence/count?originisocountrycode=",
                 pais,"&scientificname=",genero,"+",especie,sep="")
    
  X <- read.csv(url(sitio))
    
  tmp <-gsub("<gbif:summary totalMatched=","", X[18,1])
  
  X <-as.numeric(gsub("/>","",tmp))

return(X)
}
