
library(shiny)
source(file="ui.R")
source(file="server.R")

# Run the application 
shinyApp(ui = ui, server = server)
