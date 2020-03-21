# Fuel Efficiency Analysis¶
# Validation Set Approach (Student)
# Instructions:

# Use the Validation Set Approach to validate some of your earlier models.
# Be sure to try setting different seeds and see if you results change.
# Can you tell which model is the best according to this approach?


# make a function to split the data into a training set and a validation set
test_train_split = function(data, test_size=.25){
    
    # the the number of observations in the data
    n_obs = dim(mtcars)[1]
    
    # find the number of training observations by rounding up
    n_train_obs = ceiling(n_obs * (1 - test_size))
    
    # get the train indexes
    train_idx = sample(n_obs, n_train_obs)
    
    # split the data
    train = data[train_idx, ]
    test = data[-train_idx, ]

    # return the result
    result = list(train, test)
    return(result)
}

# write a function to calculate the MSE
calc_MSE = function (model, data){
    return (
        mean((data$mpg - predict(model, data)) ^ 2)
    )
}

# split the data
set.seed(1)
result = test_train_split(mtcars, test_size = .25)
train_data = data.frame(result[1])
test_data = data.frame(result[2])

# train the models
lm_multivariate = lm(mpg ~ hp + wt, data=train_data)
lm_polynomial = lm(mpg ~ poly(hp, 3), data=train_data)

# calculate the train MSE for the three models
calc_MSE(lm_multivariate, train_data)
calc_MSE(lm_polynomial, train_data)

# calculate the test MSE for the three models
calc_MSE(lm_multivariate, test_data)
calc_MSE(lm_polynomial, test_data)

# try again with a different seed 
set.seed(2)

# split the data
result = test_train_split(mtcars)
train_data = data.frame(result[1])
test_data = data.frame(result[2])

# train the models
lm_multivariate = lm(mpg ~ hp + wt, data=train_data)
lm_polynomial = lm(mpg ~ poly(hp, 3), data=train_data)

# calculate the train MSE for the three models
calc_MSE(lm_multivariate, train_data)
calc_MSE(lm_polynomial, train_data)

# calculate the test MSE for the three models
calc_MSE(lm_multivariate, test_data)
calc_MSE(lm_polynomial, test_data)

# try again with yet another seed 
set.seed(3)

# split the data
result = test_train_split(mtcars)
train_data = data.frame(result[1])
test_data = data.frame(result[2])

# train the models
lm_multivariate = lm(mpg ~ hp + wt, data=train_data)
lm_polynomial = lm(mpg ~ poly(hp, 3), data=train_data)

# calculate the train MSE for the three models
calc_MSE(lm_multivariate, train_data)
calc_MSE(lm_polynomial, train_data)

# calculate the test MSE for the three models
calc_MSE(lm_multivariate, test_data)
calc_MSE(lm_polynomial, test_data)