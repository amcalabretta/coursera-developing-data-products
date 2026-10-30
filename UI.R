# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Linear Regressions on MTCars"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("eng", "Engine", choices = c( "v-shaped", "straight")),
      selectInput("trx", "Transmission", choices = c( "automatic", "manual")),
      selectInput("dep", "Value of", choices = c( "Miles/(US) gallon", "Number of cylinders","Displacement (cu.in.)","Gross horsepower","Weight (1000 lbs)")),
      selectInput("ind", "As a function of", choices = c( "Miles/(US) gallon", "Number of cylinders","Displacement (cu.in.)","Gross horsepower","Weight (1000 lbs)")),
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)



