# The mtcars dataset is part of the base R distribution. So we don't have to load it.
# get the help
?mtcars

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

