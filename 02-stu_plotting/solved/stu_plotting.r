# Fuel Efficiency Analysis
# Plotting (Student)
# Instructions:

# Make a scatter plot of Weight vs MPG
# Make a histogram of Horsepower
# Make a boxplot of MPG explained by Engine Configuration
# Bonus: Using loop make a histogram of every variable

# scatter plot of weight on miles per gallon
plot(
    mtcars$wt,
    mtcars$mpg,
    col="red",
    main="Weight vs MPG",
    xlab="Weight",
    ylab="MPG",
    pch=20
)

# make a histogram for Horsepower
hist(
    mtcars$hp,
    breaks=10,
    col="red",
    xlab="Horsepower",
    main="Histogram of Horsepower",
)

# make a boxplot of engine configuration on MPG
boxplot(
    mpg ~ vs,
    data=mtcars,
    col="red",
    xlab="Configuration \n (V-shaped=0, Straight=1)",
    ylab="MPG",
    main = "Configuration on MPG"
)

# histogram of all variables
par(mfrow=c(3, 4))

for (name in names(mtcars)){
    hist(
        mtcars[, name],
        main=paste("Histogram of ", name, sep = ""),
        xlab=name,
        col="red"
    )
}

