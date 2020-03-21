# Fuel Efficiency Analysis
# Random Forest (Student)

# load the packages
library(randomForest)

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
            (data$mpg - predict(model, data)) ^ 2
        )
    )
}

# read in the cleaned ISLR Auto dataset cleaned in 10-ins_best_subset
auto = read.csv("../resources/ISLR_auto_clean.csv", row.names=1)

# split the data
set.seed(1)
result = test_train_split(auto)
train = data.frame(result[1])
test = data.frame(result[2])

dim(train)[2]

# train and test a bagged tree estimator
set.seed(1)

rf_bag = randomForest(
    mpg ~ .,
    data=train,
    mtry=dim(train)[2] - 1,
    importance=TRUE
)

rf_bag
summary(rf_bag)
mean((predict(rf_bag, test) - test$mpg)^2)

# train and test a random forest
set.seed(1)
rf = randomForest(
    mpg ~ .,
    data=train,
    mtry=3,
    importance=TRUE
)
rf
summary(rf)
mean((predict(rf, test) - test$mpg)^2)


# get test error vs mtry

n_predictors = dim(train)[2] - 1

mse_vs_mtry = rep(0, n_predictors)

for (i in 1:n_predictors){
    
    rf = randomForest(
        mpg ~ .,
        data=train,
        mtry=i,
        importance=TRUE
    )
    
    mse_vs_mtry[i] = calc_MSE(rf, test)
}

# show and plot test error vs mtry

mse_vs_mtry

plot(
    mse_vs_mtry,
    main="mtry on Test MSE",
    xlab="mtry",
    ylab="Test MSE",
    type="l",
    col="red"
)