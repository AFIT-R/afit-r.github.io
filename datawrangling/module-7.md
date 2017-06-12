---
layout: tutorial
title: Module 7
permalink: /module-7
---

The last couple of weeks we have been working with data frames. Data frames are the most common way of storing data in R and, generally, is the data structure most often used for data analyses; it is R’s version of an Excel spreadsheet. This module is going to put more focus on working with the other structures that hold data in R.

Specifically, you are going to learn: 

1. The most common data structures in R.
2. How to manage non-data frame data structures.
3. How to make your data "tidy".

<hr>

## Tutorials & Resources

Please work through the following tutorials prior to class. 

1. __Managing Data Structures:__ R’s base data structures can be organized by their dimensionality (1d, 2d, or nd) and whether they’re homogeneous (all contents must be of the same type) or heterogeneous (the contents can be of different types). This gives rise to five data types most often used in data analysis, and the five data types that nearly all R objects and outputs are built upon.  You already have a strong understanding of data frames; however, it's important to understand and appropriately manage the other data structures as you will likely come across them down the road.  Read and work through:
   - [Data structure basics](structure_basics)
   - [Managing vectors](vectors)
   - [Managing matrices](matrices)
   - [Managing lists](lists)
   
Putting our focus back on data frames, a relatively new "modified" version of the data frame has been established and is referred to as a *tibble*.  Tibbles are data frames, but they tweak some older behaviors to make life a little easier. Go ahead and read through the [Managing Tibbles](tutorial).

2. __How to make your data "tidy":__ The majority of our analyses will be for the purpose of studying a specific data frame/tibble.  However, most functions require your data frame to be well organized and in a specific format.  This may require you to manipulate the structure of your data (i.e. long vs. wide data) so that it is properly organized for the next activity.  Read and work through [Chapter 12: Tidy Data](http://r4ds.had.co.nz/tidy-data.html) to learn how to organize your data the "tidy" way.

<hr>

## Class Prep

Work through the exercises in each of the tutorials provided.
