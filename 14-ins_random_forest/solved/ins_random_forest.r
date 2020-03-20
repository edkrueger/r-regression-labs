# House Price Analysis¶
# Random Forest (Instructor)


# load the libraries and data
library(randomForest)
library(MASS)
boston = Boston


# make a function to split the data into a training set and a validation set
test_train_split = function(data, test_size=.25){
    
    # the the number of observations in the data
    n_obs = dim(data)[1]
    
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
            (data$medv - predict(model, data)) ^ 2
        )
    )
}

# split the data
set.seed(1)
result = test_train_split(boston)
train = data.frame(result[1])
test = data.frame(result[2])

# train and test a bagged tree estimator
set.seed(1)

rf_bag = randomForest(
    medv ~ .,
    data=train,
    mtry=dim(train)[2] - 1,
    importance=TRUE
)

rf_bag
summary(rf_bag)

calc_MSE(rf_bag, test)


# train and test a random forest
set.seed(1)
rf = randomForest(
    medv ~ .,
    data=train,
    importance=TRUE
)
rf
summary(rf)

calc_MSE(rf, test)

