---
layout: tutorial
title: Module 7
permalink: /module-7
---

The last couple of weeks we have been working with data frames. Data frames are the most common way of storing data in R and, generally, is the data structure most often used for data analyses; it is R’s version of an Excel spreadsheet. This module is going to put more focus on working with the different structures that hold data in R.

Specifically, you are going to learn: 

1. The most common data structures in R.
2. How to manage these data structures.
3. How to make your data "tidy".


<hr>

## Tutorials & Resources

Please work through the following tutorials prior to class. 

1. __Managing Data Structures:__ R’s base data structures can be organized by their dimensionality (1d, 2d, or nd) and whether they’re homogeneous (all contents must be of the same type) or heterogeneous (the contents can be of different types). This gives rise to five data types most often used in data analysis, and the five data types that nearly all R objects and outputs are built upon.  To understand and appropriately manage these data structures, read and work through:
   - Data structure basics
   - Managing vectors
   - Managing matrices
   - Managing lists
   - Manging data frames
   - Managing tibbles
2. __How to make your data "tidy":__

1. __Transform your data:__ Although many fundamental data manipulation functions exist in R, they have been a bit convoluted to date and have lacked consistent coding and the ability to easily flow together. `dplyr` is one such package which was built for the sole purpose of simplifying the process of manipulating, sorting, summarizing, and joining data frames.  Read and work through [Chapter 5: Data Transformation](http://r4ds.had.co.nz/transform.html) in R for Data Science.

2. __Exploratory data analysis:__ Combining visualization and data transformation allows you to efficiently explore your data. Read and work through [Chapter 7: Exploratory Data Analysis](http://r4ds.had.co.nz/exploratory-data-analysis.html) in R for Data Science. 


<hr>

## Class Prep

1. Work through the exercises in Chapters 5 & 7 of R for Data Science.
2. Building onto the last module, expand the previous list of questions or identify at least 10 new questions you want to ask of your thesis data.  What exploratory data analysis sequences do you need to implement to answer these questions?  Be ready to use `dplyr` and `ggplot2` to answer these questions in class.
