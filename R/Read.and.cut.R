#'
#'
#'@author L.V. Romero-Alarcon
#'
#'
#'@description
#'
#'Cut specific columns from bash and Read the specific working data.
#'The GBIF data set contains only three columns of interest:
#' 78   =
#' 79   =
#' 220  =
#'
#'
#'
#'
#'
#'
#'




read.and.cut  <-  function(input, cut.col = paste(78,79,220,sep=","), sort.col = c(3,1,2), 
                            header= T, sep= "\t",na.strings= NA, delete.na.in.sp= T) {
  
  system <- Sys.info() [ "sysname" ]
  
  if( system == "Windows" ) { 
    
    stop ( "Your OS is Windows, you should install bash shell on Windows and 
           be sure you have Rversion 3.1.2 or up." )
  
    } else {
      
      if( system == "Linux" ) {
        
        print("Your OS is Linux. Please, be sure you have Rversion 3.1.2 or up." ) 
      
      } else { print( "Your OS is iOS (or something alike). 
                      Please, be sure you have Rversion 3.1.2 or up." ) }
    
      
      temp.tab <- read.table( pipe( paste( "cut -f", cut.col, input, sep=" ") ), 
                               header= header, sep= sep, na.strings= na.strings )
      
      sort.tab <- temp.tab [, sort.col ]
      
      nrow.init.tab <- nrow (temp.tab)
      
      print( paste( "Your initial data set has",nrow.init.tab,"occurrences x 225 columns",
                    sep=" " ))
      
      if ( delete.na.in.sp == T ) {
        
        na<- which( sort.tab$species == "")
          
        if(!length(na)==0) {
          
          sort.tab$species[na]<-NA
          
        }

        sort.tab <- subset( sort.tab,!is.na( sort.tab$species ))
        
        if( nrow( sort.tab ) == 0) {
          
          stop( " >>>>>>>>>>  delete.na.in.sp= T , 
                if you do not select species column and delete.na.in.sp= T, 
                it will generate \"Warning message\". 
                Please, be sure that delete.na.in.sp= F or 
                select species column in cut.col= argument<<<<<<<<<<<<")
          
        }

      }

  
   nrow.sort.tab <- nrow( sort.tab)
  
   print( paste( "Your working data set has",nrow.sort.tab,
                 "occurrences x",length(sort.col), "columns",sep=" " ))
  
  
  
   return ( sort.tab )
      
      
  }
}

