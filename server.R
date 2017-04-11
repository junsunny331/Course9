library(shiny)
library(datasets)
.libPaths("D:/R/R-3.3.2/library")
library(MASS)
##library(plyr)
##library(tidyr)

#============== DATA PREPARATION ==================================


#model1<-glm(mpg ~.,family=gaussian(link='identity'),data=mtcars)
#step<-stepAIC(model1,direction="both")

model2 <-glm(mpg ~wt+qsec+am,family=gaussian(link='identity'),data=mtcars)

before<-data.frame(wt=1.5,qsec=15,am=1)

before$before1<-round(predict(model2,before,type="response"),digits=0)

#==================================================================


shinyServer(function(input, output) {

  after1 <- reactive({

    After<-data.frame(wt=input$weight,qsec=input$qsec,am=input$am)

    After$P_1<-predict(model2,After,type="response")
    round(After$P_1,digits=0)

  })
 
  # Show the table for before
  output$before1 <- renderText(before$before1)

  # Show the table for after
  output$after1 <- renderText(after1())


})