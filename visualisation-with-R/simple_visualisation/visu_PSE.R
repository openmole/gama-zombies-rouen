library(shiny)
library(plotly)
library(maptools)
library(scales)
library(RColorBrewer)
library(dplyr)
library(RCurl)



#pour choper directement le fichier résultat le plus récent
#x <- getURL("https://raw.githubusercontent.com/openmole/gama-zombies-rouen/master/PSE_results/population19727.csv")
#dfpse <- read.csv(text = x)


dfpse <- read.csv("../../PSE_results/population33033.csv",header = T)%>% 
          filter(evolution.samples>30)

# noms des dimensions à afficher dans le nuage de points 3D 
dim_of_interest <- c("infection_distance", "max_infection_ratio",  "max_size")

# label des points min et max des colonnes ci dessus 
p3d<- plot_ly(dfpse, x = ~max_infection_ratio, y = ~max_size, 
              color=~proba_infection,
              mode="markers",
              type="scatter",
              hoverinfo="text",
              text = ~paste("", 'distInf:', round(infection_distance, digits = 3), 
                            '</br>max_infection_ratio:', round(max_infection_ratio, digits = 3),
                            '</br> max_size:', max_size),
              marker = list(size = 7, 
                            opacity=0.5, 
                            line = list(width = 0.1, color="gray25") ))

p3d


names(dfpse)

#tendances 2 à 2 

plot(dfpse[,2:10])
