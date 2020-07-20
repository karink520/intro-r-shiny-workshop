### A Tufts University DISC Workshop

## Description

The Shiny package allows you to use R to quickly and easily create and share a web app that includes interactive data visualizations. In this workshop, participants will learn how to make simple R Shiny web apps that display data visualization that users can interact with and explore, and to deploy these web apps so that they are publicly accessible.

## Goals

<ul>
  <li> Use and expand a basic template to quickly make an interactive R Shiny app that allows a user to explore data</li>
  <li> Know and use common Shiny input and output functions for interactivity </li>
  <li> Understand the concept of reactivity in Shiny, and how to control the propogation of changes from inputs to outputs </li>
  <li> Customize the appearance of a Shiny app</li>
  <li> Share a Shiny app publicly on the internet</li>
</ul>

## Prerequisites

 Experience with R at the beginning level or above, preferably including experience making plots in R. (The TTS TIDAL workshops “A Gentle Introduction to R” and “Data Visualization in R” would be good preparation.)


## Before the workshop

1. [Download](https://cran.case.edu/) and install R, if you do not already have it. (5 min)
2. [Install RStudio Desktop](https://rstudio.com/products/rstudio/download/), (the free open source license suffices). (5 min)
3.  Make a free account at [shinyapps.io](https://www.shinyapps.io/) and follow steps 1 and 2 in the "Getting Started" panel you will see on your dashboard (Step 1 - Install rsconnect, Step 2 - authorize account).  You'll use shinyapp.io to host your app so that you can share it publicly. (5 min)
4. Complete the [pre-course survey](https://docs.google.com/forms/d/e/1FAIpQLSf9sL4Xs8HQ0k--6eeXfc55geJbwQpx04nNmX7Hu9zISCZw3w/viewform?usp=sf_link) (5 min).


## Workshop materials
[Slides](shiny_workshop_slides.pdf)

[Workshop instructions](shiny_workshop.md)

[Abbreviated Shiny function reference](shiny_reference.md) (adapted from Shiny's [function reference](https://shiny.rstudio.com/reference/shiny/1.4.0/))

[Examples](app_examples.zip)



## Topic outline

1. What is a Shiny app and why make one?
2. Making a Shiny app

    a. A basic template

    b. App structure and role of the ui and server objects

    c. Layouts, panels, and appearance

    d. Input and Output functions
    
    e. Basic eactivity and connecting outputs to inputs with render* expressions
3. Practice
4. Understanding  reactivity

    a. Reactive values and functions

    b. Additional control of reactivity with isolate, eventReactive, observeEvent, and more

5. Publishing your app on the web


## Additional Resources

RStudio's [Learn Shiny](https://shiny.rstudio.com/tutorial/) page has excellent tutorials and other learning resources

[Function reference](https://shiny.rstudio.com/reference/shiny/1.4.0/)

A two-page Shiny ["Cheat Sheet"](https://rstudio.com/resources/cheatsheets/)

A thorough introductory book (online version) ["Mastering Shiny](https://mastering-shiny.org/) by Hadley Wikham.

Shiny [function reference](https://shiny.rstudio.com/reference/shiny/1.4.0/)

An excellent book on data visualization more generally is [Fundamentals of Data Visualization](https://www.oreilly.com/library/view/fundamentals-of-data/9781492031079/) by Claus Wilke. The book focuses on principles that are applicable no matter how the visualizations are generated, the code to generate all the example figures is in R using ggplot2.

A data visualization book that also teaches how to create visualizations in R and ggplot2 is Data Visualization: A Practical Introduction, by Kieran Healy.

<br>