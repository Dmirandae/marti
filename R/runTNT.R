####
####
#### running TNT
####
####

#dataMatrix<- "tmpPAE.mtr"

runTNT <- function (dataMatrix) {
  
  print(paste("Running:" ,dataMatrix))
  
  y <- system(paste("tnt p ",dataMatrix),ignore.stdout = T, ignore.stderr = T,wait = T,intern = F)

  print(paste("Done: " ,dataMatrix))
    
  if (y != 0){warning( "Unable to complete TNT run.
                       Please run tmpPAE.mtr yourself." )}

}


####
####
#### running TNT
####
####

#dataMatrix<- "tmpPAE.mtr"

runTNT <- function (dataMatrix) {
  
  print(c(" running " ,dataMatrix))
  
  y <- system(paste("tnt p ",dataMatrix),ignore.stdout = T, ignore.stderr = T,wait = T,intern = F)
  
  if (y != 0){warning( "Unable to complete TNT run.
                       Please run tmpPAE.mtr yourself." )}

}


