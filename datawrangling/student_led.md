---
title: Student-led Analytic Learning
author: Brad Boehmke
layout: tutorial
permalink: /student_led
---

Each student will be responsible for facilitating the learning of an analytic technique, either individually or as part of a two-person team, depending on course enrollment. The student(s) will:

1. Develop a tutorial that uses a toy data set and provides a step-by-step approach to executing the analytic technique in R.
2. Facilitate an active discussion on the analytic technique, a discussion of practical applications for the problem within the Department of Defense, and provide in-class exercises for the class to practice this technique in R. 

Based on our course enrollment, I will ask you to sign up for one of the 12 student-facilitated lessons. I will hand out a sign-up sheet to the senior-ranking uniformed military student taking the class and ask him/her to be the POC for the sign-ups between class sessions 1 and 2.

I will evaluate your facilitating based on the following performance measures:

1. __Knowledge__: You should become a subject matter expert in the topic you are facilitating. This will require substantial independent learning. However, I highly recommend you select an analytic technique that you plan to apply to your final project *and* aligns with your thesis problem.  This will allow you to refine your knowledge during this class, apply your knowledge to your thesis, and start extracting results.

2. __Organization & Design__: Your objective is to develop a tutorial along with in-class material that allows fellow classmates to learn about the analytic technique, when it would be used, and the R packages and code required to execute the technique. Furthermore, the material must provide an example of an integrated use-case along with exercises for the students to demonstrate their knowledge.

3. __Tutorial__: Developing online tutorials are a fantastic way to learn topics in more depth, demonstrate your skills, and help build the analytic toolset of other analysts. Your tutorial will be written as a .Rmd file that can be knit to an HTML file and hosted on the *[AFIT Data Science Lab R Programming Guide](https://afit-r.github.io/)* website. Your tutorial should introduce the technique, provide the data and R packages to replicate the analysis, and then walk through the mathematical equations along with how to execute, validate, and interpret the analytic technique and results in R. This tutorial must be completed and ready to be published online NLT 4 days prior to the class session you will be presenting it.  Furthermore, I will need time to review/edit the tutorial so please have a first draft of the tutorial to me NLT 1 week prior to your session.  You can see examples of tutorials on the [Descriptive](https://afit-r.github.io/descriptive) and [Predictive](https://afit-r.github.io/predictive) Analytics pages.

4. __Presentation__: You will have 30 minutes to present the analytic technique in class.  Since the students will have read through the tutorial this presentation is meant to discuss the technique, how you are using it to address a military problem, and address any questions, concerns, or clarifications from the students.  There will be two groups presenting in a single class session so you cannot breach your time limit as the first hour of these sessions will be dedicated to presentation and the last 30 minutes of class will be for the students to perform exercises you provide that allows them to practice executing the analytic technique. 

5. __Exercises__: For the last 30 minutes of class the students will choose which analytic technique they wish to practice executing.  You need to provide a mini case study that asks specific questions which require the students to execute your analytic technique in R in order to answer.

6. __Engagement__: Students are engaged with the material and the class.  You have made it interesting, whether through encouraging active participation, mandating participation through exercises and/or discussions, and/or motivating the material with both enthusiasm and an application-based focus.

7. __Communication__: Your communication of concepts, whether via lecture, demonstration, or even the (oral or written) posing of discussion questions, should be clear and precise.  By “precise”, I mean accurate within the lexicon of R programming and the analytic technique being discussed.  This includes your use of notation, code, and the like.


Students facilitating a lesson need to meet with me at least a week prior to your lesson to propose how you plan to conduct it so that I can help you refine and/or improve it. What are my expectations when we meet at least a week prior to the lesson?  You should have already delved into the material at a depth greater than you expect of the other students, created a draft tutorial, and developed a plan for how you want to facilitate the lesson.  The more you have done, the more valuable any refinement is when we meet, and the better your lesson will likely go.  

After your lesson, I will ask you to conduct a self-assessment using the coarse rubric shown below.  I will complete one, too, but it’s important to develop your self-awareness in order to improve without external directives in future assignments.




| **Measure** | **Highly Effective** | **Effective** | **Improvement Necessary** | **Does not Meet Standards** |
|---------|------------------|-----------|-----------------------|-------------------------|
| **Knowledge** | Expert in the subject area. | Knows the subject matter well. | Is familiar with the subject matter. | Has little familiarity with the subject matter. |
| **Organization & Design** | Has clearly defined approach and a well-orchestrated design of the tutorial and class for students to learn the technique. | Has defined approach and a sound design of the tutorial and class for students to learn the technique. | Has poorly defined approach and design of the tutorial and class for students to learn the technique. | Has poorly defined approach and a haphazard design of the class that does not provide a clear path for students to learn the technique. |
| **Tutorial** | blah | blah | blah | blah |
| **Exercises** | blah | blah | blah | blah |
| **Engagement** | All students are actively engaged with the material. | Most students are engaged with the material. | Selected students are engaged with the material. | Students are not engaged with the material. |
| **Communication** | Communication is clear, concise, cogent, and correct. | Communication is generally clear, concise, cogent, and correct. | Communication requires some corrections and/or amendments to correct errors. | Communication is not clear and misconveys important aspects of the material. |


<div id="general-homework-rubric" class="section level1" style="width: 100%;">
<p><em>Also consult any specific guidance given in the relevant assignment itself.</em></p>
<table style="font-size:12px;">
<col width="10%">
<col width="30%">
<col width="30%">
<col width="30%">
<thead>
<tr class="header">
<th align="left">Topic</th>
<th align="center">Excellent: <br> ✓+ coded as +</th>
<th align="center">Satisfactory: <br> ✓ coded as 0</th>
<th align="center">Needs work: <br> ✓- coded as -</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left" valign="top">Coding style</td>
<td align="left" valign="top">Student has gone beyond what was expected and required, proper coding <a href="http://uc-r.github.io/section2_basics#style">style</a> is followed, code is well commented</td>
<td align="left" valign="top">Coding style lacks refinement and has some errors, but code is readable and has some comments</td>
<td align="left" valign="top">Many errors in coding style, little attention paid to making the code human readable</td>
</tr>
<tr class="even">
<td align="left" valign="top">Coding strategy</td>
<td align="left" valign="top">Complicated problem broken down into sub-problems that are individually much simpler. Code is efficient, correct, and minimal. Code uses appropriate data structure (list, data frame, vector/matrix/array). Code checks for common errors</td>
<td align="left" valign="top">Code is correct, but could be edited down to leaner code. Some “hacking” instead of using suitable data structure. Some checks for errors.</td>
<td align="left" valign="top">Code tackles complicated problem in one big chunk. Code is repetitive and could easily be functionalized. No anticipation of errors.</td>
</tr>
<tr class="odd">
<td align="left" valign="top">Presentation: graphs</td>
<td align="left" valign="top">Graph(s) carefully tuned for desired purpose. One graph illustrates one point</td>
<td align="left" valign="top">Graph(s) well chosen, but with a few minor problems: inappropriate aspect ratios, poor labels.</td>
<td align="left" valign="top">Graph(s) poorly chosen to support questions.</td>
</tr>
<tr class="even">
<td align="left" valign="top">Presentation: tables</td>
<td align="left" valign="top">Table(s) carefully constructed to make it easy to perform important comparisons. Careful styling highlights important features.</td>
<td align="left" valign="top">Table(s) generally appropriate but possibly some minor formatting deficiencies.</td>
<td align="left" valign="top">Table(s) with too many, or inconsistent, decimal places. Table(s) not appropriate for questions and findings. Major display problems.</td>
</tr>
<tr class="odd">
<td align="left" valign="top">Achievement, mastery, cleverness, creativity</td>
<td align="left" valign="top">Student has gone beyond what was expected and required, e.g., extraordinary effort, additional tools not addressed by this course, unusually sophisticated application of tools from course.</td>
<td align="left" valign="top">Tools and techniques from the course are applied very competently and, perhaps,somewhat creatively. Chosen task was acceptable, but fairly conservative in ambition.</td>
<td align="left" valign="top">Student does not display the expected level of mastery of the tools and techniques in this course. Chosen task was too limited in scope.</td>
</tr>
</tbody>
</table>
</div>
