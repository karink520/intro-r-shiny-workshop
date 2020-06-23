## Layout and panel functions
function | 
----------|--|
sidebarLayout | 
splitLayout |
verticalLayout |
flowLayout |
navbarPage |
navbarMenu |
fluidPage |
fluidRow | 
column | 
tabsetPanel |
tabPanel |
navlistPanel |
titlePanel |
sidebarPanel |
headerPanel | 
conditionalPanel |
mainPanel |
wellPanel |
fixedPage |
fixedRow |



## Widgets and *Input functions

|function |	widget|
|----------|---------|
actionButton | Action Button
checkboxGroupInput |	A group of check boxes
checkboxInput | A single check box
dateInput	| A calendar to aid date selection
dateRangeInput	|A pair of calendars for selecting a date range
fileInput | A file upload control wizard
helpText	| Help text that can be added to an input form
numericInput	| A field to enter numbers
radioButtons	| A set of radio buttons
selectInput | A box with choices to select from
sliderInput | A slider bar
submitButton	| A submit button
textInput	|A field to enter text

## Output Functions

| Output function |	Creates|
|-----------------|--------|
dataTableOutput |	DataTable
htmlOutput |	raw HTML
imageOutput	| image
plotOutput |	plot
tableOutput |	table
textOutput |	text
uiOutput	| raw HTML
verbatimTextOutput |	text

## Render Functions

Render function| Creates
|-----------------|--------|
renderDataTable	| DataTable
renderImage	| images (saved as a link to a source file)
renderPlot |	plots
renderPrint	| any printed output
renderTable	| data frame, matrix, other table like structures
renderText |	character strings
renderUI | a Shiny tag object or HTML

## Important functions for controlling reactivity

Funtion | Description/ details
--------|-----
reactive | Wraps a normal expression to create a reactive expression
isolate | Executes the given expression in a scope where reactive values or expression can be read, but they cannot cause the reactive scope of the caller to be re-evaluated when they change. 
observeEvent | Respond to "event-like" reactive inputs, values, and expressions.
eventReactive |  Respond to "event-like" reactive inputs, values, and expressions.
reactiveValues | Returns an object for storing reactive values. It is similar to a list, but with special capabilities for reactive programming. When you read a value from it, the calling reactive expression takes a reactive dependency on that value, and when you write to it, it notifies any reactive functions that depend on that value.
observe | Creates an observer from the given expression. An observer is like a reactive expression in that it can read reactive values and call reactive expressions, and will automatically re-execute when those dependencies change. But unlike reactive expressions, it doesn't yield a result and can't be used as an input to other reactive expressions. Thus, observers are only useful for their side effects (for example, performing I/O).

# Acknowledgement and further reading

Selected functions and descriptions are from the R Shiny documentation and complete [function reference](https://shiny.rstudio.com/reference/shiny/1.4.0/).