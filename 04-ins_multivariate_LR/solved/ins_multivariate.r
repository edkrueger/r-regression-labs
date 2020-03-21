# Fuel Efficiency Analysis
# Multivariate Linear Regression (Instructor)
# More than one regressor

# fit the univariate model
lm_univariate = lm(mpg ~ hp, data=mtcars)

# fit a linear model of horsepower and weight on mpg
lm_multivariate = lm(mpg ~ hp + wt, data=mtcars)

# see the details of the model
summary(lm_multivariate)

# do an F-test comparing the univariate model to the multivariate one
anova(lm_multivariate, lm_univariate)

# show the diagnostic plots
par(mfrow=c(2, 2))
plot(lm_multivariate)

# fit a linear model of every varialble on mpg
lm_kitchen = lm(mpg ~ ., data=mtcars)

# see the details of the model
summary(lm_kitchen)

# do an F-test comparing the kitchen sink to the multivariate model
anova(lm_kitchen, lm_multivariate)

# fit a linear model of horsepower, displacement and their interaction on mpg
lm_interaction = lm(mpg ~ hp * disp, data=mtcars)

# see the details of the model
summary(lm_interaction)

# do an F-test comparing the model to the multivariate one
anova(lm_interaction, lm_multivariate)

# do an F-test comparing the model to the univariate one
anova(lm_interaction, lm_univariate)

# show the diagnostic plots
par(mfrow=c(2, 2))
plot(lm_interaction)


# fit the model regressing horsepower and it square on mpg
lm_quadratic = lm(mpg ~ poly(hp, 2), data=mtcars)

# show some details of the quadratic model
summary(lm_quadratic)

# use an F-test to compare the univariate and quadratic models
anova(lm_quadratic, lm_univariate)

# fit the cubic model of horsepower on mpg
lm_cubic = lm(mpg ~ poly(hp, 3), data=mtcars)

summary(lm_cubic)

# use an F-test to compare the cubic and quadratic models
anova(lm_cubic, lm_quadratic)

# show the diagnostic plots for the quadratic model
par(mfrow=c(2, 2))
plot(lm_quadratic)

