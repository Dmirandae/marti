

createPAEMatrix <- function (distributionalData, sizeLat, sizeLong) {
  
  minLat <- min(distributionalData$Latitude) 
  maxLat <- max(distributionalData$Latitude) 
  
  minLong <- min(distributionalData$Longitude) 
  maxLong <- max(distributionalData$Longitude) 
  
 
  gridSizeLat <- ceiling ((maxLat - minLat) / sizeLat)
  
  gridSizeLong <- ceiling ((maxLong - minLong) / sizeLong)
  
  numberSpecies <- length(levels(distributionalData$Species))
  
  maxSizeGrid <- gridSizeLat*gridSizeLong
  

  
  GridPlace <- function (pointToPlaceLat, pointToPlaceLong, maxLat, maxLong, 
                         sizeLat, sizeLong, gridSizeLat) {
    
    #pointToPlaceLat <- maxLat
    
    #pointToPlaceLong <- maxLong
      
    gridLat <- trunc(((maxLat-pointToPlaceLat)/sizeLat)+1)
    
    gridLong <- trunc(((maxLong-pointToPlaceLong)/sizeLong)+1)
    
    
    if (gridLat < 0 || gridLong < 0) {stop("Lat/Long values are out of limits")}
    
    CuadriculaAsignada <- (gridLat+((gridLong-1)*gridSizeLat))
  
    if (any(CuadriculaAsignada > maxSizeGrid)) {stop("Grid values are out of limits")}
    
    return(CuadriculaAsignada)
  }
  
  
  distributionalData$GridNumber<- GridPlace(pointToPlaceLat = distributionalData$Latitude,
                                            pointToPlaceLong = distributionalData$Longitude,
                                            maxLat, maxLong, 
                                            sizeLat, sizeLong,
                                            gridSizeLat)
  
  
  
  MatrixdistribData<-table(distributionalData$Species,distributionalData$GridNumber)
  
  
  
  MatrixdistribData[which(MatrixdistribData >0)] <- 1
  
  
  
  return(as.data.frame.matrix(MatrixdistribData))

}



createPAEMatrix <- function (distributionalData, sizeLat, sizeLong) {
  
  minLat <- min(distributionalData$Latitude) 
  maxLat <- max(distributionalData$Latitude) 
  
  minLong <- min(distributionalData$Longitude) 
  maxLong <- max(distributionalData$Longitude) 
  
 
  gridSizeLat <- ceiling ((maxLat - minLat) / sizeLat)
  
  gridSizeLong <- ceiling ((maxLong - minLong) / sizeLong)
  
  numberSpecies <- length(levels(distributionalData$Species))
  
  maxSizeGrid <- gridSizeLat*gridSizeLong
  

  
  GridPlace <- function (pointToPlaceLat, pointToPlaceLong, maxLat, maxLong, 
                         sizeLat, sizeLong, gridSizeLat) {
    
    #pointToPlaceLat <- maxLat
    
    #pointToPlaceLong <- maxLong
      
    gridLat <- trunc(((maxLat-pointToPlaceLat)/sizeLat)+1)
    
    gridLong <- trunc(((maxLong-pointToPlaceLong)/sizeLong)+1)
    
    
    if (gridLat < 0 || gridLong < 0) {stop("Lat/Long values are out of limits")}
    
    CuadriculaAsignada <- (gridLat+((gridLong-1)*gridSizeLat))
  
    if (any(CuadriculaAsignada > maxSizeGrid)) {stop("Grid values are out of limits")}
    
    return(CuadriculaAsignada)
  }
  
  
  #GridPlace(maxLat,maxLong,
  #          maxLat, maxLong, sizeLat,
  #          sizeLong,gridSizeLat
  #          )
  
  distributionalData$GridNumber<- GridPlace(pointToPlaceLat = distributionalData$Latitude,
                                            pointToPlaceLong = distributionalData$Longitude,
                                            maxLat, maxLong, 
                                            sizeLat, sizeLong,
                                            gridSizeLat)
  
  
  
  MatrixdistribData<-table(distributionalData$Species,distributionalData$GridNumber)
  
  
  
  MatrixdistribData[which(MatrixdistribData >0)] <- 1

  
  return(as.data.frame.matrix(MatrixdistribData))

}

