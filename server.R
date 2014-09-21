library(shiny)
library(reshape)
library(googleVis)

chronic <- read.csv("chronic.csv")
molten.chronic <- melt(chronic, 
            id = c("Disease","Fiscal.Year","Gender","Age.Group"), na.rm = T)


shinyServer(
  function(input, output) {
    
    chronic.r <- reactive({
      a <- subset(molten.chronic,
                  Gender %in% input$gender )
      a <- droplevels(a)
      a <- cast(a, Disease + Fiscal.Year ~ variable, c(mean,sd))
    
      return(a)
    })
      

    output$view <- renderGvis({
      gvisMotionChart(chronic.r(),
                      "Disease",
                      timevar="Fiscal.Year",
                      xvar="Physician.Visit.with.Disease..Person.Count",
                      yvar="Hospitalization.with.Disease..Days.Stay",
                      date.format="%Y")
    })
    
    
  } 
)
