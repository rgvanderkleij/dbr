library(shiny)

# The name is read from a user-created file that is not part of the repo.
# Default location: config.txt in the app directory (override with DBR_CONFIG).
config_path <- Sys.getenv("DBR_CONFIG", "config.txt")

read_name <- function(path) {
  if (!file.exists(path)) {
    stop("Configuration file not found: ", path,
         ". Create it with the name on the first line.", call. = FALSE)
  }
  lines <- readLines(path, n = 1, warn = FALSE)
  if (length(lines) == 0) "" else trimws(lines[1])
}

ui <- fluidPage(
  titlePanel("DBR"),
  mainPanel(
    tags$div(
      style = "width: 140px; height: 140px; border: 2px solid blue; border-radius: 50%; display: flex; align-items: center; justify-content: center;",
      textOutput("greeting")
    )
  )
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    name <- read_name(config_path)
    if (!nzchar(name)) {
      name <- "world"
    }

    paste0("Hello, ", name, "!")
  })
}

shinyApp(ui = ui, server = server)
