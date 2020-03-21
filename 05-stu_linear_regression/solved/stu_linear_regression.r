# Fuel Efficiency Analysis¶
# Linear Regression (Student)
# Instructions:

# Make a model for mpg with the mtcars data
# Optionally, remove "outliers"
# Be sure to test your model against simpler nested models
# Check the diagnostic plots!

# fit a linear model of horsepower, weight and thier interaction on mpg
lm_hp_wt = lm(mpg ~ hp + wt, data=mtcars)
lm_hp_wt_i = lm(mpg ~ hp * wt, data=mtcars)

# see the details of the model
summary(lm_hp_wt_i)

# do an F-test comparing the model to the multivariate one
anova(lm_hp_wt_i, lm_hp_wt)

# show the diagnostic plots
par(mfrow=c(2, 2))
plot(lm_hp_wt_i)

