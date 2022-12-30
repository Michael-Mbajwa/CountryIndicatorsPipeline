ui <- function(request){
  fluidPage(
  titlePanel("One-Stop Dashboard for World Bank Development Indicators"),
  
  fluidRow(
    column(4,
           selectInput(inputId="country",
                       label="Country:",
                       choices=c("All",
                         unique(as.character(ShinyAppData$Country_Name))),
                       selected = "Nigeria")
    ),
    column(4,
           selectInput(inputId="indicator",
                       label="Indicator:",
                       choices=c("All",
                         unique(as.character(ShinyAppData$Indicator_Name))),
                       selected="Adolescent fertility rate (births per 1,000 women ages 15-19)")
    ),
    column(4,
           selectInput(inputId="year",
                       label="Year:",
                       choices=c("All",
                         unique(as.character(ShinyAppData$Year))),
                       selected="2010")
    )
  ),
  
  fluidRow(
      column(width = 4, plotOutput("map_one")),
      column(width = 4, plotOutput("top_n")),
      column(width = 4,  plotOutput("bottom_n")),
  ),
  
  fluidRow(
    column(width = 4,
           selectInput(inputId="country2",
                       label="Country2:",
                       choices=c("All",
                                 unique(as.character(ShinyAppData$Country_Name))),
                       selected = "Afghanistan")),
  ),
  
  fluidRow(
    column(width = 4, plotOutput("map_two")),
    column(width = 8, plotOutput("head_to_head"))
  )
)
}