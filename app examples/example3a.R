library(shiny)

ui <- fluidPage(
  # Determine appearance and layout of the app
  titlePanel("Hello Shiny!"),
  
  sidebarLayout(position="left",
                sidebarPanel(
                  h3("sidebar"), # You can access some of shiny's HTML builder functions with the name of the HTML tag
                  p("some sidebar text"),
                  wellPanel(
                    "This is a wellPanel, inside the sidebar"
                  )
                ),
                mainPanel(
                  tabsetPanel(
                    tabPanel(
                      "Plot", 
                      h2("We could put a plot here")
                    ), 
                    tabPanel(
                      "Summary",
                      h2("To summarize..."),
                      tags$ol(tags$li("point 1"), tags$li("point2"))
                    ), 
                    tabPanel(
                      "Table",
                      h2("We'll put a table here!")
                      )
                  )
                ),
  )
  
  
)

server <- function(input, output) {
  # Specify the code the server needs to run, e.g. to draw plots and process data
}

shinyApp(ui = ui, server = server)
