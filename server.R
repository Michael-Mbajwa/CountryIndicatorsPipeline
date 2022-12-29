server <- function(session, input, output) {
  # filter filter
  dataset_top <- reactive(
    bind_rows(ShinyAppData %>% 
                dplyr::filter(Indicator_Name==input$indicator & Year==input$year)%>%
                dplyr::mutate(dplyr::across(dplyr::starts_with("va"), ~as.numeric(gsub(",", ".", .x)))) %>%
                distinct() %>%
                dplyr::top_n(n=10),
              ShinyAppData %>% 
                dplyr::filter(Indicator_Name==input$indicator & Year==input$year & Country_Name==input$country)%>%
                dplyr::mutate(dplyr::across(dplyr::starts_with("va"), ~as.numeric(gsub(",", ".", .x))))
    ) %>% distinct() %>%
      dplyr::mutate(Color=ifelse(Country_Name==input$country, "red", "#0b6623"))
    )
  
  
  dataset_bottom <- reactive(
    bind_rows(ShinyAppData %>% 
                dplyr::filter(Indicator_Name==input$indicator & Year==input$year)%>%
                dplyr::mutate(dplyr::across(dplyr::starts_with("va"), ~as.numeric(gsub(",", ".", .x)))) %>%
                distinct() %>%
                dplyr::top_n(n=-10),
              ShinyAppData %>% 
                dplyr::filter(Indicator_Name==input$indicator & Year==input$year & Country_Name==input$country)%>%
                dplyr::mutate(dplyr::across(dplyr::starts_with("va"), ~as.numeric(gsub(",", ".", .x))))
    ) %>% distinct()%>%
      dplyr::mutate(Color=ifelse(Country_Name==input$country, "red", "#0b6623"))
    )
  
  
  dataset_hh <- reactive(
    ShinyAppData %>%
      dplyr::filter(Indicator_Name==input$indicator & (Country_Name==input$country|Country_Name==input$country2))%>%
      dplyr::mutate(dplyr::across(dplyr::starts_with("va"), ~as.numeric(gsub(",", ".", .x))))%>%
      distinct()
  )
  
  
  output$top_n <- renderPlot({
    ggplot(data=dataset_top(), aes(x=reorder(Country_Name, values), y=values)) + 
      geom_bar(stat="identity", fill=dataset_top()$Color, width = 0.7) +
      theme_minimal() +
      labs(title=paste(input$country, "aganist Top 10 globally in", input$year),
           x = "Country") +
      theme(
        plot.title=element_text(family='', face='bold', size=25),
        axis.title.y = element_blank(),
        axis.text.y = element_text(family='', size=12, color = "black"),
        axis.title.x = element_blank(),
        axis.text.x = element_text(family='', size=12, color = "black"),
        axis.line.y = element_line(colour = "black")
      ) + coord_flip() +
      scale_y_continuous(expand = c(0, 0))
  })
  
  
  output$bottom_n <- renderPlot({
    ggplot(dataset_bottom(), aes(x=reorder(Country_Name, values), y=values)) + 
      geom_bar(stat="identity", fill=dataset_bottom()$Color, width = 0.7) +
      theme_minimal() +
      labs(title=paste(input$country, "aganist Bottom 10 globally in", input$year),
           x = "Country") +
      theme(
        plot.title=element_text(family='', face='bold', size=25),
        axis.title.y = element_blank(),
        axis.text.y = element_text(family='', size=12, color = "black"),
        axis.title.x = element_blank(),
        axis.text.x = element_text(family='', size=12, color = "black"),
        axis.line.y = element_line(colour = "black")
      ) + coord_flip() +
      scale_y_continuous(expand = c(0, 0))
  })
  
  
  output$head_to_head <- renderPlot({
    ggplot(dataset_hh(), aes(x=Year, y=values, group=Country_Name, color=Country_Name))+
      geom_line(size=1.3) +
      labs(x="Year",
           y = input$indicator,
           title = paste("Head-to-Head performance of", input$country, "against", input$country2)) +
      scale_y_continuous(labels=function(n){format(n, scientific = FALSE)}) +
      scale_color_manual(values = c("red", "#0b6623") , name="Country")+
      scale_x_discrete(breaks=c("1960", "1970", "1980", "1990", "2000", "2010", "2020")) +
      theme_classic() +
      theme(
        plot.title=element_text(family='', face='bold', size=25),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_text(family='', size=12, color = "black"),
        axis.text.x = element_text(family='', size=12, color = "black"),
        legend.key.size = unit(3, 'cm'),
        legend.text = element_text(family='', face='bold', size=12),
        legend.title = element_text(family='', face='bold', size=12)
      )
  })
}

