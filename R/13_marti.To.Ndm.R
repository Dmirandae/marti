#'@title title
#'
#'@description
#'
#'@param data
#'
#'@param outfile
#'
#'@param openf
#'
#'@details This funtion is part of maRtitRacks
#'
#'@seealso
#'
#'@return 
#'
#'@author Miranda-Esquivel Daniel R.
#'
#'@seealso \code{\link{}}
#'@seealso \code{\link{}}
#'
#'@example

write.ndm <-function (data = NULL, 
                      outfile = "salida.xyd"){
  species <- levels(data$V1)
  number.species <- length(levels(data$V1))
  outfile <- file(description = outfile, open = 'w')
  writeLines(paste("spp", number.species, sep = "  "), outfile)
  writeLines("nocommas", outfile)
  writeLines("xydata\n", outfile)
  for (i in 1:number.species) {
    writeLines(paste("sp", i-1, "[", species[i], "]", sep = " "), outfile)
    distribution <- data[data$V1 == species[i], ]
    writeLines(paste("\t", distribution$V2, distribution$V3, sep = " "), outfile)    
    writeLines("\n", outfile)
  }
  close(outfile)
}
