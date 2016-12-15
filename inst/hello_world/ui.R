library(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("A random normal"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("obs",
                   "Number of obs:",
                   min = 1,
                   max = 1000,
                   value = 100)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("randomPlot")
    )
  )
))
