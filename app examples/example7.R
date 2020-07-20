# An example with a datatable and observeEvent()
library(shiny)


data <- data.frame(datasets::ChickWeight)

ui <- fluidPage(
    titlePanel("DataTables and observeEvent()"),
    sidebarLayout(
      sidebarPanel(
        numericInput("numRows", "Number of Rows", value=10),
        checkboxGroupInput("dietType", 
                           "Diet Type", 
                           choiceNames=list("Diet 1", "Diet 2", "Diet 3","Diet 4"), 
                           choiceValues=list(1, 2, 3,4),
                           selected=list(1, 2, 3, 4)),
        actionButton("reset", "Reset")
      ),
      mainPanel(
        DT::dataTableOutput("table")
      )
    )
)

server <- function(input, output, session) {
  observeEvent(input$reset, {
    updateNumericInput(session, "numRows", value = 10)
    updateCheckboxGroupInput(session, "dietType", selected=list(1, 2, 3, 4))
    message("user pressed reset") # observeEvent can also be used for debugging
    message(input$dietType)
    }
  )
  
  output$table <- DT::renderDataTable(subset(data,Diet %in% input$dietType),
    options = list(
      pageLength = input$numRows
    )
  )
}

shinyApp(ui, server)