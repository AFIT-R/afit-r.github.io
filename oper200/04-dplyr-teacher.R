# Session 4: Transforming & manipulating data

##################
# TODAY'S TOPICS #
##################
# select()
# filter()
# group_by()
# summarize()
# arrange()
# mutate()
# joins




################
# Requirements #
################
# install.packages("dplyr")
# install.packages("nycflights13")

library(dplyr)
library(nycflights13)


# data used (from the nycflights13 package)
airlines
airports
flights
planes
weather



############
# select() #
############
# you can select variables with the select() function
select(flights, year, month, day)               # select year, month, day variables
flights %>% select(year, month, day)

# other ways to select columns
select(flights, year:day)                       # select variables year-day
select(flights, -(year:day))                    # de-select variables year-day

select(flights, starts_with("dep"))             # select variables that start with "dep"
select(flights, ends_with("delay"))             # select variables that end with "delay"
select(flights, contains("arr"))                # select variables that contain "arr

# renaming variables
select(flights, yr = year, mo = month, day)     # select variables year, month, day and rename them
rename(flights, yr = year, mo = month)          # keep all variables but rename the year & month variables



##############
# YOUR TURN! #
##############
# Import the ws-programmatics.csv file in the data folder
ws_programmatics <- read.csv("data/ws-programmatics.csv", 
                             stringsAsFactors = FALSE)

# select the following variables: Base, MD, FY, TAI, & FH
ws_programmatics %>% select(Base:FY, TAI, FH)

# select Base, MD, FY and all variables that contain "Depot"
ws_programmatics %>% select(Base:FY, contains("Depot"))

# select Base, MD, FY and all variables that start with "Manpower"
ws_programmatics %>% select(Base:FY, starts_with("Manpower"))




############
# filter() #
############
# we can filter data for conditional statements much like we used subset() for
# these two options are the same in which we filter the flights data frame for
# only observations where the arr_delay variable is equal to or greater than 300
filter(flights, arr_delay >= 60 * 5)
flights %>% filter(arr_delay >= 60 * 5)

# can filter for multiple conditions
flights %>% filter(month == 12 | month == 10)
flights %>% filter(arr_delay >= 60 * 5 & dep_delay < 60 * 5)

# note that fights data has a lot of missing values
sum(is.na(flights))

# we can filter out NAs in two ways. na.omit() will remove all rows with any missing
# values
flights %>% na.omit()

# where this option will only filter out missing values for the dep_time and dep_delay
# variables
flights %>% filter(!is.na(dep_time) | !is.na(dep_delay))


# alternate row filterings
slice(flights, 10:20)           # get rows 10-20
distinct(flights, carrier)      # list all unique values of a variable
sample_n(flights, 100)          # sample a defined number of rows from our data
sample_frac(flights, .1)        # sample a defined fraction of rows from our data


##############
# YOUR TURN! #
##############
# Import the ws-programmatics.csv file in the data folder
ws_programmatics <- read.csv("data/ws-programmatics.csv", stringsAsFactors = FALSE)

# filter for all A-10 aircraft with more than 2,000 flying hours
ws_programmatics %>% 
        filter(MD == "A-10", FH > 2000)

# filter for all RC-135 aircraft observations that do not have missing  
# end strength values
ws_programmatics %>%
        filter(MD == "RC-135", !is.na(End_Strength))

# select variables Base, MD, FY, TAI, & FH and filter out NAs from the  
# TAI & FH variables
ws_programmatics %>%
        select(Base:FY, TAI, FH) %>%
        filter(!is.na(TAI), !is.na(FH))




##############
# group_by() #
##############
# we use group_by() to group our data by the levels of a specific variable(s). 
# these two options are the same in that they group the flights data by month
group_by(flights, month)
flights %>% group_by(month)

# group by multiple categorical variables
flights %>% group_by(month, day, carrier)



##############
# YOUR TURN! #
##############
# select variables Base, MD, FY, TAI, & FH and filter out NAs from the  
# TAI & FH variables and group by Base & FY
ws2 <- ws_programmatics %>%
        select(Base:FY, TAI, FH) %>%
        filter(!is.na(TAI), !is.na(FH)) %>%
        group_by(Base, FY)




###############
# summarise() #
###############
# we can summarize our data with summerise (note that summarize() will work as well)
# these are the same in that they compute the mean for the arr_delay variable
summarise(flights, mean_arr_delay = mean(arr_delay, na.rm = TRUE))
flights %>% summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE))

# get multiple summary statistics of a single variable
flights %>% summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE),
                      median_arr_delay = median(arr_delay, na.rm = TRUE),
                      sd_arr_delay = sd(arr_delay, na.rm = TRUE),
                      n = n())


# combine group_by() and summarise()
flights %>%
        group_by(carrier) %>%
        summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE),
                  median_arr_delay = median(arr_delay, na.rm = TRUE),
                  sd_arr_delay = sd(arr_delay, na.rm = TRUE),
                  n = n())

# we can use summarise_each as a convenient way to get summary statistics of multiple 
# variables without having to type a lot
flights %>% 
        select(carrier, dep_delay, arr_delay) %>%
        group_by(carrier) %>%
        summarise_each(funs(mean(., na.rm = TRUE)))

flights %>% 
        select(carrier, dep_delay, arr_delay) %>%
        group_by(carrier) %>%
        summarise_each(funs(mean(., na.rm = TRUE),
                            sd(., na.rm = TRUE)))



##############
# YOUR TURN! #
##############
# Continuing with our ws_programmatics data...
# 1. Calculate the median for TAI & FH
ws_programmatics %>% 
        summarise(TAI_med = median(TAI, na.rm = TRUE),
                  FH_med = median(FH, na.rm = TRUE))


# 2. group by Base and MD and calculate median for all variables
ws_programmatics %>% 
        group_by(Base, MD) %>%
        summarise_each(funs(median(., na.rm = TRUE)))

# 3. calculate the historical mean and standard deviation TAI and FH for  
# the following MDs: A-10, F-16, F-15
fighters <- c("A-10", "F-16", "F-15", "F-22", "F-35")

ws_programmatics %>%
        select(MD, TAI, FH) %>%
        filter(MD %in% fighters) %>%
        group_by(MD) %>%
        summarise_each(funs(mean(., na.rm = TRUE),
                            sd(., na.rm = TRUE)))


#############
# arrange() #
#############
# we use arrange() to order our data by a specific variable(s) in ascending 
flights %>% arrange(arr_delay)

# or descending order
flights %>% arrange(desc(arr_delay))

# here we group our data by carrier, compute the median for arr_delay and then
# arrange in descending order
flights %>%
        group_by(carrier) %>%
        summarise(median_arr_delay = median(arr_delay, na.rm = TRUE)) %>%
        arrange(desc(median_arr_delay))


##############
# YOUR TURN! #
##############
# Continuing with our ws_programmatics data...

# calculate the historical mean and standard deviation TAI and FH for the 
# following MDs: A-10, F-16, F-15 and order mean FH in descending order
ws_programmatics %>%
        select(MD, TAI, FH) %>%
        filter(MD %in% fighters) %>%
        group_by(MD) %>%
        summarise_each(funs(mean(., na.rm = TRUE),
                            sd(., na.rm = TRUE))) %>%
        arrange(desc(FH_mean))




############
# mutate() #
############
# we use mutate() to create a new variable to our data frame. here we select
# specific variables in our flights data frame and then we create a new variable
# called "gain" that equals dep_delay minus arr_delay
flights %>% 
        select(year:day, ends_with("delay"), distance, air_time) %>%
        mutate(gain = dep_delay - arr_delay)

# we can use transmute() to create a new variable but drop all the original columns
flights %>% 
        transmute(gain = dep_delay - arr_delay,
                  speed = distance / air_time * 60)


# here we create two new variables (gain & speed), arrange in ascending order by the
# gain variable and then we use mutate_each to apply a function to each variable - in 
# this case the function min_rank computes the rankings
# value for each variable
flights %>% 
        transmute(gain = dep_delay - arr_delay,
                  speed = distance / air_time * 60) %>%
        arrange(gain) %>%
        mutate_each(funs(min_rank))



##############
# YOUR TURN! #
##############
# Continuing with our ws_programmatics data...

# 1. Create a new variable "CPFH" that equals total O&S cost / flying hours
ws_programmatics %>%
        mutate(CPFH = Total_O.S / FH)

# 2. filter for only MDs that have greater than 0 flying hours in 2014, sum 
# total O&S costs and flying hours by MD, create the CPFH variable, and arrange 
# MDs from largest to smallest CPFH rates
ws_programmatics %>%
        filter(FY == 2014 & FH > 0) %>%
        group_by(MD) %>%
        summarise(Total_O.S = sum(as.double(Total_O.S), na.rm = TRUE),
                  FH = sum(FH, na.rm = TRUE)) %>%
        mutate(CPFH = Total_O.S / FH) %>%
        arrange(desc(Total_O.S))




#########
# joins #
#########
# there are different ways to join data sets. here we will work with data frames 
# a and b
a <- data.frame(x1 = c("A", "B", "C"),
                x2 = 1:3, 
                stringsAsFactors = FALSE)
b <- data.frame(x1 = c("A", "B", "D"),
                x2 = c(T, F, T),
                stringsAsFactors = FALSE)

# left_join
a %>% left_join(b, by = "x1")

# right_join
a %>% right_join(b, by = "x1")

# inner_join
a %>% inner_join(b, by = "x1")

# full_join
a %>% full_join(b, by = "x1")

# semi_join
a %>% semi_join(b, by = "x1")

# anti_join
a %>% anti_join(b, by = "x1")



##############
# YOUR TURN! #
##############
# 1. Import the ws_programmatics & ws_categorization data
ws_programmatics <- read.csv("data/ws-programmatics.csv", stringsAsFactors = FALSE)
ws_categorizations <- read.csv("data/ws-categorization.csv", stringsAsFactors = FALSE)

# 2. In 2014, what was the total O&S costs and end strength numbers for all aircraft
# and missile systems at Minot AFB
ws_programmatics %>%
        left_join(ws_categorizations) %>%
        filter(Base == "MINOT AFB (ND)",
               System == "AIRCRAFT" | System == "MISSILES" ) %>%
        group_by(System) %>%
        summarise(Total_O.S = sum(as.double(Total_O.S), na.rm = TRUE),
                  End_Strength = sum(End_Strength, na.rm = TRUE))











