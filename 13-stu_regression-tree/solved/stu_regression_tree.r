# Fuel Efficiency Analysis
# Regression Tree (Student)

# load the rpart library
library(rpart)

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

# train a decsion tree and show results
tree_unpruned = rpart(mpg ~ ., data=train)
summary(tree_unpruned)

# plot the unpruned tree
plot(tree_unpruned)
text(tree_unpruned)

# show a plot of complexity parameter (penalty) versus relative error
plotcp(tree_unpruned)


# prune the tree at the 5th node and show the summary
tree_pruned = prune(tree_unpruned, cp=.039)
summary(tree_pruned)

# plot the pruned tree
plot(tree_pruned)
text(tree_pruned)

# find the test mse for the unpruned tree
calc_MSE(tree_unpruned, test)

# find the test mse for the pruned tree
calc_MSE(tree_pruned, test)