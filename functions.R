library(CountryIndicatorsPkg)
library(rnaturalearth)
library(rnaturalearthdata)
library(maps)
library(ggplot2)
library(tidyverse)



make_plot_countries <- function(all_data_countries){
  
  world <- ne_countries(scale = "medium", returnclass = "sf")
  
  world_modified <- world %>% 
    mutate(my_selection = ifelse(admin %in% all_data_countries,
                                 1, NA))
  
  
  ggplot(data = world_modified) +
    geom_sf(aes(fill=my_selection)) +
    theme_void() +
    theme(legend.position = "none")
}



map_country <- function(all_country_details){
  country_details <- all_country_details %>% pivot_wider(names_from = Columns, values_from = Values)
  country <- country_details$Country_Name
  
  currency <- paste("Currency:", country_details$Currency_Unit)
  region <- paste("Region:", country_details$Region)
  income_grp <- paste("Income Group:", country_details$Income_Group)
  head_state <- paste("Head of State:", country_details$Head_of_state)
  head_gov <- paste("Head of State:", country_details$Head_of_government)
  
  sup_title <- paste(currency, region, income_grp, head_state, head_gov, sep="\n")
  
  ## Let's define our custom theme for the final map 
  map_country_theme <- theme_bw() +
    theme(panel.background = element_rect(fill = '#4e91d2'),
          legend.position = 'none',
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(color = "black", size = 12, face = "bold"),
          plot.subtitle = element_text(color = "blue", face = "italic"))
  
  ## make a df with only the country to overlap
  map_data_country <- map_data('world')[map_data('world')$region == country,]
  
  # get coordinates
  x_min <- min(map_data_country$long)
  x_max <- max(map_data_country$long)
  
  y_min <- min(map_data_country$lat)
  y_max <- max(map_data_country$lat)
  
  x_limits <- c(x_min-5, x_max+5)
  y_limits <- c(y_min, y_max)
  
  ## The map (maps + ggplot2 )
  ggplot() +
    ## First layer: worldwide map
    geom_polygon(data = map_data("world"),
                 aes(x=long, y=lat, group = group),
                 color = '#9c9c9c', fill = '#f3f3f3') +
    ## Second layer: Country map
    geom_polygon(data = map_data_country,
                 aes(x=long, y=lat, group = group),
                 color = '#4d696e', fill = '#8caeb4') +
    coord_map() +
    coord_fixed(1.3,
                xlim = x_limits,
                ylim = y_limits) +
    ggtitle(label=paste0("A map of ", stringr::str_to_upper(country)),
            subtitle = sup_title) +
    scale_x_continuous(n.breaks = 20) +
    scale_y_continuous(n.breaks = 20) +
    map_country_theme
}


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

