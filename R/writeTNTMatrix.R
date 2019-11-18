#
# writes a simple Hennig86/TNT file
# 2015 01 09
#
# DRME dmiranda@uis.edu.co
#


#
# Usage 
# write.TNT.Matrix (data, output)
#
# Where data is a data.frame object
# and output is the file to write
#

writeTNTMatrix <- function (data, file) {
  
  #!PAETerminalsNames      <-  paste("A",rownames(data),sep="")

 PAETerminalsNames      <-  rownames(data)
  
  
  PAETerminalsNumber     <-  length(PAETerminalsNames)
  
  nchars                 <-  length(colnames(data))
  
  cat("xread\n", file =file, append = F)

  cat(paste("\' PAE matrix:",Sys.time(),"\'\n",sep = "  "), file = file, append = T)
  
  cat(paste(nchars,(PAETerminalsNumber+1),"\n",sep = "  "), file = file ,append = T)
  
  rootChars <- c(rep(0,nchars))
  rootChars <-c("ROOT ",rootChars)
  
  cat(rootChars, file =file,append = T)
  cat("\n", file =file,append = T)


  NewPAETerminals <- sub(" ","_",PAETerminalsNames)


   for(i in 1:PAETerminalsNumber){
     cat(c(NewPAETerminals[i],as.character(data[i,])), file =file,append = T)
     cat("\n", file =file,append = T)
   }


cat(";"     ,  file =file,append = T)
cat("\n"    ,  file =file,append = T)

    ## mult must be chaged to fit the number of terminals
    ##

cat("col 2;mult;nel*;taxname=; ts* tmpPAE.tre; save /; quit;",  file =file,append = T)

    cat("\n"    ,  file =file,append = T)
    
cat("proc /;" , file =file,append = T)

cat("\n"    ,  file =file,append = T)

}


#
# writes a simple Hennig86/TNT file
# 2015 01 09
#
# DRME dmiranda@uis.edu.co
#


#
# Usage 
# write.TNT.Matrix (data, output)
#
# Where data is a data.frame object
# and output is the file to write
#

writeTNTMatrix <- function (data, file) {
  
  PAETerminalsNames      <-  paste("A",rownames(data),sep="")
  
  PAETerminalsNumber     <-  length(PAETerminalsNames)
  
  nchars                 <-  length(colnames(data))
  
  cat("xread\n", file =file, append = F)

  cat(paste("\' PAE matrix:",Sys.time(),"\'\n",sep = "  "), file = file, append = T)
  
  cat(paste(nchars,(PAETerminalsNumber+1),"\n",sep = "  "), file = file ,append = T)
  
  rootChars <- c(rep(0,nchars))
  rootChars <-c("ROOT ",rootChars)
  
  cat(rootChars, file =file,append = T)
  cat("\n", file =file,append = T)


  NewPAETerminals <- sub(" ","_",PAETerminalsNames)


   for(i in 1:PAETerminalsNumber){
     cat(c(NewPAETerminals[i],as.character(data[i,])), file =file,append = T)
     cat("\n", file =file,append = T)
   }


cat(";"     ,  file =file,append = T)
cat("\n"    ,  file =file,append = T)

    ## mult must be chaged to fit the number of terminals
    ##

cat("col 2;mult;nel*;taxname=; ts* tmpPAE.tre; save /; quit;",  file =file,append = T)

    cat("\n"    ,  file =file,append = T)
    
cat("proc /;" , file =file,append = T)
cat("\n"    ,  file =file,append = T)

}


