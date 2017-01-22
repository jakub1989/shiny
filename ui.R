library(markdown)
library(shiny)
library(ggplot2)

navbarPage("Main menu: ",
    tabPanel("Var summary",
        headerPanel("Variables summary"),
        p("Please select variable name form dropdown list to see accurate summary of it."),
            sidebarLayout(
                sidebarPanel(
                    selectInput("variable", "Select variable :",
                        list("length" = "length", 
                            "cfin1" = "cfin1", 
                            "cfin2" = "cfin2",
                            "chel1" = "chel1",          
                            "chel2" = "chel2", 
                            "lcop1" = "lcop1",
                            "lcop2" = "lcop2",                      
                            "fbar" = "fbar", 
                            "recr" = "recr",
                            "cumf" = "cumf",
                            "totaln" = "totaln",
                            "sst" = "sst",
                            "sal" = "sal",  
                            "xmonth" = "xmonth",
                            "nao" = "nao"
                        ))
                ),
                mainPanel(
                    dataTableOutput("summary"),
                    h3("Histogram"),
                    plotOutput("histogram")

                )
            )
    ),
    tabPanel("Herrings length",
    p("Chart of changing lenght of herrings accross past 60 yers"),
        plotOutput("plot1")

    )

  
)