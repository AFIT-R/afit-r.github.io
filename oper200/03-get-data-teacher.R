# Session 3: Packages, importing & exporting & tidying data

##################
# TODAY'S TOPICS #
##################
# packages
   ## downloading
   ## getting help
# text files
   ## importing
   ## exporting
# Excel files
   ## importing
   ## exporting
# R object files
   ## importing
   ## exporting
# Creating "tidy" data
   ## reshaping wide and long data
   ## separating/uniting variables



############
# Packages #
############
# to download an individual package from https://cran.r-project.org/
install.packages("dplyr")

# to download multiple packages at once
pkgs <- c("dplyr", "tidyr")
install.packages(pkgs)

# to initiate the package so you can use its functions in the current R session
library(tidyr)

# to get more information and help on a package
help(package = "dplyr")
vignette(package = "dplyr")
vignette("introduction", package = "dplyr")


##################
# YOUR TURN - #1 #
##################
# download the following packages
pkgs <- c("readxl", "xlsx", "tidyr")

install.packages(pkgs)


#################
# Built-in Data #
#################
data()          # view available built-in data sets
data(mtcars)    # to put one of these data sets into your global environment
?mtcars         # to find out more information regarding this data set



##################
# YOUR TURN - #2 #
##################
# 1. load the iris data set
data(iris)

# 2. what is this data measuring?
?iris



##############
# Text files #
##############
# to read in a .csv file and save it as a data frame named mydata
mydata <- read.csv("data/mydata.csv")

# to read in a .txt or .tsv files
read.delim("data/mydata.tsv")            

# note that these functions will turn all character variables into factors. to 
# override this and keep character variables as characters include stringsAsFactor
mydata <- read.csv("data/mydata.csv", stringsAsFactor = FALSE)

# to save a data frame that you have in R as a .csv file
write.csv(mydata, "data/mydata2.csv")

# to save a data frame that you have in R as a .tsv file
write.table(mydata, "data/mydata2.tsv", sep = "\t")

# to view a data frame in a spreadsheet-style viewer
View(mydata)

##################
# YOUR TURN - #3 #
##################
# 1. read in the aircraft.csv file with text set as factors
aircraft <- read.csv("data/aircraft.csv")

# 2. read in the aircraft.tsv file with text set as character strings
aircraft2 <- read.delim("data/aircraft.tsv", stringsAsFactors = FALSE)

# 3. take a peek at what this data looks like
View(aircraft)




###############
# Excel files #
###############
# there is no base R function to read in Excel files so you need to install a 
# package. I use readxl the most 

# install.packages("readxl")
library(readxl)

# read the sheet names of the mydata.xlsx file
excel_sheets("data/mydata.xlsx")

# read in the desired worksheet from mydata.xlsx. note that sometimes you need to
# skip the first couple lines if someone has put in metadata that you do not want
# to include
read_excel("data/mydata.xlsx", sheet = "Second Choice", skip = 2)

# you can read in an entire workbook as a list with each list item containing
# a worksheet
lapply(excel_sheets("data/mydata.xlsx"), read_excel, path = "data/mydata.xlsx")


# to write to Excel files I use the xlsx package
# install.packages(xlsx)
library(xlsx)

write.xlsx(mydata, file = "data/mydata2.xlsx")



##################
# YOUR TURN - #4 #
##################
# 1. what are the worksheet names in the aircraft.xlsx file?
excel_sheets("data/aircraft.xlsx")

# 2. read in the Trainers worksheet
trainers <- read_excel("data/aircraft.xlsx", sheet = "Trainers", skip = 3)

# 3. take a peek at what this data looks like
View(trainers)

# 4. how many NAs exist; omit all NAs in this data set
sum(is.na(trainers))
na.omit(trainers)

# 5. create a new variable that is cost / flying hour
trainers$Cost.per.FH <- trainers$Cost / trainers$FH

# 6. save this filtered data as trainers.xlsx
library(xlsx)
write.xlsx(trainers, file = "data/trainers.xlsx")



##################
# R object files #
##################
# to read in an R object file
readRDS("data/mydata2.rds")

# to save data as an R object file
saveRDS(mydata, "data/mydata2.rds")


##################
# YOUR TURN - #5 #
##################
# 1. save your previous trainers data set as trainers.rds
saveRDS(trainers, file = "data/trainers.rds")

# 2. now read that file back in
readRDS("data/trainers.rds")



######################
# Creating tidy data #
######################
# R works best when you operate on "tidy" data. to read more about tidy data check
# out this paper http://vita.had.co.nz/papers/tidy-data.pdf. a great package to
# help tidy your data is tidyr
# install.packages("tidyr")
library(tidyr)

# gather is a function to turn wide data to long. notice how this data (table4a) has 
# years as variables. years should be a variable itself so we want to reshape this data
table4a

# both of these functions produce the same result in reshaping table4a
gather(data = table4a, key = Year, value = Cases, 2:3)
gather(table4a, Year, Cases, -1)


##################
# YOUR TURN - #6 #
##################
# 1. import the bomber_wide.rds file
bomber_wide <- readRDS("data/bomber_wide.rds")

# 2. turn this into long format
gather(bomber_wide, Year, FH, `1996`:`2014`)



# spread is a function to make long data wider. notice how this data (table2) has 
# a variable type that looks like it should be two variables (case & population).
table2

spread(table2, key = type, value = count)
spread(table2, type, count)



##################
# YOUR TURN - #7 #
##################
# 1. import the bomber_long.rds file
bomber_long <- readRDS("data/bomber_long.rds")

# 2. turn this into a wider format with Cost, FH, & Gallons as variables
spread(bomber_long, Output, Value)


# separate is a function that will split a variable. notice how table3 has a variable
# rate that has two values inside it. we can separate these variable with separate
table3

separate(table3, col = rate, into = c("cases", "population"))



##################
# YOUR TURN - #8 #
##################
# 1. import the bomber_combined.rds file
bomber_combined <- readRDS("data/bomber_combined.rds")

# 2. separate the AC variable into "Type" and "MD"
separate(bomber_combined, AC, into = c("Type", "MD"), sep = " ")



# there may also be times when we want to unite multiple variables to create one variable
# note how table5 has two variables (century & year) that could be united to create a 
# date variable
table5

unite(table5, col = date, century:year, sep = "")



##################
# YOUR TURN - #9 #
##################
# 1. import the bomber_prefix.rds file
bomber_prefix <- readRDS("data/bomber_prefix.rds")

# 2. unite the "prefix" and "number" variables into an "MD" variable
unite(bomber_prefix, col = MD, prefix:number, sep = "-")



# magrittr is a package that provides the pipe operator (%>%) which allows you to 
# "pipe" data into a funcion
# install.packages("magrittr")
library(magrittr)

# create a simple vector
x <- 1:5

# note how these perform the same. the second function is piping x into the sum function
sum(x)
x %>% sum()

# so the conventional way that we performed the tidy functions looked like this
unite(table5, date, century:year, sep = "")

# however, the tidyr package makes use of the pipe operator so we can also right
# this same function like this
table5 %>% unite(col = date, century:year, sep = "")

# why is this beneficial? it allows us to pipe multiple functions together
table5 %>% 
        unite(col = date, century:year, sep = "") %>%
        separate(rate, into = c("cases", "population"))



###################
# YOUR TURN - #10 #
###################
# 1. import the bomber_mess.rds file
bomber_mess <- readRDS("data/bomber_mess.rds")


# 2. clean this data up by making it contain the following variables:
#    Type, MD, FY, Cost, FH, Gallons
bomber_mess %>%
        unite(col = MD, prefix:number, sep = "-") %>%
        separate(Metric, into = c("FY", "Output")) %>%
        spread(Output, Value)




