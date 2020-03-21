
# Fuel Efficiency Analysis
# Best Subset Selection (Student)
# Instructions:

# Run subset selection on the mtcars data
# Does the R-squared always increase and RSS always decrease when the model has more variables? Why?
# Generate line plots of RSS, Adjusted R-squared, Cp and BIC vs number of features
# Show the coefficients of the best model and interpret it


# load the leaps library which is available in conda's r channel
# see the instructions in install-instructions/README.md
library(leaps)

# use subset selection to find the best model for mpg for every number of variables

to = proc.time()

reg_fit_full = regsubsets(mpg ~ ., data=mtcars, nvmax=10)
tf = proc.time()
tf - to

reg_summary = summary(reg_fit_full)
reg_summary

# see the R-squared for the best model with idx variables
reg_summary$rsq


# plot number of variables for the best model against the associated RSS, Adjusted R-Squared, Cp and BIC. 
par(mfrow=c(2, 2))

plot(reg_summary$rss, xlab="Number of Variables", ylab="RSS", type="l")
points(
    which.min(reg_summary$rss),
    min(reg_summary$rss),
    col="red",
    cex=2,
    pch=20
)

plot(reg_summary$adjr2, xlab="Number of Variables", ylab="Adjusted RSq", type="l")
points(
    which.max(reg_summary$adjr2),
    max(reg_summary$adjr2),
    col="red",
    cex=2,
    pch=20
)

plot(reg_summary$cp, xlab="Number of Variables", ylab="Cp", type="l")
points(
    which.min(reg_summary$cp),
    min(reg_summary$cp),
    col="red",
    cex=2,
    pch=20
)

plot(reg_summary$bic, xlab="Number of Variables", ylab="BIC", type="l")
points(
    which.min(reg_summary$bic),
    min(reg_summary$bic),
    col="red",
    cex=2,
    pch=20
)

# see the coefficients for the best model with 3 variables
coef(reg_fit_full, 3)