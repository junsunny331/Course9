shinyUI(fluidPage(
  titlePanel("Predict Average Miles Per Gallon with different scenarios"),
  sidebarLayout(
    sidebarPanel(
      numericInput('weight', 'Weight Change', 1.5,
                   min = 1, max = 6,step=0.5),
      
      numericInput('qsec', '1/4 Mile Time Change', 15,
                   min = 14, max = 23,step=1),
      
      numericInput('am', 'Transmission Change', 1,
                   min = 0, max = 1,step=1)
      
    ),
    mainPanel(
      h2("This shiny app enables user to change different model predictor values, and output the corresponding predicted average MPG after change"),
      h3("Predicted Average MPG with Default Parameters"),
      h4("Before change:"),
      textOutput("before1"),

      h3("Predicted Average MPG with New Parameters"),
      h4("After change:"),
      textOutput("after1")

    )
    
  )

))