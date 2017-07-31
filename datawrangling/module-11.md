---
layout: tutorial
title: Module 11
permalink: /module-11
---

Don't repeat yourself (DRY) is a software development principle aimed at reducing repetition. Formulated by Andy Hunt and Dave Thomas in their book [The Pragmatic Programmer](http://www.amazon.com/Pragmatic-Programmer-Journeyman-Master/dp/020161622X/ref=sr_1_1?s=books&ie=UTF8&qid=1456066112&sr=1-1&keywords=the+pragmatic+programmer), the DRY principle states that "every piece of knowledge must have a single, unambiguous, authoritative representation within a system." This principle has been widely adopted to imply that you should not duplicate code. Although the principle was meant to be far grander than that[^footnote], there's plenty of merit behind this slight misinterpretation.

Removing duplication is an important part of writing efficient code and reducing potential errors. First, reduced duplication of code can improve computing time and reduces the amount of code writing required. Second, less duplication results in less creating and saving of unnecessary objects. Inefficient code invariably creates copies of objects you have little interest in other than to feed into some future line of code; this wrecks havoc on properly managing your objects as it basically results in a global environment charlie foxtrot! Less duplication also results in less editing. When changes to code are required, duplicated code becomes tedious to edit and invariably mistakes or fat-fingering occur in the cut-and-paste editing process which just lengthens the editing that much more.

Thus, minimizing duplication by writing efficient code is important to becoming a data analyst and this week we will focus on two methods to achieve this:

1. Writing functions
2. Using iteration


<hr>

## Tutorials & Resources

**Writing functions:** Functions allow you to reduce code duplication by automating a generalized task to be applied recursively. Whenever you catch yourself repeating a function or copy-and-pasteing code there is a good chance that you should write a function to eliminate the redundancies. Read [Chapter 19: Functions](http://r4ds.had.co.nz/functions.html) to get started with functions.


<hr>

## Class Prep

You can download class material here: &nbsp; <a href="https://www.dropbox.com/sh/iwpprl8c4r4ymao/AAD8mGGQF-Dd2fy6HJ05gJW4a?dl=1" style="color:black;"><i class="fa fa-cloud-download" style="font-size:1em"></i></a>

[^footnote]: According to [Dave Thomas](http://www.artima.com/intv/dry.html), "DRY says that every piece of system knowledge should have one authoritative, unambiguous representation. Every piece of knowledge in the development of something should have a single representation. A system's knowledge is far broader than just its code. It refers to database schemas, test plans, the build system, even documentation."
