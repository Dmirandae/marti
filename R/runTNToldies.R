####
####
#### running TNT
####
####



dataMatrix       <- "tmpPAE.mtr"



#cat(total, file="pae.sh",append=F)

#cat(total, file = "tmpPAE.run", append = T)

#t<-      system("chmod +x pae.sh")
# system("sh ./pae.sh")
#  system2('sh',args = "./pae.sh")
# pipe("tnt")



y <- system(total,ignore.stdout = F, ignore.stderr = F,wait = T)

if (y == 1){warning( "Unable to complete TNT run, please run tmpPAE.mtr yoursel." )}


## 2015 - 01 - 09 22:50 so far so good



##
## recovwering the tree
##
