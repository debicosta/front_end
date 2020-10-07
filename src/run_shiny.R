run_shiny_front <- function(){
    
options(shiny.host = "0.0.0.0", shiny.port = 8001)
ui <- fluidPage(
  # Add a sidebar layout to the application
  sidebarLayout(
    # Add a sidebar panel around the text and inputs
    sidebarPanel(
      h4("Input parameters for sum"),
      numericInput(inputId = "x", label ="Select first number", value = 5, min = 0, max = 20),
      numericInput(inputId = "y", label ="Select second number", value = 3, min = 0, max = 30)
    ),
    # Add a main panel around the plot and table
    mainPanel(
      textOutput(outputId = "sum")
    )
  )
)

attach(get_api_parameters())
server <- function(input, output, session, external_ip = external_ip, port = port) {
  output$sum <- renderText({
    # GET request from an API
    r <- httr::GET(url= paste0("http://",external_ip,":", port, "/__swagger__/"),
                               path="get_sum",
                               query=list(x=input$x,
                                          y= input$y), verbose()
    )
    fromJSON(content(r, "text"))
  })
}

shinyApp(ui, server)
}
