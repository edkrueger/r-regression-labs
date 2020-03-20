# Fuel Efficiency Analysis¶
# K-Fold Cross-Validation (Student)
# Instructions:

# Use K-Fold Cross-Validation to validate some of your earlier models.
# Be sure to try setting different seeds and see if you results change.
# Can you tell which model is the best according to this approach?

# install the boot library with `conda install -c r r-boot`
# load the boot library
library(boot)


# create the three models as glms
glm_univariate = glm(mpg ~ hp, data=mtcars)
glm_multivariate = glm(mpg ~ hp * wt, data=mtcars)
glm_polynomial = glm(mpg ~ poly(hp, 2), data=mtcars)

set.seed(17)
cv.glm(mtcars, glm_univariate, , K=10)$delta[1]
cv.glm(mtcars, glm_multivariate, , K=10)$delta[1]
cv.glm(mtcars, glm_polynomial, , K=10)$delta[1]

# Warning message in cv.glm(mtcars, glm_univariate, , K = 10):
# “'K' has been set to 11.000000”
# 18.3962553992011
# Warning message in cv.glm(mtcars, glm_multivariate, , K = 10):
# “'K' has been set to 11.000000”
# 5.33693253842602
# Warning message in cv.glm(mtcars, glm_polynomial, , K = 10):
# “'K' has been set to 11.000000”
# 10.2080617162244

# try again with a different seed
set.seed(21)

cv.glm(mtcars, glm_univariate, , K=10)$delta[1]
cv.glm(mtcars, glm_multivariate, , K=10)$delta[1]
cv.glm(mtcars, glm_polynomial, , K=10)$delta[1]

# Warning message in cv.glm(mtcars, glm_univariate, , K = 10):
# “'K' has been set to 11.000000”
# 16.640103481917
# Warning message in cv.glm(mtcars, glm_multivariate, , K = 10):
# “'K' has been set to 11.000000”
# 5.24168646382012
# Warning message in cv.glm(mtcars, glm_polynomial, , K = 10):
# “'K' has been set to 11.000000”
# 10.1855185570476