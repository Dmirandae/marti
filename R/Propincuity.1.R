
Propincuity.1 <- function (dist.Matrix) {

  
  ## forma 2 de calculo sin usar MST
  dist.Matrix <- as.matrix(distance) 
  
  large.value <- max(dist.Matrix) + 1
  diag(dist.Matrix) <- large.value
  
  size <- length(colnames(dist.Matrix))
  
  minimum <- NULL
  
  ## el arcercamiento puede sobre estimar la distancia entre puntos si ya el punto tiene una distancia minima en el 
  ## paquete y la segunda distancia es maslarga que esta anteiormente minima
  
  for (i in 1:size){
    
    minimum[i] <- min(dist.Matrix[i,])
    dist.Matrix[dist.Matrix == minimum[i]] <- large.value
    
  }
  
  return(minimum)
}
