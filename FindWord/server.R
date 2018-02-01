
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

   output$newtext<-renderText({input$InputText})
   output$words1<-renderText({words()[1]})
   output$words2<-renderText({words()[2]})
   output$words3<-renderText({words()[3]})
   output$words4<-renderText({words()[4]})
   output$words5<-renderText({words()[5]})

})