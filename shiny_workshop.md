## Pre-workshop / as arriving

Explore some examples of Shiny apps at: https://shiny.rstudio.com/gallery/

## R Shiny: What? Why?

"Shiny makes it incredibly easy to build interactive web applications with R. Automatic "reactive" binding between inputs and outputs and extensive prebuilt widgets make it possible to build beautiful, responsive, and powerful applications with minimal effort." &mdash; from the Shiny documentation

You can use these apps in many ways, including to share research and increase its impact and accessibility, to explore data yourself, and as a teaching tool.

Today we will learn to make a simple app, will cover some key functions from the Shiny library, and will explore the concept of reactivity in R Shiny; understanding reactivity will allow you to create and control the kind of interactive experience your app enables.

Some examples:

https://shiny.rstudio.com/gallery/mri-images.html

https://shiny.rstudio.com/gallery/nutrition-calculator.html

https://shiny.rstudio.com/gallery/nz-trade-dash.html

## Install the R shiny package

`install.packages("shiny")`

## Structure of a Shiny App (server and ui)

```
library(shiny)

ui <- ... # Determine appearance and layout of the app

server <- ... # Specify the code the server needs to run, e.g. to draw plots and process data

shinyApp(ui = ui, server = server)

```

We'll use the `ui` object to create the appearance information that goes to the browser - layout, html elements, widgets to display, placement of plots and tables.

We'll use the `server` object to specify the work the server needs to do to make the app run, processing the data, doing calculations, and building plots and tables.

## A basic template and empty app:

```
library(shiny)

ui <- fluidPage(
    # Determine appearance and layout of the app
)

server <- function(input, output) {
    # Specify the code the server needs to run, e.g. to draw plots and process data
}

shinyApp(ui = ui, server = server)

```
If you run this app and view in a browser, you can see that R has created html for the page. You can also see that it is using the Twitter Bootstrap framework for the interface.

## Layout, panels, and html

Example #1 - `titlePanel`, `SidebarLayout` with `sidebarPanel` and `mainPanel` (and `position` parameter)

Example #2 - Create html with the R Shiny functions `h1`, `h2`, etc., and the `tags` named list:`tags$h1`, `tags$h2`, `tags$a(href="www.rstudio.com", "R studio site")`,  etc. (See full [tag glossary](https://shiny.rstudio.com/articles/tag-glossary.html)).

There are other functions for making panels in your page, and they are worth experimenting with. See all UI Layout functions in the Shiny [function reference](https://shiny.rstudio.com/reference/shiny/1.4.0/).

Example #3a - `wellPanel`, `tabsetPanel`, `tabPanel` (note that the `tabsetPanel` has the `tabPanels` within it).

You can also change the whole structure of your page by switching from `fluidPage` to `navbarPage`. A `navbarPage` has several `tabPanels` inside it, each of which has a title that goes at the top of the screen, and its own content (including panels within each tabPanel, if you like).

Example #3b - `navbarPage` instead of `fluidPage`, with `tabPanel`s and a `navbarMenu` within the `navbarPage`. Each `tabPanel` can have its own content and panels within it. This example also includes an image (Note: if using an image src that is not external, put the image in a folder called `www` within your app folder. The precise name `www` is important. Shiny will share files in `www` with the user's browser.)

More on layouts <a href='https://shiny.rstudio.com/articles/layout-guide.html'> here </a>.

## Widgits or *Input functions and *Outputs; introduction to creating reactivity and connecting inputs and outputs with *render expressions

Example #4 - First, we add `*Inputs` (widgets) and `*Outputs` to UI, each of which gets an id. These inputs and outputs will be passed to the server function in input and output lists, so you can access them within the server function using their ids to access them from the input and output named lists (e.g. as `input$myInputId` and `output$myOutputId`). We can use these input and output variables tell server what to do and how to connect inputs and outputs with `render*` functions. The `render*` functions set up reactivity so that **when any one of the inputs that the render function relies on changes, the output and display will change as well**.  

### Widgets/`*Input` functions

|Function |	Widget|
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

### Output Functions

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

See input and output options in the Shiny [function reference](https://shiny.rstudio.com/reference/shiny/1.4.0/).

View widget options in an app in this [widget gallery app](https://shiny.rstudio.com/gallery/widget-gallery.html).

## You try (exercises):

1. Edit the app in example 4 by adding another slider that works to control the number of samples drawn each time (so that we can adjust and not just draw 100 samples each time we draw the graph). (A solution is shown in `example4-updated.R`, but you should work to complete this exercise yourself before you look at it.)

2. Using the `textInput` function, allow the user to set the title of the graph with their own text. (Ideally, there will still be a default title in place before the user has typed anything).

3. Try making from scratch a Shiny app that looks and works like the example [here](https://karinknudson.shinyapps.io/example5_apptomatch/). You *can* look at the code in `example5_apptomatch/app.R` if you are really stuck, but you will learn best if you struggle with the process some yourself, so don't shortchange yourself by cutting short that struggle too early!

4. If you have extra time, use it to experiment with by using and connecting other `*Input` and `*Output` functions

## Questions, comments, break

------

## Understanding and controlling reactivity

 **Reactive values** change in response to inputs. Previously, we used `*Input` functions to create reactive values that went into a named list that we called `input`. We use reactive values inside reactive functions, such as `renderPlot`, `renderDataTable`, and more.
The reactive function outputs an **observer**.  Reactive values notify downstream objects that they've changed, and the object created by the reactive function responds. Thus, a `render*` function "knows" to rerun its code when the reactive value(s) it depends on changes.
 When a reactive value changes, it notifies downstream items that it's no longer valid; we call this process "invalidating."

In addition to `renderPlot`, which we saw in previous examples, there are other `render*` functions that make different objects to display. All of these `render*` functions get a block of code as an argument, contained in curly braces. Whenever any reactive value that appears in the `render*` function is invalidated (i.e. changes), the whole code block will be rerun.

Example 6 - renderDataTable, renderUI

`reactive()` builds a reactive expression using a code block that you pass it as a parameter. We call reactive values like a function (i.e. with parentheses). A reactive expression stores its value in memory, and only reruns its code if it is invalid.

`*Input` funtions create reactive values, but perhaps we want to have and use some reactive quantity that's not exactly what an *Input function gives us. We may want to use `reactive()`.

`observe()` takes a single block of code, and reruns itswelf whenever any reactive value in the code changes (like a render function, but without creating returning something to display).

`isolate()` creates a non-reactive value.

What if we want to use a reactive-value to create something that is non-reactive? We can use isolate, which takes a block of code as input. The block of code could include reactive values, but when they change the result of isolate() will not. So, for example, you could wrap something inside a render* function in isolate, and then the render* function wouldn't rerun if something changed that *only* appreared wihin the isolate statement.

observeEvent 

pass observeEvent a reactive value/expression (or list of them), and then a code block. The code block runs only if the value/expression in the list gets invalidated (doesn't rerun in response to any other reactive values it might contain!)

QUESTION: can I pass reavtive expressions to observeEvent and eventReactive, or only reactive values?


eventReactive creates and returns a reactive expression that only responds to the specified reactive values(s). So, its arguments are a reactive value(s) and a block of code. YOu can use these, e.g. to delay reactions.

reactiveValues makes a list of reactive values. Helps you manage state.

slide here of whether you want to run code on the server, create a reactive value, or create something to display

EXAMPLE USING A CSV in data/file.csv.  Note that we could also have our app interact with remote data. When you making and publishing your own apps, you will need to make sure you are sharing data appropriately, and not sharing data that is private.

## You try:
Recreate another example app, or complete a partially made app.

## Deplolying the app on the web

Name your script App.R

With shinyapps.io (includes free and paid options. Paid options allow for more apps, active hours, and support from R Studio)

Other options: 
1. Shiny Server - if you want to host shiny apps yourself on a Linux machine that you have access to
2. RStudio Connect - a paid server program with additional features

## Additional topics

images

custom styling with CSS. Shiny uses the Bootstrap 3 CSS framework.
Use includeCSS("filename.css") and put `filename.css` in your app folder.  (There are several other ways to include CSS, too)
More here: https://shiny.rstudio.com/articles/css.html
HTML and CSS tutorials 
https://www.w3schools.com/html/default.asp
https://www.w3schools.com/css/default.asp

Javascript: https://shiny.rstudio.com/articles/packaging-javascript.html

Fluidrow


## Efficiency notes:

Everything in app.R runs when the app is launched (so you could include one-time data-loading type code, library loades, etc. outside of ui or server).  The server code runs separately for each user, and code inside a render expressions re-runs anytime one of the inputs that appears inside the render expression gets changed.

## Resources

Excellent tutorials and other resources on R Shiny from RStudio's [Learn Shiny](https://shiny.rstudio.com/tutorial/) page

Function reference: https://shiny.rstudio.com/reference/shiny/1.4.0/

NOTE ON WHERE TO PUT DATA FILES?