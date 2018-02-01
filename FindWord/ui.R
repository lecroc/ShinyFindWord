#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word Finder App"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h2("Instructions:"),
      h6("1. Enter phrase below"),
      h6("2. Click Submit to see suggested words"),
      h2(" "),
      textInput("InputText","Input Text Here", value=""),
       submitButton("Submit")
      ),
    mainPanel(
      h4("Your Input:"),
      textOutput("newtext"),
      h2(" "),
      h4("Suggested Words:"),
      textOutput("words1"),
      textOutput("words2"),
      textOutput("words3"),
      textOutput("words4"),
      textOutput("words5")
      
    )
    )
))
