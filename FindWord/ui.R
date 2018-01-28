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
       textInput("InputText",
                 "Input Text Here", value=""),
       submitButton("Submit")
      ),
    mainPanel(
      
      textOutput("newtext"),
      textOutput("words")
      
    )
    )
))
