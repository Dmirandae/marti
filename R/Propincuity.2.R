
Propincuity.2 <- function (dist.Matrix) {
  
  # forma 3 usando los min de distancia
  
  dist.Matrix <- as.matrix(distance) 
  
  large.value <- max(dist.Matrix) + 1
  
  diag(dist.Matrix) <- large.value
  
  minimos <- apply(dist.Matrix,1,min)
  
  parejas.minimos <- matrix(NA,nrow =length(minimos),ncol = 2 )
  
  for (i in 1:length(minimos)){
    parejas.minimos[i,1] <- i
    parejas.minimos[i,2] <-(which(dist.Matrix[,i]==minimos[i]))
  }
  
  eliminar  <- NULL
  
  for (i in 1:(length(parejas.minimos[,1])-1)){
    for (j in (i+1):length(parejas.minimos[,1])){
      if (all(parejas.minimos[i,] %in% parejas.minimos[j,])){
#        print(paste("a eliminar en ",i,"---",j))
        parejas.minimos[j,] <-c(-rnorm(1),-rnorm(1))
        eliminar <- c(eliminar,j) 
      }
    }
  }
  
  minimos <- minimos[-eliminar]
  
  return(minimos)
  
}
