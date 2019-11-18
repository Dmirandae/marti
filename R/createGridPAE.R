
######
##### getting lat/long data
#####

setwd("/home/disco2/Dropbox/papers/Rpackages/MaRti/test")

distributionalData <-read.csv("testDist.dat", header = F, sep =" ")

distributionalData[,(2:3)] <- round(distributionalData[,(2:3)],2)

distributionalData <- unique(distributionalData)

head(distributionalData)



## size of the grid 
sizeLat  <- 7
sizeLong <- 9



### assuming lat long in the file


minLat <- min(distributionalData[,2]) 
maxLat <- max(distributionalData[,2]) 

minLong <- min(distributionalData[,3]) 
maxLong <- max(distributionalData[,3]) 





gridSizeLat <- ceiling ((maxLat - minLat) / sizeLat)

gridSizeLong <- ceiling ((maxLong - minLong) / sizeLong)

numberSpecies <- length(levels(distributionalData[,1]))

maxSizeGrid <- gridSizeLat*gridSizeLong

#MatrixdistribData <- mat.or.vec(nr =numberSpecies, nc =maxSizeGrid )

#distributionalData[1,(2:3)]

GridPlace <- function (pointToPlaceLat, pointToPlaceLong, maxLat, maxLong, 
                       sizeLat, sizeLong, gridSizeLat) {
  
  #pointToPlaceLat <- maxLat
  
  #pointToPlaceLong <- maxLong
    
  gridLat <- trunc(((maxLat-pointToPlaceLat)/sizeLat)+1)
  
  gridLong <- trunc(((maxLong-pointToPlaceLong)/sizeLong)+1)
  
  
  if (gridLat < 0 || gridLong < 0) {stop("Lat/Long values are out of limits")}
  
  CuadriculaAsignada <- (gridLat+((gridLong-1)*gridSizeLat))

  if (CuadriculaAsignada > maxSizeGrid) {stop("Grid values are out of limits")}
  
  return(CuadriculaAsignada)
}


#GridPlace(maxLat,maxLong,
#          maxLat, maxLong, sizeLat,
#          sizeLong,gridSizeLat
#          )

distributionalData$Cuadricula<- GridPlace(pointToPlaceLat = distributionalData$V2,pointToPlaceLong = distributionalData$V3,
          maxLat, maxLong, sizeLat,
          sizeLong,gridSizeLat)

names(distributionalData) <- c("sp","lat","long","Cuadricula")


MatrixdistribData<-table(distributionalData$sp,distributionalData$Cuadricula)



MatrixdistribData[which(MatrixdistribData >0)] <- 1

MatrixdistribData

