library(tidyverse)
library(maps)
library(rgdal)
library(sf)  
library(raster)

#SHAPE DATA
shpmx<- st_read("./data/00ent.shp")
st_geometry(shpmx)
head(shpmx)

#ESTRES HIDRICO DATA
library(readr)
estresh <- read_csv("data/estres_h.csv")
estresh <- dplyr::select(estresh, c("CVE_ENT", "score_estres","cat_estres","score_ddr","cat_ddr"))
#create breaks for ddr
estresh$catnew_ddr <- cut(estresh$score_ddr, breaks=c(0.15,0.45,0.54,1, Inf),
                          labels(c("Bajo","Bajo-Medio","Medio", "Medio-Alto")))

estresh$catnew_ddr <- cut(estresh$score_ddr, breaks=c(0.15,0.45,0.54,1))

#MERGE DATA
df<- raster::merge(shpmx,estresh, id=c(CVE_ENT))


