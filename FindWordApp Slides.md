Word Finder Application
========================================================
author: Charlie LeCrone 
date: February 4, 2018
autosize: true

Background 
========================================================
<small>The Objective of my Shiny Application is to provide suggested options for the next word based on a phrase input from the user.

I have intentionally tried to get it to work in a similar fashion to the SMS text application on my smartphone.

The underlying strategy in the development of the app was to keep the model fairly simple, but to train it on as much data as possible.  Therefore, the end result is a fairly simple backoff n-gram model that has been trained on the entire corpus of text data avaialble.</small>


Data Prep
========================================================
<small>In this phase I was fortunate to have access to a computer with 64GB of RAM.  I went throught the following steps to prepare the text data for modelling:
- All data prep was done using a combination of the dplyr and quanteda packages
  - Created a corpus of all available text data
  - Created document frequency matrices and frequency tables for 1, 2, 3, 4, 5 and 6 grams
  - Pruned the n-gram frequency tables for frequencies >= 5
  - Broke out the frequency tables into data frames with columns for each token in the n-gram along with a column for the frequency it occurred within the corpus
  - Saved a data table for each set of n-grams for use in model </small>

Model Development
========================================================
<small>In keeping with my strategy of using a simple model with lots of data, I stayed focused on a backoff model using the n-gram tables I created in the data preparation phase:
- Model takes input from the user and searches for matches, starting with 6 grams and backing off to 5, 4, 3. and 2 grams
- Compiled a list of words matched at each step of the backoff chain, sorting by probability - words from higher order n-grams given priority
- Experimented with backing off from 6, 5, and 4 grams
- Settled on 4 grams as I found that there were very few situations where 5 or 6 grams produced a match
- Compared performance of my model to the performance of the SMS text app on my smartphone
- Once I felt the performance was satisfactory, proceded to develop Shiny App
</small>


Shiny App
========================================================
<small>You can access my Shiny App here: https://lecroc1028.shinyapps.io/FindWord/

Model Features:
- Total data loaded is < 20 Mb, so only takes a few seconds to load
- User inputs a phrase, clicks submit, or hits "Enter"
- The five most likely next words are returned in order by the app

Code
You can see all of the code I created to develop the model / app in these repos:

https://github.com/lecroc/CapstoneExploratory
https://github.com/lecroc/Capstone-Model
https://github.com/lecroc/ShinyFindWord
</small>



