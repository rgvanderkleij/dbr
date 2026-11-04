library(shiny)

ui <- fluidPage(
  titlePanel("DBR"),
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Your name", value = "DBR")
    ),
    mainPanel(
      tags$div(
        style = "width: 140px; height: 140px; border: 2px solid blue; border-radius: 50%; display: flex; align-items: center; justify-content: center;",
        textOutput("greeting")
      )
    )
  )
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    name <- trimws(input$name)
    if (!nzchar(name)) {
      name <- "world"
    }

    paste0("Hello, ", name, "!")
  })
}

shinyApp(ui = ui, server = server)
