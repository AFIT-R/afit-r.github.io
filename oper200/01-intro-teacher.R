# Session 1: An introduction to statistical programming

##################
# TODAY'S TOPICS #
##################
# Intro
   ## Working directory
   ## Getting help in R
   ## Arithmetic in R
   ## Variables (assignment)
   ## Basic data types
# Vectors
   ## basics (creating, naming)
   ## indexing
   ## comparison operators
   ## operations (arithmetic, summarization)
# Factors
   ## creating
   ## changing levels
   ## ordering


######################
# Set Your Directory #
######################
# use getwd() to get your current working directory
getwd()  

# set your working directory
setwd("/Users/bradboehmke/Dropbox/Academia/Courses/OPER 200")


##################
# YOUR TURN - #1 #
##################
# set your working directory to the OPER 200 folder
setwd("/Users/bradboehmke/Dropbox/Academia/Courses/OPER 200")


################
# Getting Help #
################
help("sum")
?mean
example("sum")


###################
# Arithmetic in R #
###################
# follows PEMDAS order of operations
4 + 3 / 10 ^ 2
4 + (3 / 10 ^ 2)
(4 + 3) / 10 ^ 2
1 / 17 ^ 7
1 / 0
Inf - Inf

42 / 5          # regular division
42 %/% 5        # integer division
42 %% 5         # modulo (remainder)  


###################################
# Variables & Assignment Operator #
###################################

x <- 3                  # assign 3 to x
x                       # evaluate x
X                       # case sensitive

x <- x + 1              # we can increment (build onto) existing objects
x

x = 3                   # BAD
x <- 3                  # GOOD

# some comments regarding style - first, when making comments people tend to 
# comment above the code when the comments are longer; you can comment to the
# right of the code when the comments are shorter

# many naming conventions, underscore and period are most popular
# whichever you use just be consistent
naming_convention <- 3       # underscore separator
naming.convention <- 3       # period separator
namingConvention <- 3        # lower camel case
NamingConvention <- 3        # upper camel case
namingconvention <- 3        # all lower case; no separator

# add space to your code to make it more readable
inches<-4                                               # BAD
feet<-1+2^10/5^2                                        # BAD
average<-mean(feet/12+inches,na.rm=TRUE)                # BAD

inches <- 4                                             # GOOD
feet <- 1 + 2^10 / 5^2                                  # GOOD
average <- mean(feet / 12 + inches, na.rm = TRUE)       # GOOD

# remove objects from your working environment
rm(x)
ls()
rm(list = ls())


##################
# YOUR TURN - #2 #
##################
# Calculate Q in the in the economic order quantity model presented
D <- 1000
K <- 5
h <- .25

Q <- sqrt((2 * D * K) / h)
Q

rm(list = ls())



####################
# Basic Data Types #
####################
# building blocks for data
fp <- 3.141593                  # numeric (double)
int <- 4L                       # numeric (integer)
char <- "hello world"           # character
logical <- TRUE                 # logical
today <- as.Date("2016-09-08")  # date

# check your data type
class(char)
is.character(char)
is.double(char)
is.integer(int)
is.logical(char)

# transform data type
as.double(int)          # change variables to a double numeric
as.integer(fp)          # change variables to an integer numeric
as.character(fp)        # change variables to a character


#################
# Vector Basics #
#################
# creating vectors
v1 <- c(1, 2, 3, 4, 5)
v2 <- 1:5
v3 <- c("U", "S", "A")
v4 <- c(TRUE, FALSE, FALSE, TRUE)
v5 <- as.Date(c("2016-09-08", "2016-09-09", "2016-09-10")) 

# naming your vectors
names(v1)                                                       # vector has no names currently
names(v1) <- c("item1", "item2", "item3", "item4", "item5")     # assign names to each element
v1

# use the following functions to understand the basics of your vector
str(v2)
class(v2)
length(v2)
head(v2)
tail(v2)

rm(list = ls())


##################
# YOUR TURN - #3 #
##################
# 1. type gallons <- readRDS("data/gallons.rds) in your console
gallons <- readRDS("data/gallons.rds")

# 2. what type of data does this vector contain?
class(gallons)

# 3. how many observations are in the vector
length(gallons)

# 4. what are the names of the vector
names(gallons)

# 5. Remove gallons from your global environment
rm(gallons)



###################
# Vector Indexing #
###################
# create this vector
vec.values <- runif(26)
names(vec.values) <- LETTERS

# use brackets to index your vector
vec.values[18]
vec.values[18:22]
vec.values[c(2, 18, 1, 4)]
vec.values[c("B", "R", "A", "D")]
vec.values[-(10:20)]

# simplify vs preserve
vec.values[[5]]
vec.values[5]


###############################
# Vector Comparison Operators #
###############################
# single value comparison (performs element-by-element comparisons)
vec.values < .5
vec.values > .5
?`>`

# index vector for those elements that meet your conditional argument
vec.values[vec.values < .5]                                             # less than .5
vec.values[vec.values < .25 | vec.values > .75]                         # less than .25 or greater than .75
vec.values[vec.values < .25 & names(vec.values) %in% LETTERS[1:5]]      # less than .25 and names = A, B, C, D, or E

# vector-vector comparison
vec1 <- c(4, 4, 9.00000008, 12)
vec2 <- c(4, 4, 9, 12)

vec1 == vec2            # element comparison between the two vectors
identical(vec1, vec2)   # are all elements exactly the same in both vectors
all.equal(vec1, vec2)   # are all elements approximately the same in both vectors


##################
# YOUR TURN - #4 #
##################
# 1. load gallons back into your environment
gallons <- readRDS("data/gallons.rds")

# 2. index for the 3-5 elements
gallons[3:5]

# 3. index for aircrafts 12, 17, 38
gallons[c("aircraft 12", "aircraft 17", "aircraft 38")]

# 4. index for elements greater than 50M
gallons[gallons > 50000000]


#####################
# Vector Operations #
#####################
# create these vectors
vec.values <- rnorm(100, mean = 100, sd = 10)
vec.values2 <- c(vec.values, NA)

# single vector operations
summary(vec.values)                     # provides summary
sum(vec.values2, na.rm = TRUE)          # sum all elements in vector (use na.rm = TRUE to remove missing values)
mean(vec.values2, na.rm = TRUE)         # mean of all elements
median(vec.values2, na.rm = TRUE)       # median of all elements
sd(vec.values2, na.rm = TRUE)           # standard dev. of all elements

# create this character vector
vec.char <- sample(letters[1:10], size = 100, replace = TRUE)

# table() provides a nice way to summarize (count) categorical values
table(vec.char)         

# multiple vector operations - vectorization
x <- 1:5
y <- 6:10

# performs element-wise arithmetic
x + y                   
x * y                   


# beware of recycling
long <- 1:10
short <- 1:5

long + short


##################
# YOUR TURN - #5 #
##################
# 1. Calculate Q in the in the economic order quantity model presented
D <- c(item1 = 900, item2 = 1000, item3 = 1450)
K <- c(item1 = 5.5, item2 = 5, item3 = 4.5)
h <- c(item1 = .25, item2 = .50, item3 = .95)

Q <- sqrt((2 * D * K) / h)
Q

# 2. what is the average optimal quantity across the three items?
mean(Q)

rm(list = ls())


###########
# Factors #
###########
# create these character vectors
char1 <- c("male", "female", "female", "male", "male")
char2 <- c("2Lt", "Maj", "Maj", "Capt", "1Lt", "2Lt", "2Lt", "Col", "Col")

# to turn these into factors (categorical variables)
factor(char1)
factor(char1, levels = c("male", "female"))

factor(char2)
factor(char2, levels = c("2Lt", "1Lt", "Capt", "Maj", "Col"))
factor(char2, levels = c("2Lt", "1Lt", "Capt", "Maj", "Col"), ordered = TRUE)


summary(char2)
fac1 <- factor(char2, levels = c("2Lt", "1Lt", "Capt", "Maj", "Col"), ordered = TRUE)
summary(fac1)


##################
# YOUR TURN - #6 #
##################
# 1. type ses <- readRDS(ses.rds) in your console
ses <- readRDS("data/ses.rds")

# 2. what type of data does this vector contain?
class(ses)

# 3. turn this into an ordered factor with low < middle < high
ses <- factor(ses, levels = c("low", "middle", "high"), ordered = TRUE)

# 4. how many observations are there for each level?
summary(ses)






