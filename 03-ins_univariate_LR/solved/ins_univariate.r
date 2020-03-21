# Fuel Efficiency Analysis
# Univariate Linear Regression (Instructor)

# see the attributes of the lm object
names(lm_univariate)


# get the coefficient with coef
coef(lm_univariate)


# see more details about the model
summary(lm_univariate)


# use the univariate model to predict the mpg for the horsepower's 90, 100 and 120
predict(lm_univariate, data.frame(hp=c(90, 100, 120)))

# get the confidence intervals along with the predictions
predict(
    lm_univariate,
    data.frame(hp=c(90, 100, 120)),
    interval="confidence"
)


# get the prediction intervals along with the predictions
predict(
    lm_univariate,
    data.frame(hp=c(90, 100, 120)),
    interval="prediction"
)

# plot horsepower v.s. mpg with trendline from the univariate model
plot(
    mtcars$hp,
    mtcars$mpg,
    xlab = "Horsepower",
    ylab = "MPG",
    main = "Horsepower vs MPG",
    pch = 20
)

abline(
    lm_univariate,
    lwd=3,
    col="red"
)

# show the diagnositc plots
par(mfrow=c(2,2))
plot(lm_univariate)

