
# Load libraries and data

library(igraph)
library(dplyr)
library(ngram)
library(quanteda)
library(stringr)
library(shiny)


# Load tables

load("one.Rda")
load("two.Rda")
load("three.Rda")
load("four.Rda")

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
  
  
# trim to three words  
  newtext2<-reactive({
    if (length(newtext1())>3) {
      newtext1()[(length(newtext1())-2):length(newtext1())]
    }
    else {
      newtext1()
    }
  })
  
  findfour<-reactive({
    if (length(newtext2())==3) {
      four %>%
        filter(w1==newtext2()[1] & w2==newtext2()[2] & w3==newtext2()[3])
    }
  })
  
  findthree<-reactive({
    if (length(newtext2())==3) {
      three %>%
        filter(w1==newtext2()[2] & w2==newtext2()[3])
    }
    else {
      if (length(newtext2()==2)) {
        three %>%
          filter(w1==newtext2()[1] & w2==newtext2()[2])
      }
    }
  })
  
  findtwo<-reactive({
    if (length(newtext2())==3) {
      two %>%
        filter(w1==newtext2()[3])
    }
    else {
      if (length(newtext2())==2) {
        two %>%
          filter(w1==newtext2()[2])
      }
    
      else {
        if (length(newtext2())==1) {
          two %>%
            filter(w1==newtext2()[1])
        }
      }
    }
  })
  
  words<-reactive({
    unique(c(findfour()$w4, findthree()$w3, findtwo()$w2, one$feature))[1:5]
    })
  
  word1<-reactive({
    paste("1. ", words()[1])
  })

  word2<-reactive({
    paste("2. ", words()[2])
  })
  
  word3<-reactive({
    paste("3. ", words()[3])
  })
  
  word4<-reactive({
    paste("4. ", words()[4])
  })
  
  word5<-reactive({
    paste("5. ", words()[5])
  })
  
   output$newtext<-renderText({input$InputText})
   output$words1<-renderText({word1()})
   output$words2<-renderText({word2()})
   output$words3<-renderText({word3()})
   output$words4<-renderText({word4()})
   output$words5<-renderText({word5()})

})