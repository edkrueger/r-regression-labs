# Fuel Efficiency Analysis
# K-Fold Cross-Validation (Instructor)


# install the boot library with `conda install -c r r-boot`
# load the boot library
library(boot)

# the the glm function has the same behavior as the lm function by default, but with expanded output
# we'll use the glm because cv.glm, the function in boot, works with glm objects

lm_1 = glm_1 = glm(mpg ~ hp, data=mtcars)
glm_1 = glm(mpg ~ hp, data=mtcars)

summary(lm_1)
summary(glm_1)


# Call:
# glm(formula = mpg ~ hp, data = mtcars)

# Deviance Residuals: 
#     Min       1Q   Median       3Q      Max  
# -5.7121  -2.1122  -0.8854   1.5819   8.2360  

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 30.09886    1.63392  18.421  < 2e-16 ***
# hp          -0.06823    0.01012  -6.742 1.79e-07 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for gaussian family taken to be 14.92248)

#     Null deviance: 1126.05  on 31  degrees of freedom
# Residual deviance:  447.67  on 30  degrees of freedom
# AIC: 181.24

# Number of Fisher Scoring iterations: 2
# Call:
# glm(formula = mpg ~ hp, data = mtcars)

# Deviance Residuals: 
#     Min       1Q   Median       3Q      Max  
# -5.7121  -2.1122  -0.8854   1.5819   8.2360  

# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 30.09886    1.63392  18.421  < 2e-16 ***
# hp          -0.06823    0.01012  -6.742 1.79e-07 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# (Dispersion parameter for gaussian family taken to be 14.92248)

#     Null deviance: 1126.05  on 31  degrees of freedom
# Residual deviance:  447.67  on 30  degrees of freedom
# AIC: 181.24

# Number of Fisher Scoring iterations: 2

# cross-validate the linear through 10th degree model of horsepower on mpg

# set a seed
set.seed(17)

# create a vector of 10 0s to store the results
cv_errors = rep(0, 10)

for (i in 1:10) {
    glm_fit = glm(mpg ~ poly(hp, i), data=mtcars)
    cv_errors[i] = cv.glm(mtcars, glm_fit, , K=10)$delta[1]
}

cv_errors

# 18.3962553992011
# 10.4075369424081
# 11.3784610561978
# 29.5174949654472
# 531.547147207898
# 492.420061802226
# 11991.2119501242
# 211777.342414945
# 435401730.422315
# 739499422.135565