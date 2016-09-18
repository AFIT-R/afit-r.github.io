# Session 2: Understanding data structures

##################
# TODAY'S TOPICS #
##################
# Matrices
   ## basics (creating, naming)
   ## indexing
   ## comparison operators
   ## matrix operations (arithmetic, summarization)
# Data frames
   ## basics (creating, naming)
   ## indexing
   ## comparison operators
   ## data frame operations (subsetting, arithmetic, summarization)
# Lists
   ## basics (creating, naming)
   ## indexing


#################
# Matrix Basics #
#################
# create this vector
vec1 <- 1:15

# use matrix() to create a matrix
matrix(1:15)
matrix(1:15, ncol = 5)
matrix(vec1, ncol = 5, byrow = TRUE)

# different kinds of matrices
matrix_num <- matrix(1:15, ncol = 5)
matrix_tex <- matrix(letters[1:15], ncol = 5)

# you can combine vectors to make a matrix (you can use either matrix() or rbind())
ac1 <-  c(120, 150, 100, 160, 155)
ac2 <- c(180, 175, 175, 190, 165)
ac3 <- c(150, 140, 150, 150, 145)

matrix(c(ac1, ac2, ac3), nrow = 3, byrow = TRUE)
rbind(ac1, ac2, ac3)

# naming your columns & rows
ac_m <- matrix(c(ac1, ac2, ac3), nrow = 3, byrow = TRUE)
rownames(ac_m) <- c("ac1", "ac2", "ac3")
colnames(ac_m) <- c("flt1", "flt2", "flt3", "flt4", "flt5")        
       
rm(ac1, ac2, ac3, matrix_num, matrix_tex)
 
# use the following to understand the basics of your matrix
str(ac_m)       # basic structure of your matrix
class(ac_m)     # the type of object (matrix)
mode(ac_m)      # the type of data inside your object
dim(ac_m)       # the dimensions
head(ac_m)      # first 6 rows
tail(ac_m)      # last 6 rows


###################
# Matrix Indexing #
###################
# index by number
ac_m[1]         # index element 1
ac_m[1, ]       # index row 1 and all columns
ac_m[ , 1]      # index all rows for the first column
ac_m[2, 4]      # index the element at the intersection of row 2 and column 4

# index by name
ac_m["ac1", ]
ac_m[, "flt3"]
ac_m["ac1", "flt3"]

# simplify vs preserve
ac_m[, 3]                       # simplifies to a vector
ac_m[, 3, drop = FALSE]         # keeps the output as a matrix

rm(list = ls())

##################
# YOUR TURN - #1 #
##################
# 1. read in the gallons.matrix.rds file
gallons <- readRDS("data/gallons_matrix.rds")

# 2. what are the dimension of this matrix?
dim(gallons)

# 3. what are the row and column names for this matrix
rownames(gallons)
colnames(gallons)

# 4. index for all years for aircraft 18 & 48
gallons[c("aircraft 18", "aircraft 48"), ]

# 5. index for aircraft 2, 10 & 53 for years 2010-2012
gallons[c("aircraft 2", "aircraft 10", "aircraft 53"), c("2010", "2011", "2012")]


###############################
# Matrix Comparison Operators #
###############################
# create this matrix (creates a 5x5 matrix with 2 missing values)
mat <- matrix(1:25, nrow = 5)
mat[sample(mat, 2)] <- NA

# element-wise comparison
mat >= 15

# index matrix for those elements that meet the condition
mat[mat >= 15]

# dealing with missing values
is.na(mat)                                      # test for missing values
sum(is.na(mat))                                 # how many missing values are there?
na.omit(mat)                                    # remove rows that contain missing values
mat[is.na(mat)] <- mean(mat, na.rm = TRUE)      # replace missing values with the mean


#####################
# Matrix Operations #
#####################
# element-wise arithmetic (does not perform matrix multiplication)
mat * 2
mat^2
mat * mat

# wrap math operators with %% to perform matrix multiplication
mat %*% mat
mat %/% mat

# transpose your matrix
t(mat) 

# ---> see http://www.statmethods.net/advstats/matrix.html for more matrix algebra

rm(mat)


# create this matrix
ac1 <-  c(120, 150, 100, 160, 155)
ac2 <- c(180, 175, 175, 190, 165)
ac3 <- c(150, 140, 150, 150, 145)
ac_m <- rbind(ac1, ac2, ac3)
colnames(ac_m) <- c("flt1", "flt2", "flt3", "flt4", "flt5")        
rm(ac1, ac2, ac3)

# simple row and column calculations
rowSums(ac_m)
rowMeans(ac_m)
colSums(ac_m)
colMeans(ac_m)

# add these values to our matrix
avg <- rowMeans(ac_m)
ac_m <- cbind(ac_m, avg)
ac_m

rm(list = ls())

##################
# YOUR TURN - #2 #
##################
# 1. read in the gallons.matrix.rds file
gallons <- readRDS("data/gallons_matrix.rds")

# 2. remove aircraft with missing observations
gallons <- na.omit(gallons)

# 3. compute the overall average gallons burned
mean(gallons)

# 4. compute annual total gallons burned
colSums(gallons)

# 5. compute aircraft average burn rate
rowMeans(gallons)

# Bonus: which aircraft has the highest burn rate?
which.max(rowMeans(gallons))


rm(list = ls())


#####################
# Data Frame Basics #
#####################
# data frames are closest to Excel "spreadsheet" data
mtcars
iris

# to create a data frame
df <- data.frame(w = 1:5,
                 x = letters[1:5],
                 y = c(T, T, F, F, T),
                 z = factor(c("male", "male", "female", "female", "male")))

# you can add (or change) column and row names
colnames(df) <- c("var1", "var2", "var3", "var4")
rownames(df) <- c(letters[1:5])

# understanding your data frame
str(df)
class(df)
dim(df)
head(df)
tail(df)
names(df)
nrow(df)
ncol(df)


#######################
# Data Frame Indexing #
#######################
# index by number
mtcars[1, ]
mtcars[ , 1]
mtcars[2, 4]

# index by names
mtcars["Fiat X1-9", ]
mtcars[, "mpg"]
mtcars["Fiat X1-9", "mpg"]

# can also get columns by $
mtcars$mpg
mtcars$cyl

# simplify vs preserve (needless to say you have several options)
mtcars[, 3]                     # returns column 3 and simplies to a vector
mtcars[[3]]                     # returns column 3 and simplies to a vector
mtcars[3]                       # returns colum 3 but preserves as a data frame
mtcars[, 3, drop = FALSE]       # returns colum 3 but preserves as a data frame

rm(list = ls())


##################
# YOUR TURN - #3 #
##################
# 1. read in the aircraft.rds file
aircraft <- readRDS("data/aircraft.rds")

# 2. what are the dimensions of this data frame?
dim(aircraft)

# 3. provide a summary of this data frame
summary(aircraft)

# 4. select the MD, FH, and Cost columns
aircraft[, c("MD", "FH", "Cost")]

# 5. select observations 1-50
aircraft[1:50, ]


###################################
# Data Frame Comparison Operators #
###################################
# create this data frame (it just adds 3 missing values to the mtcars data)
mtcars[sample(1:nrow(mtcars), 3), "mpg"] <- NA

# single value comparison
mtcars > 30             # checks every element in the data frame
mtcars$mpg > 30         # checks every element in the mpg column

# dealing with missing values
is.na(mtcars)                                                       # check for missing values
sum(is.na(mtcars))                                                  # how many missing values are there?
na.omit(mtcars)                                                     # remove all rows with missing values
mtcars[is.na(mtcars)] <- 0                                          # replace missing values with 0
mtcars$mpg[mtcars$mpg == 0] <- NA                                   # replace 0s with NAs
mtcars$mpg[is.na(mtcars$mpg)] <- median(mtcars$mpg, na.rm = TRUE)   # replace missing values with median values


#########################
# Data Frame Operations #
#########################
# use subset to perform conditional subsetting
subset(mtcars, mpg < 16)                   # subset for all observations with mpg less than 16
subset(mtcars, mpg < 16 & hp > 200)        # subset for mpg less than 16 and hp greater than 200
subset(mtcars, mpg < 16, select = mpg:wt)  # subset for mpg less than 16 but return only the variables mpg through wt

# take a look at the iris data
head(iris)

# we can create a new vector that takes sepal length times sepal width
Sepal.Volume <- iris$Sepal.Length * iris$Sepal.Width

# we can easily add this new vector to our data set (note that iris$Sepal.Volume is
# creating a new column to our data set and <- Sepal.Volume is assigning the values
# from our vector to this new column)
iris$Sepal.Volume <- Sepal.Volume

# or we could do this with one fell swoop
iris$Sepal.Volume <- iris$Sepal.Length * iris$Sepal.Width

# we can do basic operators on any column from our data frame
sum(iris$Sepal.Volume)
mean(iris$Sepal.Volume)
median(iris$Sepal.Volume)

# we can also do some calculations across our entire data set. note that for the 
# col/row functions I have to remove the non-numeric variable
summary(iris)
colSums(iris[, which(names(iris) != "Species")])
colMeans(iris[, which(names(iris) != "Species")])
rowSums(iris[, which(names(iris) != "Species")])
rowMeans(iris[, which(names(iris) != "Species")])


##################
# YOUR TURN - #4 #
##################
# 1. read in the aircraft.rds file
aircraft <- readRDS("data/aircraft.rds")

# 2. are there any NAs in this data frame? There are two ways to check.
sum(is.na(aircraft))
summary(aircraft)

# 3. what is the median operating cost across all data?
median(aircraft$Cost)

# 4. subset for observations that exceed the median cost
subset(aircraft, Cost > median(Cost))

# 5. subset for bombers that exceed the median cost and return MD, year, & FHs
subset(aircraft, Type == "Bomber" & Cost > median(Cost), select = c(MD, FY, FH))

rm(list = ls())


###############
# List Basics #
###############
# create these objects
v <- 1:10
m <- matrix(1:15, nrow = 3)
df <- head(iris)

# create lists with list()
list(v, m, df)
named_list <- list(item1 = v, item2 = m, item3 = df)
named_list

# understand your list
str(named_list)
names(named_list)

# why is this important? most statistical results are reported in lists, such as
# this regression model
model_1 <- lm(mpg ~ ., data = mtcars)
str(model_1)
names(model_1)

# we can even add the model_1 list into our named_list list so that we now have 
# a list within a list (mind blowing!)
named_list$item4 <- model_1
str(named_list)
names(named_list)

#################
# List Indexing #
#################
# index by list item. this is extracting the second list item and returning it as
# a list
named_list[2]
named_list['item2']

# double brackets will extract the second list item and simplify (in this case it
# simplifies item2 to a matrix)
named_list[[2]]
named_list[['item2']]

# if the list items are named you can use $ to extract items
named_list$item2

# index elements within list item. this is getting the first row of the second
# list item
named_list[[2]][1,]

# this is getting the list item named residuals from our regression results saved
# in the model_1 list
model_1[['residuals']]
model_1$residuals

rm(list = ls())

##################
# YOUR TURN - #5 #
##################
# 1. read in the aircraft.rds file
aircraft <- readRDS("data/aircraft.rds")

# 2. type this in console: ac_model <- lm(Cost ~ Type + MD + FH, data = aircraft)
ac_model <- lm(Cost ~ Type + MD + FH, data = aircraft)

# 3. what are the names of the items in the ac_model list?
names(ac_model)

# 4. extract the residuals from this list and summarize them?
summary(ac_model$residuals)

# Bonus: are these residuals approximately normally distributed?
hist(ac_model$residuals, breaks = 100)







