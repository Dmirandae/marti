dataMatrix       <- "tnt p tmpPAE.mtr \\; col 2 \\;"
searchCommands   <-  "mult \\;"
close            <-  "nel* \\; taxname = \\; ts* tmpPAE.tre \\; save / \\; quit \\;"
total            <-   
paste(dataMatrix,
      searchCommands,
      close,
      sep=" ")

total
t<- system(total,intern = T, ignore.stdout = T, ignore.stderr = T)
