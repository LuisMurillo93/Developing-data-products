library(shiny)
library(ggplot2)

Diam <- diamonds

ui <- fluidPage(
    
    titlePanel("Diamonds Data set"),
    
    sidebarPanel(
        
        sliderInput("sampleSize", "Sample Size", min=1, max=nrow(Diam),
                    value=min(1000, nrow(Diam)), step=700, round=0),
        
        selectInput('x', 'X', names(Diam)),
        selectInput('y', 'Y', names(Diam), names(Diam)[[2]]),
        selectInput('color', 'Color', c('None', names(Diam))),
        
        checkboxInput('jitter', 'Jitter'),
        checkboxInput('smooth', 'Smooth'),
        
        selectInput('facet_row', 'Facet Row', c(None='.', names(Diam))),
        selectInput('facet_col', 'Facet Column', c(None='.', names(Diam)))
    ),
    
    mainPanel(
        plotOutput('plot')
    )
)
