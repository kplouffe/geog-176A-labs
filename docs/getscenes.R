sat = getlandsat::lsat_scenes()

bb2 = bb %>%
  st_transform(4326) %>%
  st_bbox()

newsat = sat %>%
  filter(min_lat <= bb2$ymin, max_lat >= bb2$ymax,
         min_lon <= bb2$xmin, max_lon >= bb2$xmax, as.Date(acquisitionDate) == as.Date("2016-09-26"))

write.csv(newsat, file = "data/palo-flood-scene.csv", row.names = FALSE)

st = sapply(files, lsat_image)
