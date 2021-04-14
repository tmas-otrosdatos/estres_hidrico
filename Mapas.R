#Mapa de estres hidrico
title = "Colima y el agua"
subt = "Mapa de Estrés Hídrico"
capt = "Fuente: WRI Aqueduct 2019"
gg<-df %>%
  ggplot()+
  geom_sf(aes(fill=score_estres), colour = NA)+
  labs(title=title,subtitle = subt, caption = capt)+
  scale_fill_viridis_c(option = "inferno", direction=-1,alpha = 0.8, name = "Nivel de estrés",
                       breaks = c(0.9,1.9,2.9,3.1,4.5),
                       labels = c("Bajo","Bajo Medio","Medio Alto","Alto", "Extremo Alto"),
                       guide = guide_legend(
                         direction = 'horizontal',
                         title.position = 'top',
                         title.hjust = .5,
                         label.hjust = .5,
                         label.position = 'bottom',
                         keywidth = 3,
                         keyheight = .5
                       ))+
  theme_void()+
  theme(title=element_text(face='bold'),
        legend.position = 'bottom')

gg

#mapa de riesgo de sequia
subt2 = "Mapa de Riesgo de Sequia en México"
capt = "Fuente: WRI Aqueduct 2019"
gg2<-df %>%
  ggplot()+
  geom_sf(aes(fill=score_ddr), colour=NA)+
  labs(title=title, subtitle = subt2, caption = capt)+
  scale_fill_viridis_c(option = "inferno", direction=-1,alpha = 0.8, name = "Riesgo",
                       breaks = c(0.2,0.4,0.59,0.7),
                       labels = c("Bajo","Bajo-Medio","Medio", "Medio-Alto"),
                       guide = guide_legend(
                         direction = 'horizontal',
                         title.position = 'top',
                         title.hjust = .5,
                         label.hjust = .5,
                         label.position = 'bottom',
                         keywidth = 3,
                         keyheight = .5
                       ))+
  theme_void()+
  theme(title=element_text(face='bold'),
        legend.position = 'bottom')
  
gg2

colima<-df %>% 
  filter(CVE_ENT==06)+
  ggplot()+
  geom_sf(aes(fill='purple'))


theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank(),
      panel.background = element_blank(),axis.title.x=element_blank(),
      axis.text.x=element_blank(),
      axis.ticks.x=element_blank(),axis.ticks.y=element_blank(),
      axis.text.y=element_blank())