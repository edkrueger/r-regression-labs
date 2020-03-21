
# Fuel Efficiency Analysis
# Best Subset Selection (Instructor)
# In [1]:
# # look at the docs for the Auto dataset
# # https://www.rdocumentation.org/packages/ISLR/versions/1.2/topics/Auto

# rename the dataset's variable and see some information about the dataset
auto = read.csv("ISLR_auto_raw.csv")
names(auto)
dim(auto)

# convert origin to a factor
auto$origin = factor(auto$origin)

# see the first 10 rows to identify duplicate names
head(auto[order(auto$name),], 10)

# create a new column with the name and year concatenated
auto$name_year = paste(auto$name, auto$year)

# see all of the duplicated name_years
auto[duplicated(auto$name_year) | duplicated(auto$name_year, fromLast=TRUE),]

# keep only the first duplicate, drop the rest
auto = auto[!duplicated(auto$name_year),]

# set name_year as the index
rownames(auto) = auto$name_year
auto$name_year = NULL
auto$name= NULL
head(auto)

# write the cleaned data
write.csv(auto, "ISLR_auto_clean.csv")

# plot the pairwise scatter plots
plot(auto)

# load the leaps library which is available in conda's r channel
# see the instructions in install-instructions/README.md
library(leaps)

# use subset selection to find the best model for mpg for every number of variables

to = proc.time()

reg_fit_full = regsubsets(mpg ~ ., data=auto)
tf = proc.time()
tf - to

reg_summary = summary(reg_fit_full)
reg_summary


reg_summary$rsq

# plot number of variables for the best model against the associated RSS, Adjusted R-Squared, Cp and BIC. 
par(mfrow=c(2, 2))

plot(reg_summary$rss, xlab="Number of Variables", ylab="RSS", type="l")
points(
    which.min(reg_summary$rss),
    min(reg_summary$rss),
    col="red",
    cex=2,
    pch=20
)

plot(reg_summary$adjr2, xlab="Number of Variables", ylab="Adjusted RSq", type="l")
points(
    which.max(reg_summary$adjr2),
    max(reg_summary$adjr2),
    col="red",
    cex=2,
    pch=20
)

plot(reg_summary$cp, xlab="Number of Variables", ylab="Cp", type="l")
points(
    which.min(reg_summary$cp),
    min(reg_summary$cp),
    col="red",
    cex=2,
    pch=20
)

plot(reg_summary$bic, xlab="Number of Variables", ylab="BIC", type="l")
points(
    which.min(reg_summary$bic),
    min(reg_summary$bic),
    col="red",
    cex=2,
    pch=20
)

# use the built-in plot function to plot the best models against their associated fit metrics
par(mfrow = c(2,2))
plot(reg_fit_full, scale="r2")
plot(reg_fit_full, scale="adjr2")
plot(reg_fit_full, scale="Cp")
plot(reg_fit_full, scale="bic")


# see the coefficients for the best model with 4 variable
coef(reg_fit_full, 4)

