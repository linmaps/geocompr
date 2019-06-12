library(sf)
library(raster)
library(spData)
library(spDataLarge)

plot(world)
summary(world["lifeExp"])

# Converting from sf to sp
world_sp <- as(world, Class = "Spatial")
world_sf <- st_as_sf(world_sp, "sf")

plot(world[3:6])
plot(world["pop"])

world_asia <- world[world$continent == "Asia",]
asia <- st_union(world_asia)

plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

plot(world["continent"], reset = FALSE)
cex <- sqrt(world$pop) / 10000
world_cents <- st_centroid(world, of_largest_polygon = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)

india <- world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0, 0.02, 0.01, 1), col = "gray", lwd = 3)
plot(world_asia[0], add = TRUE)

