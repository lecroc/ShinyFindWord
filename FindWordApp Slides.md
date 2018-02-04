Word Finder Application
========================================================
author: Charlie LeCrone 
date: February 4, 2018
autosize: true

Background 
========================================================
The Objective of my Shiny Application is to provide suggested options for the next word based on a phrase input from the user.

I have intentionally tried to get it to work in a similar fashion to the SMS text application on my smartphone.

The underlying strategy in the development of the app was to keep the model fairly simple, but to train it on as much data as possible.  Therefore, the end result is a fairly simple backoff n-gram model that has been trained on the entire corpus of text data avaialble.


Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](FindWordApp Slides-figure/unnamed-chunk-2-1.png)
