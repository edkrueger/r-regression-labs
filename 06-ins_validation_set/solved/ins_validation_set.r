
# Fuel Efficiency Analysis
# Validation Set Approach (Instructor)

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
        mean(
            (data$mpg - predict(model, data)) ^ 2
        )
    )
}

# split the data
set.seed(1)
result = test_train_split(mtcars)
train_data = data.frame(result[1])
test_data = data.frame(result[2])
train_data
test_data

# train some models
lm_1 = lm(mpg ~ hp, data=train_data)
lm_2 = lm(mpg ~ poly(hp, 2), data=train_data)
lm_3 = lm(mpg ~ poly(hp, 3), data=train_data)


# calculate the train MSE for the three models
calc_MSE(lm_1, train_data)
calc_MSE(lm_2, train_data)
calc_MSE(lm_3, train_data)

# 16.4344038294548
# 10.059763313286
# 9.86479846494066


# calculate the test MSE for the three models
calc_MSE(lm_1, test_data)
calc_MSE(lm_2, test_data)
calc_MSE(lm_3, test_data)

# 6.80772015073653
# 4.62519616917291
# 4.94360556087465

set.seed(2)
result = test_train_split(mtcars)
train_data = data.frame(result[1])
test_data = data.frame(result[2])
train_data
test_data

# train the models again on the new train data
lm_1 = lm(mpg ~ hp, data=train_data)
lm_2 = lm(mpg ~ poly(hp, 2), data=train_data)
lm_3 = lm(mpg ~ poly(hp, 3), data=train_data)


# calculate the train MSE for the three models
calc_MSE(lm_1, train_data)
calc_MSE(lm_2, train_data)
calc_MSE(lm_3, train_data)

# 13.576830598356
# 10.2806988133705
# 10.2363157015701

# calculate the test MSE for the three models
calc_MSE(lm_1, test_data)
calc_MSE(lm_2, test_data)
calc_MSE(lm_3, test_data)

# 22.2475929250036
# 5.12277965906338
# 12.8439472709547