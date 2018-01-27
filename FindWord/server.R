
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
  
# Check Model for next word options
  
  findsix<-reactive({
    if (length(newtext1())==5) {
          six %>%
          filter(w1==newtext1()[1] & w2==newtext1()[2] & w3==newtext1()[3] & w4==newtext1()[4] & w5==newtext1()[5])
    }
    else {
      NULL
    }
        
      })
  
  findfive<-reactive({
    if (length(newtext1())==4) {
      five %>%
        filter(w1==newtext1()[1] & w2==newtext1()[2] & w3==newtext1()[3] & w4==newtext1()[4])
    }
    else {
      NULL
    }
    
  })
  
  findfour<-reactive({
    if (length(newtext1())==3) {
      four %>%
        filter(w1==newtext1()[1] & w2==newtext1()[2] & w3==newtext1()[3])
    }
    else {
      NULL
    }
    
  })
  
  findthree<-reactive({
    if (length(newtext1())==3) {
      three %>%
        filter(w1==newtext1()[1] & w2==newtext1()[2])
    }
    else {
      NULL
    }
    
  })
  
  findtwo<-reactive({
    if (length(newtext1())==2) {
      two %>%
        filter(w1==newtext1()[1])
    }
    else {
      NULL
    }
    
  })
  
  sixwords<-reactive({
    if(nrow(findsix())>0) {
      findsix$w6
    }
  })
  
  fivewords<-reactive({
    if(nrow(findfive())>0) {
      findfive$w5
    }
  })
  
  fourwords<-reactive({
    if(nrow(findfour())>0) {
      findfour$w4
    }
  })
  
  threewords<-reactive({
    if(nrow(findthree())>0) {
      findthree$w3
    }
  })
  
  twowords<-reactive({
    if(nrow(findtwo())>0) {
      findtwo$w2
    }
  })
  
  words<-reactive({twowords()[1:10]})
  
       output$newtext<-renderText(newtext2())
       
})