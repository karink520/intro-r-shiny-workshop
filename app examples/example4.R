library(shiny)

ui <- fluidPage(
  titlePanel("An adjustable plot!"),
  
  sidebarLayout(position="right",
                sidebarPanel(
                  h3("Adjust the parameters for the plot"),
                  sliderInput(
                      inputId="meanOfGaussian",
                      "Mean of the distribution:",
                       min = -3,
                       max = 3,
                       value = 0,
                       step = 0.5
                  ),
                  numericInput(
                    inputId='numberOfBins',
                    "Number of Bins",
                    value=5,
                    min=2,
                    max=100
                  )   
                ),
                mainPanel(
                   plotOutput(outputId="histogramOfGaussian")
                )
  )
)

server <- function(input, output, session) {
  output$histogramOfGaussian <- renderPlot({
      hist(rnorm(100) + input$meanOfGaussian,
           main="Histogram of Samples from a Gaussian",
           xlim=c(-6,6),
           breaks=input$numberOfBins,
           xlab = paste("Mean = ",input$meanOfGaussian, sep = "")
          )
  })
}

shinyApp(ui = ui, server = server)