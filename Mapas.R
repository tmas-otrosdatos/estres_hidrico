#Map
title = "Mapa de Estrés Hídrico de México"
capt = "Fuente: WRI Aqueduct 2019"
gg<-df %>%
  ggplot()+
  geom_sf(aes(fill=cat_estres))+
  labs(title=title, caption = capt)+
  scale_fill_viridis_c(option = "inferno", direction=-1,alpha = 0.8, name = "Nivel de estrés",
                       breaks = c(1,2,3,4),
                       labels = c("Bajo","Medio","Alto", "Extremo Alto"))+
  theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank(),
        panel.background = element_blank(),axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),axis.ticks.y=element_blank(),
        axis.text.y=element_blank())

gg

title2 = "Mapa de Riesgo de Sequia en México"
capt = "Fuente: WRI Aqueduct 2019"
gg2<-df %>%
  ggplot()+
  geom_sf(aes(fill=cat_ddr))+
  labs(title=title2, caption = capt)+
  scale_fill_viridis_c(option = "inferno", direction=-1,alpha = 0.8, name = "Riesgo",
                       breaks = c(0,1,2,3),
                       labels = c("Bajo","Bajo-Medio","Medio", "Medio-Alto"))+
  theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank(),
        panel.background = element_blank(),axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),axis.ticks.y=element_blank(),
        axis.text.y=element_blank())

gg2
