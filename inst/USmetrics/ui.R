## ui.R ##
library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(
    sliderInput("inches",
                "Centimeter to Inches",
                min = 1,
                max = 120,
                value = 70 
                ),
    textOutput("cms")
    
  )
)
