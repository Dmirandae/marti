

MST.Propincuity <- function (distance.Matrix){
  ##
  ## Based on ape::mst function
  ##

  
  if (class(distance.Matrix) == "dist") 
    distance.Matrix <- as.matrix(distance.Matrix)
  n <- dim(distance.Matrix)[1]
  
  tree <- listado <- NULL
  large.value <- max(distance.Matrix) + 1
  diag(distance.Matrix) <- large.value
  index.i  <- 1
  for (i in 1:(n - 1)) {
    tree <- c(tree, index.i)
    min.Distance <- apply(as.matrix(distance.Matrix[, tree]), 2, min)
    a <- sortIndex(distance.Matrix[, tree])[1, ]
    b <- sortIndex(min.Distance)[1]
    index.j <- tree[b]
    index.i <- a[b]
    
    listado[i] <- distance.Matrix[index.i, index.j]
    
    
    for (j in tree) {
      distance.Matrix[index.i, j] <- large.value
      distance.Matrix[j, index.i] <- large.value
    }
  }
  
  return(listado)
}
