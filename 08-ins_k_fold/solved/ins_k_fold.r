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
