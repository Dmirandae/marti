
readTNTtree <- function (tree.File){
  
  require(ape)

	 tnt2nexus <- function (tmpTree0) {
    
  	  tmpTree1  <- gsub(" ",",",tmpTree0)
  	
    	tmpTree1  <- gsub("\\)\\(","\\),\\(",tmpTree1)
  	
  	  tmpTree1  <- gsub(",\\)","\\)",tmpTree1)
        	  
  	  tmpTree1  <- gsub("\\(,","\\(",tmpTree1)
  	    	  
  	  tmpTree1  <- gsub("\\*",";",tmpTree1)
      
  	  finalTree  <- read.tree(text=tmpTree1)
  			
  	 return(finalTree)
	}
  
  tmpFile <- readLines(tree.File)
  longtmpFile <- length(tmpFile) 
  
  if (longtmpFile == 3){
    
    tmpTree0 <- tnt2nexus(tmpFile[2])
    return(tmpTree0)
    
  }else{
    
     finalTree <- list()
    
     ## read all trees
    
     for (i in 1:(longtmpFile-2)){
       finalTree[[i]] <- tnt2nexus(tmpFile[(i+1)])
     }
    
  }
  
  ## change object class to multiphylo
  
  class(finalTree) <- "multiPhylo"
  
  return(finalTree)
  
}
