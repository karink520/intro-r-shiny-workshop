library(shiny)

ui <- navbarPage(
  "Awesome navbarPage",
  tabPanel("Plot"),
  tabPanel("Information"),
  tabPanel("Map"),
  navbarMenu("More",
      tabPanel("Contact Us")
  )
  
)

server <- function(input, output, session) {
  # Specify the code the server needs to run, e.g. to draw plots and process data
}

shinyApp(ui = ui, server = server)
