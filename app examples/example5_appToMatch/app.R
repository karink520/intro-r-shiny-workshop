library(shiny)

ui <- fluidPage(
  titlePanel("En Example To Match"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId="numSamples",
        "Number of Samples",
        min=0,
        max=500,
        value=30
      ),
      radioButtons(
        inputId="color",
        label = "Color:",
        choiceNames = c("Blue", "Orange", "Green", "Red"),
        choiceValues = c("Blue", "orange", "green", "red")
        ),
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Plot", 
            plotOutput(outputId="scatterPlot",
                       height=400)
          ),
          tabPanel("Hints",
               h3("A few notes:"),
               p("To create the tab structure, you'll use a fluidPage with a titlePanel and then sidebarLayout that has a tabsetPanel within its mainPanel. Within the tabsetPanel are two tabPanels."),
               p("You can use rnorm(numSamples) to separately create the x and the y values in your plot -- they're independent samples."),
               p("To make the color selector, you'll use the radioButtons function, with choiceNames and choiceValues set appropriately."),
               p("Recall that you can set the color of a plot by adding a col parameter, as in plot(x,y,col='blue')")
          )
        )
      )
  )
)

server <- function(input, output) {
    output$scatterPlot <- renderPlot(
        plot(
          rnorm(input$numSamples),
          rnorm(input$numSamples),
          xlim = c(-3,3),
          ylim = c(-3,3),
          col=input$color,
          xlab="x",
          ylab="y",
          pch=19
          )
    )
}

shinyApp(ui = ui, server = server)