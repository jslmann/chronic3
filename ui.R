library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Canadian Chronic Disease Relationships"), 
    sidebarPanel(
      checkboxGroupInput("gender", "Gender:",
                         c("Male" = "M",
                           "Female" = "F"),
                         selected = c("M","F"))
    ),   
    mainPanel(
      tabsetPanel(
        tabPanel("Chart",h4("Chronic Disease Chart"),htmlOutput("view")),
        tabPanel("Data Description",
                 p("A complete description of the variables can be found in the
the document: Contents of the Canadian Chronic Disease Surveillance System (CCDSS) 
Aggregate Datasets by Disease - ENGLISH."),
                 a("http://www.phac-aspc.gc.ca/data-donnees/hpcdp-pspmc/index-eng.php")
        ),
        tabPanel("Usage",
                 p("While most of the functionality of the chart comes from the 
                   motion chart, one can also filter the dataset by gender using 
                   the left-hand panel. Not choosing any gender will produce an 
                   empty chart."),
                 p("The motion chart has a lot of functionality."),
                 p("Both x and y axis
                   variables have many options that can be chosen by clicking on the
                   respective labels."),
                 p("The year can be chosen either with the slider, or it can be 
                   animated with the 'play' button on the left hand side"),
                 p("On the upper right hand side there are tabs to choose a histogram,
                   or a line plot")
        )
            
      )
      
    )
    
  )
)


