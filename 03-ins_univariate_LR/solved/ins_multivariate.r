
# Fuel Efficiency Analysis
# Multivariate Linear Regression (Instructor)
# More than one regressor


# fit the univariate model
lm_univariate = lm(mpg ~ hp, data=mtcars)

# fit a linear model of horsepower and weight on mpg
lm_multivariate = lm(mpg ~ hp + wt, data=mtcars)

# see the details of the model
summary(lm_multivariate)

# Call:
# lm(formula = mpg ~ hp + wt, data = mtcars)

# Residuals:
#    Min     1Q Median     3Q    Max 
# -3.941 -1.600 -0.182  1.050  5.854 

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 37.22727    1.59879  23.285  < 2e-16 ***
# hp          -0.03177    0.00903  -3.519  0.00145 ** 
# wt          -3.87783    0.63273  -6.129 1.12e-06 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 2.593 on 29 degrees of freedom
# Multiple R-squared:  0.8268,	Adjusted R-squared:  0.8148 
# F-statistic: 69.21 on 2 and 29 DF,  p-value: 9.109e-12


# do an F-test comparing the univariate model to the multivariate one
anova(lm_multivariate, lm_univariate)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 29	195.0478	NA	NA	NA	NA
# 30	447.6743	-1	-252.6266	37.56091	1.119647e-06

# show the diagnostic plots
par(mfrow=c(2, 2))
plot(lm_multivariate)

# fit a linear model of every varialble on mpg
lm_kitchen = lm(mpg ~ ., data=mtcars)

# see the details of the model
summary(lm_kitchen)

# Call:
# lm(formula = mpg ~ ., data = mtcars)

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -3.4506 -1.6044 -0.1196  1.2193  4.6271 

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)  
# (Intercept) 12.30337   18.71788   0.657   0.5181  
# cyl         -0.11144    1.04502  -0.107   0.9161  
# disp         0.01334    0.01786   0.747   0.4635  
# hp          -0.02148    0.02177  -0.987   0.3350  
# drat         0.78711    1.63537   0.481   0.6353  
# wt          -3.71530    1.89441  -1.961   0.0633 .
# qsec         0.82104    0.73084   1.123   0.2739  
# vs           0.31776    2.10451   0.151   0.8814  
# am           2.52023    2.05665   1.225   0.2340  
# gear         0.65541    1.49326   0.439   0.6652  
# carb        -0.19942    0.82875  -0.241   0.8122  
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 2.65 on 21 degrees of freedom
# Multiple R-squared:  0.869,	Adjusted R-squared:  0.8066 
# F-statistic: 13.93 on 10 and 21 DF,  p-value: 3.793e-07

# do an F-test comparing the kitchen sink to the multivariate model
anova(lm_kitchen, lm_multivariate)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 21	147.4944	NA	NA	NA	NA
# 29	195.0478	-8	-47.55332	0.8463199	0.5739245

# fit a linear model of horsepower, displacement and their interaction on mpg
lm_interaction = lm(mpg ~ hp * disp, data=mtcars)

# see the details of the model
summary(lm_interaction)

# Call:
# lm(formula = mpg ~ hp * disp, data = mtcars)

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -3.5153 -1.6315 -0.6346  0.9038  5.7030 

# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.967e+01  2.914e+00  13.614 7.18e-14 ***
# hp          -9.789e-02  2.474e-02  -3.956 0.000473 ***
# disp        -7.337e-02  1.439e-02  -5.100 2.11e-05 ***
# hp:disp      2.900e-04  8.694e-05   3.336 0.002407 ** 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 2.692 on 28 degrees of freedom
# Multiple R-squared:  0.8198,	Adjusted R-squared:  0.8005 
# F-statistic: 42.48 on 3 and 28 DF,  p-value: 1.499e-10

# do an F-test comparing the model to the multivariate one
anova(lm_interaction, lm_multivariate)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 28	202.8580	NA	NA	NA	NA
# 29	195.0478	-1	7.810288	NA	NA

# do an F-test comparing the model to the univariate one
anova(lm_interaction, lm_univariate)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 28	202.8580	NA	NA	NA	NA
# 30	447.6743	-2	-244.8163	16.8957	1.538937e-05


# show the diagnostic plots
par(mfrow=c(2, 2))
plot(lm_interaction)


# fit the model regressing horsepower and it square on mpg
lm_quadratic = lm(mpg ~ poly(hp, 2), data=mtcars)


# show some details of the quadratic model
summary(lm_quadratic)

# Call:
# lm(formula = mpg ~ poly(hp, 2), data = mtcars)

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -4.5512 -1.6027 -0.6977  1.5509  8.7213 

# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept)    20.091      0.544  36.931  < 2e-16 ***
# poly(hp, 2)1  -26.046      3.077  -8.464 2.51e-09 ***
# poly(hp, 2)2   13.155      3.077   4.275 0.000189 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 3.077 on 29 degrees of freedom
# Multiple R-squared:  0.7561,	Adjusted R-squared:  0.7393 
# F-statistic: 44.95 on 2 and 29 DF,  p-value: 1.301e-09

# use an F-test to compare the univariate and quadratic models
anova(lm_quadratic, lm_univariate)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 29	274.6317	NA	NA	NA	NA
# 30	447.6743	-1	-173.0427	18.27261	0.000188924

# fit the cubic model of horsepower on mpg
lm_cubic = lm(mpg ~ poly(hp, 3), data=mtcars)

summary(lm_cubic)

# Call:
# lm(formula = mpg ~ poly(hp, 3), data = mtcars)

# Residuals:
#     Min      1Q  Median      3Q     Max 
# -4.8605 -1.3972 -0.5736  1.6461  9.0738 

# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)    
# (Intercept)   20.0906     0.5485  36.625  < 2e-16 ***
# poly(hp, 3)1 -26.0456     3.1030  -8.394 3.95e-09 ***
# poly(hp, 3)2  13.1546     3.1030   4.239 0.000221 ***
# poly(hp, 3)3  -2.2419     3.1030  -0.722 0.475987    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 3.103 on 28 degrees of freedom
# Multiple R-squared:  0.7606,	Adjusted R-squared:  0.7349 
# F-statistic: 29.65 on 3 and 28 DF,  p-value: 7.769e-09

# use an F-test to compare the cubic and quadratic models
anova(lm_cubic, lm_quadratic)

# Res.Df	RSS	Df	Sum of Sq	F	Pr(>F)
# 28	269.6056	NA	NA	NA	NA
# 29	274.6317	-1	-5.026086	0.5219863	0.4759872

# show the diagnostic plots for the quadratic model
par(mfrow=c(2, 2))
plot(lm_quadratic)

