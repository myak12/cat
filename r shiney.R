

library(shiny)
library("readxl")
my_data1 <- read_excel("11.xlsx")
my_data1_mat<- as.matrix(my_data1, rownames.force = NA)

ui <- pageWithSidebar(
  headerPanel('Effect of Predicted percentage of PCR positive by selecting variables'),
  sidebarPanel(
    radioButtons('Variables', 'Variables:', list("Age","Breeding type","Sex","Housing type",
                                                 "Sample collection methods","Treatment history")) ),
  mainPanel(
    plotOutput('plot1')
  )
)
server <- function(input, output, session) { 
  
  output$plot1 <- renderPlot({
    
    if(input$Variables=="Age"){
      i<-my_data1_mat[c(1,2)]
      name<-colnames(my_data1_mat)
      name<-name[c(1,2)]
    }
    if(input$Variables=="Breeding type"){
      i<-my_data1_mat[c(3,4)]
      name<-colnames(my_data1_mat)
      name<-name[c(3,4)]
    }
    if(input$Variables=="Sex"){
      i<-my_data1_mat[c(5,6,7,8)]
      name<-colnames(my_data1_mat)
      name<-name[c(5,6,7,8)]
    }
    if(input$Variables=="Housing type"){
      i<-my_data1_mat[c(9,10)]
      name<-colnames(my_data1_mat)
      name<-name[c(9,10)]
    }
    if(input$Variables=="Sample collection methods"){
      i<-my_data1_mat[c(11,12,13)]
      name<-colnames(my_data1_mat)
      name<-name[c(11,12,13)]
    }
    if(input$Variables=="Treatment history"){
      i<-my_data1_mat[c(14,15)]
      name<-colnames(my_data1_mat)
      name<-name[c(14,15)]
    }
    
    barplot(i,main="PCR positive rate",names.arg = name,ylim =c(0,0.3),
            ylab="PCR positive percentage")
  })
}
shinyApp(ui = ui, server = server)





