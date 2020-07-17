library(shiny)

ui <- fluidPage(
  # Determine appearance and layout of the app
  titlePanel("Hello Shiny!"),
  
  sidebarLayout(position="right",
    sidebarPanel(
      h3("sidebar"), # You can access some of shiny's HTML builder functions with the name of the HTML tag
      p("some sidebar text")
    ),
    mainPanel(
      tags$h1("main"), # You can access some of shiny's HTML builder functions from the named elements in tags
      p("Back to the", a("course webpage", href="https://karink520.github.io/intro-r-shiny-workshop/"))
    ),
  )
)

server <- function(input, output) {
  # Specify the code the server needs to run, e.g. to draw plots and process data
}

shinyApp(ui = ui, server = server)

