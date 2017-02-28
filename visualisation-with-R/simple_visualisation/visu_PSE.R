library(shiny)
library(plotly)
library(maptools)
library(scales)
library(RColorBrewer)
library(dplyr)




dfpse <- read.csv("../../PSE_results/population5415.csv",header = T)
head(dfpse)


# noms des dimensions à afficher dans le nuage de points 3D 
dim_of_interest <- c("infection_distance", "max_infection_ratio",  "max_size")

# label des points min et max des colonnes ci dessus 


p3d<- plot_ly(dfpse, x = ~infection_distance, y = ~max_infection_ratio, z = ~max_size, 
              mode="markers", 
              type="scatter3d",
              hoverinfo="text",
              text = ~paste("", 'distInf:', round(infection_distance, digits = 3), 
                            '</br>max_infection_ratio:', round(max_infection_ratio, digits = 3),
                            '</br> max_size:', max_size),
              marker = list(size = 2, 
                            opacity=0.5, 
                            line = list(width = 0.1, color="gray25") ))

p3d


