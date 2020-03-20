# The mtcars dataset is part of the base R distribution. So we don't have to load it.
# get the help
?mtcars

# Motor Trend Car Road Tests
# Description
# The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).

# Usage
# mtcars
# Format
# A data frame with 32 observations on 11 (numeric) variables.

# [, 1]	mpg	Miles/(US) gallon
# [, 2]	cyl	Number of cylinders
# [, 3]	disp	Displacement (cu.in.)
# [, 4]	hp	Gross horsepower
# [, 5]	drat	Rear axle ratio
# [, 6]	wt	Weight (1000 lbs)
# [, 7]	qsec	1/4 mile time
# [, 8]	vs	Engine (0 = V-shaped, 1 = straight)
# [, 9]	am	Transmission (0 = automatic, 1 = manual)
# [,10]	gear	Number of forward gears
# [,11]	carb	Number of carburetors
# Source
# Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.

# Examples
# require(graphics)
# pairs(mtcars, main = "mtcars data", gap = 1/4)
# coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
#        panel = panel.smooth, rows = 1)
# ## possibly more meaningful, e.g., for summary() or bivariate plots:
# mtcars2 <- within(mtcars, {
#    vs <- factor(vs, labels = c("V", "S"))
#    am <- factor(am, labels = c("automatic", "manual"))
#    cyl  <- ordered(cyl)
#    gear <- ordered(gear)
#    carb <- ordered(carb)
# })
# summary(mtcars2)


# see all of the variable names
names(mtcars)


# see the first 6 observations
head(mtcars)

# write the data.frame to a csv
write.csv(mtcars, "mtcars.csv")

# read in the data from the csv and show the first 6 observations
cars = read.csv("mtcars.csv")
head(cars)

# Plotting (Instructor)
# scatter plot of horsepower on miles per gallon
plot(
    mtcars$hp,
    mtcars$mpg,
    col="red",
    main="Horsepower vs MPG",
    xlab="Horsepower",
    ylab="MPG",
    pch=20
)


# make a box plot of mpg by transmission
boxplot(
    mpg ~ am,
    data=mtcars,
    col="red",
    xlab="Transmission \n (Automatic=0, Manual=1)",
    ylab="MPG",
    main = "Cylinders on MPG"
)

# make a histogram for MPG
hist(
    mtcars$mpg,
    breaks=10,
    col="red",
    xlab="MPG",
    main="Histogram of MPG",
)

# automatically plot everything in the data.frame
plot(mtcars)

# loop over names
for (name in names(mtcars)){
    print(name)
}

