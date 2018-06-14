---
layout: page
title: Collaborating on R Projects 
permalink: /workflow/r_projects_git
---

> *Git (noun) /git/ : A foolish, worthless person - Merriam-Webster Dictionary*
>
> *Git : A content management and tracking system developed by Linus Torvalds, creator of Linux. - Technopedia*

Data science is a team sport.  In most cases you'll want to collaborate with others on the work you're doing.  With RStudio, collaboration is made possible by configuring your project to use one of two decentralized version control systems - Git or Subversion.  In this section you'll learn how to configure your RStudio Projects to work with Git and how to collaborate with others by hosting your projects on GitHub. 

## What is Git?

Git is a free, open-source, and decentralized version control system developed by Linus Torvalds in 2005.  Git was initially created to enable fast, real time collaboration among the Linux development community during development of the Linux kernel.  In Git, work projects are organized into repositories, or 'repos'.  A repo is simply a folder or directory containing a `.git` sub-directory created by Git.  This sub-directory contains a number of files that store snapshots of the files contained in the repo.  Whenever any file in the repo is modified, added, or removed Git creates a new snapshot.  This framework makes it easy to undo any previous changes by simply reverting back to an earlier snapshot.  With Git, you have access to all versions of every file in the repository at any time - it’s almost impossible to lose any part of your work. Plus, colleagues can work on the same project, simultaneously, without interfering with each other and without fear of losing any changes. Git was designed to handle every project, from the very small to the very large, with speed and efficiency.

## Installing Git

To get started, install Git by following these steps:

1. Go to [https://git-scm.com/downloads](https://git-scm.com/downloads)
2. Click the link for your operating system to start the installation
3. Mac/Linux/Unix users should accept all of the defaults during the install
4. Windows users should accept all of the defaults, __EXCEPT__ Choose the 'Use Git Bash as the default editor' option

## Creating Projects

RStudio projects are associated with R working directories. You can create an RStudio project:

* In a new directory
* In an existing directory where you already have R code and data
* By cloning a version control (Git or Subversion) repository

by selecting **File**  &raquo; **New Project** and then completing the following set-up tasks:

<center>
<img src="/public/images/workflow/new_project.png" width="100%" height="100%"/>
</center>

## So What's Different?

When a new project is created RStudio:

1. Creates a project file (with an .Rproj extension) within the project directory. This file contains various project options (discussed below) and can also be used as a shortcut for opening the project directly from the filesystem.
2. Creates a hidden directory (named .Rproj.user) where project-specific temporary files (e.g. auto-saved source documents, window-state, etc.) are stored. This directory is also automatically added to .Rbuildignore, .gitignore, etc. if required.
3. Loads the project into RStudio and display its name in the Projects toolbar (which is located on the far right side of the main toolbar)

<center>
<img src="/public/images/workflow/create RProject.gif" width="100%" height="100%"/>
</center>

When a project is opened (**File**  &raquo; **Open Project** or by clicking on the .Rproj file directly for the project):

* A new R session is started
* The .Rprofile file in the project's main directory is sourced by R
* The .RData file in the project's main directory is loaded (if any)
* The history for the project is loaded into the History panel
* The working directory is set to the project's directory.
* Previously edited source documents are restored into editor tabs
* Other RStudio settings are restored to where they were the last time the project was closed

As you write and execute code in the project all updates and outputs created will be saved to the project directory. And when you close out of the project the .RData and .Rhistory files will be saved (if these options are selected in the global options) and the list of open source documents are saved so that they can be restored the next time you open the project.

There are additional project options you can choose from to customize the project at **Tools**  &raquo; **Project Options**. These project options are overrides for existing global options. To inherit the default global behavior for a project you can specify (Default) as the option value.

<center>
<img src="/public/images/workflow/project_options.png"/>
</center>
