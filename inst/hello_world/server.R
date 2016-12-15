library(shiny)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$randomPlot <- renderPlot({
    # some plotting
  })
})
