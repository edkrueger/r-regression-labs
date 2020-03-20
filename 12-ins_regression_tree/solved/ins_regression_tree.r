# House Price Analysis
# Regression Tree (Instructor)


# load the libraries and data
library(rpart)
library(MASS)
boston = Boston

# see the Boston dataset's docs
?Boston


# Boston {MASS}	R Documentation
# Housing Values in Suburbs of Boston
# Description
# The Boston data frame has 506 rows and 14 columns.

# Usage
# Boston
# Format
# This data frame contains the following columns:

# crim
# per capita crime rate by town.

# zn
# proportion of residential land zoned for lots over 25,000 sq.ft.

# indus
# proportion of non-retail business acres per town.

# chas
# Charles River dummy variable (= 1 if tract bounds river; 0 otherwise).

# nox
# nitrogen oxides concentration (parts per 10 million).

# rm
# average number of rooms per dwelling.

# age
# proportion of owner-occupied units built prior to 1940.

# dis
# weighted mean of distances to five Boston employment centres.

# rad
# index of accessibility to radial highways.

# tax
# full-value property-tax rate per \$10,000.

# ptratio
# pupil-teacher ratio by town.

# black
# 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town.

# lstat
# lower status of the population (percent).

# medv
# median value of owner-occupied homes in \$1000s.

# Source
# Harrison, D. and Rubinfeld, D.L. (1978) Hedonic prices and the demand for clean air. J. Environ. Economics and Management 5, 81–102.

# Belsley D.A., Kuh, E. and Welsch, R.E. (1980) Regression Diagnostics. Identifying Influential Data and Sources of Collinearity. New York: Wiley.

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

# see a summary of the boston data
summary(boston)
#       crim                zn             indus            chas        
#  Min.   : 0.00632   Min.   :  0.00   Min.   : 0.46   Min.   :0.00000  
#  1st Qu.: 0.08204   1st Qu.:  0.00   1st Qu.: 5.19   1st Qu.:0.00000  
#  Median : 0.25651   Median :  0.00   Median : 9.69   Median :0.00000  
#  Mean   : 3.61352   Mean   : 11.36   Mean   :11.14   Mean   :0.06917  
#  3rd Qu.: 3.67708   3rd Qu.: 12.50   3rd Qu.:18.10   3rd Qu.:0.00000  
#  Max.   :88.97620   Max.   :100.00   Max.   :27.74   Max.   :1.00000  
#       nox               rm             age              dis        
#  Min.   :0.3850   Min.   :3.561   Min.   :  2.90   Min.   : 1.130  
#  1st Qu.:0.4490   1st Qu.:5.886   1st Qu.: 45.02   1st Qu.: 2.100  
#  Median :0.5380   Median :6.208   Median : 77.50   Median : 3.207  
#  Mean   :0.5547   Mean   :6.285   Mean   : 68.57   Mean   : 3.795  
#  3rd Qu.:0.6240   3rd Qu.:6.623   3rd Qu.: 94.08   3rd Qu.: 5.188  
#  Max.   :0.8710   Max.   :8.780   Max.   :100.00   Max.   :12.127  
#       rad              tax           ptratio          black       
#  Min.   : 1.000   Min.   :187.0   Min.   :12.60   Min.   :  0.32  
#  1st Qu.: 4.000   1st Qu.:279.0   1st Qu.:17.40   1st Qu.:375.38  
#  Median : 5.000   Median :330.0   Median :19.05   Median :391.44  
#  Mean   : 9.549   Mean   :408.2   Mean   :18.46   Mean   :356.67  
#  3rd Qu.:24.000   3rd Qu.:666.0   3rd Qu.:20.20   3rd Qu.:396.23  
#  Max.   :24.000   Max.   :711.0   Max.   :22.00   Max.   :396.90  
#      lstat            medv      
#  Min.   : 1.73   Min.   : 5.00  
#  1st Qu.: 6.95   1st Qu.:17.02  
#  Median :11.36   Median :21.20  
#  Mean   :12.65   Mean   :22.53  
#  3rd Qu.:16.95   3rd Qu.:25.00  
#  Max.   :37.97   Max.   :50.00 


# plot the boston data
plot(boston)

# split the data
set.seed(1)
result = test_train_split(boston)
train = data.frame(result[1])
test = data.frame(result[2])

# train a decsion tree and show results
tree_unpruned = rpart(medv ~ ., data=train)
summary(tree_unpruned)

# plot the unpruned tree
plot(tree_unpruned)
text(tree_unpruned)

# show a plot of complexity parameter (penalty) versus relative error
plotcp(tree_unpruned)

# prune the tree at the 5th node and show the summary
tree_pruned = prune(tree_unpruned, cp=.019)
summary(tree_pruned)

# plot the pruned tree
plot(tree_pruned)
text(tree_pruned)

# find the test mse for the unpruned tree
calc_MSE(tree_unpruned, test)
# 29.2397976212262

# find the test mse for the pruned tree
calc_MSE(tree_pruned, test)
# 30.147822385503