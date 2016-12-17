library(shiny)
source("../../R/inchToCM.R")
shinyServer(function(input,output){
  output$cms <- renderText(
    inchToCm(input$inches)
  )
})
