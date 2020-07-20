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
      textInput(inputId="title", label="", value="Normal Samples"),
      actionButton(inputId="updateButton", label="Update plot title")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", 
                 plotOutput(outputId="scatterPlot",
                            height=400)
        ),
        tabPanel("Hints",
        )
      )
    )
  )
)

server <- function(input, output, session) {
  
  # Maybe we don't want to resample the x and y values every time the color changes. 
  # There isn't a reactive value in input corresponding to the samples
  # So we create a reactive expression to keep track of them
  
  #x_vals <- reactive({rnorm(input$numSamples)})
  #y_vals <- reactive({rnorm(input$numSamples)})
  
  samples <- reactive({list(x_vals = rnorm(input$numSamples),
                            y_vals = rnorm(input$numSamples))})
  
  title_text <- eventReactive(input$updateButton, {input$title}, ignoreNULL=FALSE)
  
  output$scatterPlot <- renderPlot(
    plot(
      #x_vals(),
      #y_vals(),
      samples()$x_vals,
      samples()$y_vals,
      main = title_text(),
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