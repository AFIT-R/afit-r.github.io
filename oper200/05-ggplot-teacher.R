# Session 5: Data visualization with ggplot

##################
# TODAY'S TOPICS #
##################
# base layer & aesthetics
# geoms
# facets
# fitting patterns
# axes, scales & coordinates
# themes

#######################
# package & data used #
#######################
# ggplot2 is "the" (like "the" Ohio State University) graphical package for R.
# you can perform visualizations with base R (see https://afit-r.github.io/quickplots);
# however, the is no substitution for ggplot2 for creating great visualizations
# install.packages("ggplot2")
library(ggplot2)
library(dplyr)

# built-in data that we will use
mpg
economics
economics_long


###########################
# base layer & aesthetics #
###########################
# base layer - this just tells R that we are going to plot data from the mpg data frame
ggplot(data = mpg)

# map aesthetics - next we need to tell R what variables we want to map to x & y
# coordinates (ggplot considers these aesthetics hence the aes() argument)
ggplot(mpg, aes(x = hwy))
ggplot(mpg, aes(x = displ, y = hwy))


#########
# geoms #
#########
# to actually start plotting bars, lines, boxplots to our blank canvas we need to
# tell R what geometric shapes we want to represent our data (aka geoms) see the 
# many geom options at ??geom
?geom_histogram()
?geom_freqpoly()
?geom_density()
?geom_bar()
?geom_point()
?geom_line()
?geom_boxplot()

# lets start adding some geoms to our data

# histogram
ggplot(mpg, aes(x = hwy)) + geom_histogram()

# frequency polygram
ggplot(mpg, aes(x = hwy)) + geom_freqpoly()

# density
ggplot(mpg, aes(x = hwy)) + geom_density()

# bar charts are unique.  We can perform the following if we just want to have
# our bar chart represent the counts of a specific variable
ggplot(mpg, aes(x = manufacturer)) + geom_bar()

# however, sometimes we have data like this where we may want to have a bar chart
# display the mean hwy mpg for each manufacturer
mpg_by_manuf <- mpg %>%
        group_by(manufacturer) %>%
        summarise(hwy = mean(hwy))

# to plot this type of bar chart we need to include the y-axis variable and then 
# include the stat = "identity" argument to tell ggplot to use the actual values 
# of hwy mpg rather than counts (stat = "count" is the default setting)
ggplot(mpg_by_manuf, aes(x = manufacturer, y = hwy)) + 
        geom_bar(stat = "identity")

# scatter plot
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

# line chart
ggplot(economics, aes(date, uempmed)) + geom_line()

# box plot
ggplot(mpg, aes(manufacturer, hwy)) + geom_boxplot()


# we can also add parameters inside our geom functions to change the formatting
# of our geometric shapes representing our data
ggplot(mpg, aes(x = hwy)) + 
        geom_histogram(color = "grey40", fill = "white", bins = 25)

ggplot(mpg, aes(x = manufacturer)) + 
        geom_bar(color = "grey40", fill = "white")

ggplot(mpg, aes(x = displ, y = hwy)) + 
        geom_point(color = "red", size = 2)


##################
# YOUR TURN - #1 #
##################
# 1. import ws_data.csv
ws_data <- read.csv("data/ws_data.csv", stringsAsFactors = FALSE)

# 2. create a histogram of flying hours for all aircraft ws systems
Q2 <- ws_data %>% filter(System == "AIRCRAFT")

ggplot(Q2, aes(FH)) +
        geom_histogram(bins = 100, color = "grey40", fill = "white")

# 3. create a bar chart that plots total end strength for each system in 2014
Q3 <- ws_data %>%
        filter(FY == 2014) %>%
        group_by(System) %>%
        summarise(End_Strength = sum(End_Strength, na.rm = TRUE)) %>%
        arrange(desc(End_Strength)) %>%
        mutate(System = factor(System, levels = System))

ggplot(Q3, aes(System, End_Strength)) +
        geom_bar(stat = "identity")

# 4. create a scatter plot that assesses the relationship between TAI and
#    maintenance consumables for aircraft weapon systems
Q4 <- ws_data %>% filter(System == "AIRCRAFT") 

ggplot(Q4, aes(TAI, Mx_Consumables)) +
        geom_point()

# 5. create a line chart that plots total flying hours by year
ws_data %>%
        group_by(FY) %>%
        summarise(FH = sum(FH, na.rm = TRUE)) %>%
        ggplot(aes(FY, FH)) +
        geom_line()


######################
# back to aesthetics #
######################
# we can use additional aesthetics to plot more variable features
# color, size, shape, alpha

ggplot(mpg, aes(x = hwy, color = factor(year))) +
        geom_freqpoly(bins = 15)

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
        geom_point()

ggplot(mpg, aes(x = manufacturer, fill = factor(year))) +
        geom_bar()

ggplot(mpg, aes(x = manufacturer, fill = factor(year))) +
        geom_bar(position = "dodge")

two_lines <- filter(economics_long, variable == "psavert" | variable == "uempmed")

ggplot(two_lines, aes(date, value, color = variable)) +
        geom_line()




##########
# facets #
##########
# use facet_wrap() & facet_grid() for small multiples

# compare these two
ggplot(mpg, aes(x = hwy, color = factor(year))) +
        geom_freqpoly(bins = 15)

ggplot(mpg, aes(x = hwy)) +
        geom_freqpoly(bins = 15) +
        facet_wrap(~ year)

# specify number of rows or columns
ggplot(mpg, aes(x = displ, y = hwy)) +
        geom_point() +
        facet_wrap(~ class, ncol = 4)

# you can also add an additional dimension with facet_grid
ggplot(mpg, aes(x = displ, y = hwy)) +
        geom_point() +
        facet_grid(cyl ~ year)



##################
# YOUR TURN - #2 #
##################
# 1. import ws_data.csv
ws_data <- read.csv("data/ws_data.csv", stringsAsFactors = FALSE)

# 2. create a scatter plot that shows the relationship between end strength
#    and total O&S costs
ggplot(ws_data, aes(End_Strength, Total_O.S)) +
        geom_point(alpha = .2)

# 3. compare this same relationship between the different systems (aircraft,
     # missiles, munitions, etc.)
ggplot(ws_data, aes(End_Strength, Total_O.S, color = System)) +
        geom_point()

ggplot(ws_data, aes(End_Strength, Total_O.S)) +
        geom_point() +
        facet_wrap(~ System, nrow = 2)

# 4. visually assess the historical total flying hours by base. can you identify
#    the bases with some significant flying hour changes?
Q4 <- ws_data %>%
        filter(!is.na(FH)) %>%
        group_by(Base, FY) %>%
        summarise(FH = sum(FH))

ggplot(Q4, aes(FY, FH)) +
        geom_line() +
        facet_wrap(~Base, ncol = 6)



####################
# fitting patterns #
####################
# basic scatter plot
ggplot(mpg, aes(displ, hwy)) +
        geom_point()

# fit a smoother (default is loess)
ggplot(mpg, aes(displ, hwy)) +
        geom_smooth()

# fit a linear smoother
ggplot(mpg, aes(displ, hwy)) +
        geom_smooth(method = "lm")

# layer geoms
ggplot(mpg, aes(displ, hwy)) +
        geom_point() +
        geom_smooth(se = FALSE)

# color points
ggplot(mpg, aes(displ, hwy, color = drv)) + 
        geom_point() + 
        geom_smooth(se = FALSE)

# color both points & smoother
ggplot(mpg, aes(displ, hwy, color = drv)) + 
        geom_point() + 
        geom_smooth(se = FALSE) +
        facet_wrap(~ drv)



##################
# YOUR TURN - #3 #
##################
# plot manpower ops costs against flying hours for the F-16 weapon system and 
# fit a smoother. which appears to fit better LOESS vs. linear?
Q1 <- ws_data %>%
        filter(MD == "F-16" & !is.na(FH))

ggplot(Q1, aes(FH, Manpower_Ops)) +
        geom_point() +
        geom_smooth(se = FALSE)

ggplot(Q1, aes(FH, Manpower_Ops)) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE)


##############################
# axes, scales & coordinates #
##############################
# Shorthand axis labels with ylab & xlab
ggplot(mpg, aes(cty, hwy)) +
        geom_jitter() +
        ylab("Highway driving (mpg)") +
        xlab(quote(a + mathematical ^ expression))

# Remove the axis labels with NULL
ggplot(mpg, aes(cty, hwy)) +
        geom_jitter() +
        ylab(NULL) +
        xlab(NULL) +
        ggtitle("Title")


# shorthand axis scale adjustments
ggplot(mpg, aes(cty, hwy)) +
        geom_jitter() +
        xlim(10, 30)

# note that this removes observations outside of scale parameters
ggplot(mpg, aes(x = hwy)) +
        geom_histogram(bins = 30, color = "grey40", fill = "white") +
        ylim(NA, 30)

# use coord cartesian to zoom in without losing observations
ggplot(mpg, aes(x = hwy)) +
        geom_histogram(bins = 30, color = "grey40", fill = "white") +
        coord_cartesian(ylim = c(0, 30))

# use coord_flip to "flip" coordinates
ggplot(mpg, aes(x = manufacturer)) +
        geom_bar() +
        coord_flip()

# use scale_... for more thorough changes to axes/scales
ggplot(mpg, aes(displ, hwy)) +
        geom_point(aes(colour = class)) + 
        scale_x_continuous(name = "Displacement",
                           limits = c(2, 7),
                           breaks = c(2, 4.5, 7), 
                           labels = scales::dollar)

# there are several scale transformations that are useful 
?scale_y_log10()
?scale_y_sqrt()
?scale_y_reverse()


##################
# YOUR TURN - #4 #
##################
# plot manpower ops costs against flying hours for the F-16 weapon system and 
# fit a LOESS smoother. Use scale_x_continous and scale_y_continuous to improve
# the axis formatting.
Q1 <- ws_data %>%
        filter(MD == "F-16" & !is.na(FH))

ggplot(Q1, aes(FH, Manpower_Ops/1000000)) +
        geom_point() +
        geom_smooth(se = FALSE) +
        scale_x_continuous("Flying Hours", 
                           labels = scales::comma,
                           breaks = seq(0, 60000, by = 10000)) +
        scale_y_continuous("Operational Manpower ($M)",
                           labels = scales::dollar)


##########
# themes #
##########
# there are many built in theme options
?theme_classic()
?theme_minimal()
?theme_dark()

# add a theme to your plot
ggplot(mpg, aes(cty, hwy)) +
        geom_jitter() +
        theme_minimal()


# the ggthemes packages provides even more
# install.packages("ggthemes")
library(ggthemes)

?theme_economist()
?theme_fivethirtyeight()
?theme_tufte()

ggplot(mpg, aes(cty, hwy)) +
        geom_jitter() +
        theme_tufte()

ggplot(mpg, aes(cty, hwy)) +
        geom_jitter() +
        theme_fivethirtyeight()


# theme() also allows you to customize your graphics
ggplot(mpg, aes(cty, hwy, color = drv)) +
        geom_jitter() +
        labs(title = "Highway versus City Fuel Economy",
             x = "City MPG",
             y = "Highway MPG") +
        theme_minimal() +
        theme(
                text = element_text(family = "Georgia"),
                plot.title = element_text(face = "bold", size = 16), 
                legend.position = "top",
                panel.grid.major.y = element_line(linetype = "dashed", color = "darkgray"),
                panel.grid.major.x = element_blank(),
                panel.grid.minor = element_blank()
        )

# check out all the options at
?theme


##################
# YOUR TURN - #5 #
##################
# plot manpower ops costs against flying hours for the F-16 weapon system and 
# fit a LOESS smoother. Use scale_x_continous and scale_y_continuous to improve
# the axis formatting and theme() to adjust the overall graphic formatting.
Q1 <- ws_data %>%
        filter(MD == "F-16" & !is.na(FH))

ggplot(Q1, aes(FH, Manpower_Ops/1000000)) +
        geom_point() +
        geom_smooth(se = FALSE) +
        scale_x_continuous("Flying Hours", 
                           labels = scales::comma,
                           breaks = seq(0, 60000, by = 10000)) +
        scale_y_continuous("Operational Manpower ($M)",
                           labels = scales::dollar) +
        labs(title = "Influence of flying hours on operational manpower costs",
             subtitle = "Flying hours appears to have a direct yet diminishing influence on operational manpower costs for the F-16 weapon system.",
             caption = "AFTOC: Data pulled on Jan 14, 2015") +
        theme_minimal() +
        theme(
                text = element_text(family = "Georgia"),
                plot.title = element_text(face = "bold", size = 24, margin = margin(b = 10)),
                plot.subtitle = element_text(size = 12, color = "darkslategrey", margin = margin(b = 25)),
                plot.caption = element_text(size = 8, margin = margin(t = 10), color = "grey70", hjust = 0),
                axis.title.x = element_text(size = 12, margin = margin(t = 20)),
                axis.title.y = element_text(size = 12, margin = margin(r = 20)),
                axis.text = element_text(size = 12),
                panel.grid.major.y = element_line(linetype = "dashed", color = "darkgray"),
                panel.grid.major.x = element_blank(),
                panel.grid.minor = element_blank()
        )


