library(shiny)
library(ggplot2)

# Define server logic for random distribution application
shinyServer(function(input, output) {
library(readr)
herrings <- read_csv("C:/Users/Jacob/Desktop/Raport/sledzie.csv", col_names = TRUE, na = c("?", "NA"))

herringsReplaceByMean <- herrings
columnMean <- colMeans(herringsReplaceByMean, na.rm=TRUE)
index <- which(is.na(herringsReplaceByMean), arr.ind=TRUE)
herringsReplaceByMean[index] <- columnMean[index[,2]]

output$summary <- renderDataTable({
    summary(herringsReplaceByMean[input$variable])
})

output$histogram <- renderPlot({
    qplot(herringsReplaceByMean[input$variable],
      geom="histogram",
      xlab = input$variable)
})

output$plot1 <- renderPlot({
    ggplot(herringsReplaceByMean, aes(X1, length)) + geom_point() + geom_smooth(se=TRUE) + ggtitle("Herrings length") + labs(x="dataset of 52584 surveys (past 60 years)", y="Herrings length in cm")
})



})