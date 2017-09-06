---
title: Final Project
author: Brad Boehmke
layout: tutorial
permalink: /final_project
---

Each student will be responsible for completing a final project.  The goal of this final project is to explore some aspect of your thesis research in a fully reproducible environment and with publication-worthy quality. Ideally, your final project will leverage your thesis data and address one or more of your thesis research objectives by applying an advanced analytic technique and interpreting the results.  

Upon submission you will supply the final PDF report.  You will also submit the .Rmd file that produced the PDF report, your data, and any other files your .Rmd file leverages (images, .bib file, etc.).  Your submitted files should be named with year, course number, lastname, first & middle initial, and then "finalproject." For example my file name would be: 

- OPER 682 section: 2017_OPER682_boehmkebc_finalproject.Rmd
- LOGM 682 section: 2017_LOGM682_boehmkebc_finalproject.Rmd



<div id="final-project-rubric" class="section level1" style="width: 120%;">
<table style="font-size:13px;">
<col width="15%">
<col width="77%">
<col width="8%">
<thead>
<tr class="header">
<th align="left">Section</th>
<th align="center">Standard</th>
<th align="center">Possible Points</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left" valign="top">Introduction </td>
<td align="left" valign="top">
  <b>1.1</b> Provide an introduction and some background regarding your overarching thesis problem. <br> 
  <b>1.2</b> Outline the specific sub-problem you plan to address in this class. <br> 
  <b>1.3</b> Discuss your current proposed approach/analytic technique you think will address (fully or partially) this problem. <br> 
  <b>1.4</b> Explain how your analysis will help the decision-maker. 
</td>
<td align="center" valign="top"> 5 </td>
</tr>
<tr class="even">
<td align="left" valign="top">Packages Required </td>
<td align="left" valign="top"> 
  <b>2.1</b> All packages used are loaded upfront so the reader knows which are required to replicate the analysis. <br> 
  <b>2.2</b> Messages and warnings resulting from loading the package are suppressed. <br> 
  <b>2.3</b> Explanation is provided regarding the purpose of each package (there are over 10,000 packages, don't assume that I know why you loaded each package). 
</td>
<td align="center" valign="top"> 5 </td>
</tr>
<tr class="odd">
<td align="left" valign="top">Data Preparation </td>
<td align="left" valign="top"> 
  <b>3.1</b> Original source where the data was obtained is cited and, if possible, hyperlinked. <br> 
  <b>3.2</b> Source data is thoroughly explained (i.e. what was the original purpose of the data, when was it collected, how many variables did the original have, explain any peculiarities of the source data such as how missing values are recorded, or how data was imputed, etc.). <br> 
  <b>3.3</b> Data importing and cleaning steps are explained in the text (tell me why you are doing the data cleaning activities that you perform) and follow a logical process. <br>
  <b>3.4</b> Once your data is clean, show what the final data set looks like.  However, do not print off a data frame with 200+ rows; show me the data in the most condensed form possible. <br>
  <b>3.5</b> Provide summary information about the variables of concern in your cleaned data set. Do not just print off a bunch of code chunks with <code>str()</code>, <code>summary()</code>, etc.  Rather, provide me with a consolidated explanation, either with a table that provides summary info for each variable or a nicely written summary paragraph with inline code.
</td>
<td align="center" valign="top"> 10 </td>
</tr>
<tr class="even">
<td align="left" valign="top">Exploratory Data Analysis </td>
<td align="left" valign="top"> 
  <b>4.1</b> Uncover new information in the data that is not self-evident (i.e. do not just plot the data as it is; rather, slice and dice the data in different ways, create new variables, or join separate data frames to create new summary information). <br>
  <b>4.2</b> Provide findings in the form of plots and tables. Show me you can display findings in different ways. <br>
  <b>4.3</b> Graph(s) are carefully tuned for desired purpose. One graph illustrates one primary point and is appropriately formatted (plot and axis titles, legend if necessary, scales are appropriate, appropriate geoms used, etc.). <br>
  <b>4.4</b> Table(s) carefully constructed to make it easy to perform important comparisons. Careful styling highlights important features. Size of table is appropriate. <br>
  <b>4.5</b> Insights obtained from the analysis are thoroughly, yet succinctly, explained.  Easy to see and understand the interesting findinsg that you uncovered. <br>
</td>
<td align="center" valign="top"> 10 </td>
</tr>
<tr class="odd">
<td align="left" valign="top">Modeling Results </td>
<td align="left" valign="top"> 
  <b>5.1</b> Properly introduce your modeling technique and its relevance to your problem. <br>
  <b>5.2</b> Provide mathematical formulae to discribe how the analytic technique(s) compute results. <br>
  <b>5.3</b> Implement the analytic technique efficiently. <br>
  <b>5.4</b> Provide adequate interpretation of the results from your analysis.  Try to capture a balance in your explanation so that both an analyst and a senior leader can understand what the results mean. <br>
  <b>5.5</b> Illustrate your findings in the form of plots and tables and fine tune these outputs to best describe your results. <br>
  <b>5.6</b> Provide adequate justification and validation of your final approach and results.
</td>
<td align="center" valign="top"> 10 </td>
</tr>
<tr class="even">
<td align="left" valign="top">Summary </td>
<td align="left" valign="top">
  <b>6.1</b> Summarize the problem statement you addressed. <br>
  <b>6.2</b> Summarize how you addressed this problem statement (the data used and the methodology employed). <br>
  <b>6.3</b> Summarize the interesting insights that your analysis provided. <br>
  <b>6.4</b> Summarize the policy or decision-making implications as a result of your analysis. <br>
  <b>6.5</b> Discuss the limitations of your analysis and how you, or someone else, could improve upon it.
</td>
<td align="center" valign="top"> 5 </td>
</tr>
<tr class="odd">
<td align="left" valign="top">Formatting & Other Requirements </td>
<td align="left" valign="top"> 
  <b>7.1</b> Proper coding style is followed and code is well commented (see section regarding <a href="https://afit-r.github.io/basics#style">syle</a>). <br>
  <b>7.2</b> Coding is systematic - complicated problem broken down into sub-problems that are individually much simpler. Code is efficient, correct, and minimal. Code uses appropriate data structure (list, data frame, vector/matrix/array). Code checks for common errors. <br>
  <b>7.3</b> Achievement, mastery, cleverness, creativity:  Tools and techniques from the course are applied very competently and, perhaps,somewhat creatively. Perhaps student has gone beyond what was expected and required, e.g., extraordinary effort, additional tools not addressed by this course, unusually sophisticated application of tools from course. <br>
  <b>7.4</b> .Rmd fully executes without any errors and PDF produced matches the PDF report submitted by student.
</td>
<td align="center" valign="top"> 15 </td>
</tr>
</tbody>
</table>
<p><em>Total possible points: 60</em></p>
</div>
