library(shiny)



if (!require("rChoiceDialogs")) install.packages("rChoiceDialogs")
library(rChoiceDialogs)
ui <- fluidPage(
  titlePanel("shinyHappy"),
  h4("Uploading Folders or Files with shiny"),
  br(),
  p("Shiny doesn't natively let you select folders; but sometimes your functions operate on folders, not just files. Using tcltk package allows you to select folders or files."),
  br(),
  br(),

  sidebarLayout(
    sidebarPanel(
      h4("Toggles"),
      actionButton("get_folder", "Get Folder"),
      br(),
      actionButton("get_file", "Get File"),
      br(),
      actionButton("clear_console", " Clear Console ")
    ),
    mainPanel(
      h4("Summary"),
      verbatimTextOutput("summary")
      , a("See the Code", target="_blank", href="https://gist.github.com/steventsimpson/80cdbab6f5dc4fcb9b40")

    )
  )
)


server <- function(input, output) {



    observeEvent(input$get_folder, {
      output$summary <- renderPrint({
         path <- {rChoiceDialogs::jchoose.dir()}
        list.files(path)

      })

    })

  observeEvent(input$get_file, {
    output$summary <- renderPrint({
        path <- rChoiceDialogs::jchoose.files(filters = matrix(c("All Files", "*",
                                                          "R code", ".R",
                                                          "CSV", ".csv",
                                                          "Text", ".txt"),
                                                        3, 2, byrow = TRUE))
        head(readLines(path))
    })

  })

  observeEvent(input$clear_console, {
    output$summary <- renderPrint({
      cat("\014")  # clears console
    })

  })


}

shinyApp(ui, server)
