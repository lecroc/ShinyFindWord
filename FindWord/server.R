
# Load libraries and data

library(igraph)
library(dplyr)
library(ngram)
library(quanteda)
library(stringr)


# Load tables

load("one.Rda")
load("two.Rda")
load("three.Rda")
load("four.Rda")
load("five.Rda")
load("six.Rda")

# Define server logic to return suggested words from text input
shinyServer(function(input, output) {
   

# Tokenize input  
    toke<-reactive({
    tokens_tolower(tokens(input$InputText, remove_punct=T, remove_numbers=T, remove_symbols=T))
  })
  
  newtext<-reactive({
    as.character(unlist(toke()))
  })
  
  newtext1<-reactive({
    gsub("'", '', newtext())
  })
  
  
# trim to five words  
  newtext2<-reactive({
    if (length(newtext1())>5) {
      newtext1()[(length(newtext1())-4):length(newtext1())]
    }
    else {
      newtext1()
    }
  })
  
     output$newtext<-renderText(newtext2())
     
})