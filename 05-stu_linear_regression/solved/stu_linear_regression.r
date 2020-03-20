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

# Call:
# lm(formula = mpg ~ hp * wt, data = mtcars)

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -3.0632 -1.6491 -0.7362  1.4211  4.5513 

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 49.80842    3.60516  13.816 5.01e-14 ***
# hp          -0.12010    0.02470  -4.863 4.04e-05 ***
# wt          -8.21662    1.26971  -6.471 5.20e-07 ***
# hp:wt        0.02785    0.00742   3.753 0.000811 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 2.153 on 28 degrees of freedom
# Multiple R-squared:  0.8848,	Adjusted R-squared:  0.8724 
# F-statistic: 71.66 on 3 and 28 DF,  p-value: 2.981e-13

# do an F-test comparing the model to the multivariate one
anova(lm_hp_wt_i, lm_hp_wt)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 28	129.7615	NA	NA	NA	NA
# 29	195.0478	-1	-65.28626	14.0875	0.0008108307

# show the diagnostic plots
par(mfrow=c(2, 2))
plot(lm_hp_wt_i)

