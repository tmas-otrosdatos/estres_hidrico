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

#MERGE DATA
df<- raster::merge(shpmx,estresh, id=c(CVE_ENT))

