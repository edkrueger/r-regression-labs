# Fuel Efficiency Analysis
# Univariate Linear Regression (Instructor)

# see the attributes of the lm object
names(lm_univariate)

# 'coefficients'
# 'residuals'
# 'effects'
# 'rank'
# 'fitted.values'
# 'assign'
# 'qr'
# 'df.residual'
# 'xlevels'
# 'call'
# 'terms'
# 'model'


# get the coefficient with coef
coef(lm_univariate)

# (Intercept)
# 30.0988605396225
# hp
# -0.0682282780715637


# see more details about the model
summary(lm_univariate)


# Call:
# lm(formula = mpg ~ hp, data = mtcars)

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -5.7121 -2.1122 -0.8854  1.5819  8.2360 

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 30.09886    1.63392  18.421  < 2e-16 ***
# hp          -0.06823    0.01012  -6.742 1.79e-07 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 3.863 on 30 degrees of freedom
# Multiple R-squared:  0.6024,	Adjusted R-squared:  0.5892 
# F-statistic: 45.46 on 1 and 30 DF,  p-value: 1.788e-07

# use the univariate model to predict the mpg for the horsepower's 90, 100 and 120
predict(lm_univariate, data.frame(hp=c(90, 100, 120)))

# 1
# 23.9583155131818
# 2
# 23.2760327324661
# 3
# 21.9114671710348



# get the confidence intervals along with the predictions
predict(
    lm_univariate,
    data.frame(hp=c(90, 100, 120)),
    interval="confidence"
)


# fit	lwr	upr
# 1	23.95832	22.13692	25.77971
# 2	23.27603	21.58017	24.97190
# 3	21.91147	20.41174	23.41120

# get the prediction intervals along with the predictions
predict(
    lm_univariate,
    data.frame(hp=c(90, 100, 120)),
    interval="prediction"
)

# 	fit	lwr	upr
# 1	23.95832	15.86157	32.05506
# 2	23.27603	15.20660	31.34547
# 3	21.91147	13.88096	29.94197

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

