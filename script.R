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
estresh <- dplyr::select(estresh, c("CVE_ENT", "score"))

#MERGE DATA
df<- raster::merge(shpmx,estresh, id=c(CVE_ENT))

#Map
title = "Mapa de Estres Hídrico de México"
capt = "Fuente: WRI Aqueduct ranking, 2019"
gg<-df %>%
  ggplot()+
  geom_sf(aes(fill=score))+
  labs(title=title, caption = capt)+
  scale_fill_viridis_c(option = "inferno", direction=-1,alpha = 0.8, name = "Nivel de estres",
                       breaks = c(1, 2, 3,4),
                       labels = c("Bajo","Medio","Alto", "Extremo Alto"))+
  theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank(),
        panel.background = element_blank(),axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())

gg
