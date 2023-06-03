df <- read.csv("C:/Users/GANESH/Downloads/Social_Network_Ads.csv")

# Viewing the dataset
View(df)

# Checking the structure of the dataset
str(df)

# Converting Gender and Purchased columns into factors
df$Gender <- as.factor(df$Gender)
df$Purchased <- as.factor(df$Purchased)

# Data partition
set.seed(222) # Set a seed for random number generation

split <- sample(2, nrow(df), replace = TRUE, prob = c(0.8, 0.2))
train <- df[split == 1, ]
test <- df[split == 2, ]

# Model formulation
library(rpart) # Recursive Partition and Regression Trees
library(rpart.plot)

formula <- Purchased ~ Gender + Age + EstimatedSalary
model <- rpart(formula, data = train)

# Visualizing the decision tree
rpart.plot(model, extra = 6)

# Model summary
summary(model)

# Predicting on the train data and creating a confusion matrix
train$predict <- predict(model, newdata = train, type = "class")
table(train$predict, train$Purchased)

# Predicting on the test data and creating a confusion matrix
test$predict <- predict(model, newdata = test, type = "class")
table(test$predict, test$Purchased)
