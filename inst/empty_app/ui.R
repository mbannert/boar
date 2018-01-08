## ui.R ##
library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Empty App"),
  dashboardSidebar(),
  dashboardBody(
    fluidPage(
      fluidRow(
        box(title = "Configuration",
            sliderInput("nobs",
                        "Number of Observations",
                        min = 100,
                        max = 10000,
                        value = 500),
            sliderInput("mean_in","Mean",
                        min = 0,
                        max = 10,
                        value = 0),
            sliderInput("sd_in","SD",
                        min = 1,
                        max = 5,
                        value = 1),
            width = 4),
        box(title = "Distribution",
            plotOutput("dist"),
            width = 8)
      ),
      fluidRow(
        box("Tabelle",
            dataTableOutput("tab"),
            width=12
            )
      )
    )
    
  )
)
