library(CountryIndicatorsPkg)
library(rnaturalearth)
library(rnaturalearthdata)
library(maps)
library(ggplot2)
library(tidyverse)


plot_ranked_indicators <- function(df, indicator){
  year <- unique(df$Year)
  
  ggplot(df, aes(x=reorder(Country_Name, values), y=values, fill=Country_Name)) + 
    geom_bar(stat="identity") +
    labs(title = paste("Top Countries with the most", indicator, "in", year),
         x = "Country",
         y = indicator,
         fill = "Country") +
    scale_y_continuous(labels=function(n){format(n, scientific = FALSE)}) +
    theme(axis.text.x = element_text(angle = 45, hjust=1),
          plot.title = element_text(size=10, face="bold"),
          panel.background = element_rect(fill = 'white'),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
}