library(shiny)
library(httr)
library(jsonlite)
options(scipen=999)



response <- GET("https://api.restful-api.dev/objects")

lista <- content(response)

library(shiny)

# Define a interface do usuário
ui <- fluidPage(
  titlePanel("Exemplo de App Shiny"),
  sidebarLayout(
    sidebarPanel(
      h3("Conteúdos da Lista")
    ),
    mainPanel(
      uiOutput("lista")
    )
  )
)

# Definindo a lógica do servidor
server <- function(input, output) {
  output$lista <- renderUI({
    tagList(lapply(lista, function(item) {
      h4(item)  # Exibe cada item como um título
    }))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
