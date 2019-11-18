http://www.milanor.net/blog/?p=594

airports <- read.csv("http://sourceforge.net/p/openflights/code/HEAD/tree/openflights/data/airports.dat?format=raw", header = FALSE)

head(airports)

colnames(airports) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST")

head(airports)

library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)
points(airports$lon, airports$lat, col = "red", cex = .6)


##### gmap
library(ggmap)
map <- get_map(location = 'Europe', zoom = 4)
#mapPoints <- ggmap(map) +
#  geom_point(aes(x = lon, y = lat, size = sqrt(flights)), data = airports, alpha = .5)

mapPoints <- ggmap(map) +
    geom_point(aes(x = lon, y = lat, data = airports, alpha = .5))
  

mapPointsLegend <- mapPoints +
  scale_area(breaks = sqrt(c(1, 5, 10, 50, 100, 500)), labels = c(1, 5, 10, 50, 100, 500), name = "departing routes")

mapPointsLegend
