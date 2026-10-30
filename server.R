# Define server logic required to draw a chart

data(mtcars)
library(dplyr)
library(ggplot2)
library(shinyhelper)

# Key value pairs used to map the options in the dropdown UI to the actual features of the mtcars dataset
key<-c("Miles/(US) gallon","Number of cylinders","Displacement (cu.in.)","Gross horsepower","Weight (1000 lbs)");
value<-c("mpg","cyl","disp","hp","wt");




server <- function(input, output) {
  
    #Plot rendering
    output$distPlot <- renderPlot({
      actualDep <- value[which(key == input$dep)]
      actualInDep <- value[which(key == input$ind)]
      mtcars_eng <- mtcars %>%
        filter(vs == if(input$eng=='v-shaped') 0 else 1)
      #select by transmission
      mtcars_trx <- mtcars_eng %>%
        filter(am == if(input$trx=='automatic') 0 else 1)
      ggplot(mtcars_trx, aes(x = !!sym(actualInDep), y = !!sym(actualDep))) +
        geom_point() +
        geom_smooth(formula = y ~ x, method = "lm") + xlab(input$ind) + ylab(input$dep)
  })
  

}