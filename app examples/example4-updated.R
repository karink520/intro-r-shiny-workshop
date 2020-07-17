library(shiny)

ui <- fluidPage(
  titlePanel("An adjustable plot!"),
  
  sidebarLayout(position="right",
                sidebarPanel(
                  h3("Adjust the parameters for the plot"),
                  textInput(
                    inputId="title",
                    "Title:",
                    value="Histogram of Samples from a Gaussian"
                  ),
                  sliderInput(
                    inputId="meanOfGaussian",
                    "Mean of the distribution:",
                    min = -3,
                    max = 3,
                    value = 0,
                    step = 0.5
                  ),
                  sliderInput(
                    inputId="numberOfSamples",
                    "Number of Samples:",
                    min = 10,
                    max = 500,
                    value = 100,
                    step = 10
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

server <- function(input, output) {
  output$histogramOfGaussian <- renderPlot({
    hist(rnorm(input$numberOfSamples) + input$meanOfGaussian,
         main=input$title,
         xlim=c(-6,6),
         breaks=input$numberOfBins,
         xlab = paste("Mean = ",input$meanOfGaussian, sep = "")
    )
  })
}

shinyApp(ui = ui, server = server)