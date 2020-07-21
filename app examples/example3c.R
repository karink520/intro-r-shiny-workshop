library(shiny)

ui <- navbarPage(
  "A navbarPage",
  tabPanel(
    "Plot",
    sidebarPanel("The first tab panel of this page has a sidebarPanel and mainPanel within it!"),
    mainPanel(
      "Main",
      img(src="neuron.svg"),
      p("Image credit: https://upload.wikimedia.org/wikipedia/commons/a/a9/Complete_neuron_cell_diagram_en.svg")
    )
  ),
  tabPanel(
    "Information",
    p("This navbarPage has within it tabPanels and a navbarMenu (containing more tabPanels). Each tabPanel can have some content.")
  ),
  tabPanel("Map"),
  navbarMenu("More",
       tabPanel(
         "Contact Us",
         p("Here's our contact info")
      ),
       tabPanel("Join our team!")
  )
  
)

server <- function(input, output) {
  # Specify the code the server needs to run, e.g. to draw plots and process data
}

shinyApp(ui = ui, server = server)