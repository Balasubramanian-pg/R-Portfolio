# Decision Tree Analysis for Social Network Ads Dataset

This analysis builds a decision tree model to predict whether a user will purchase a product based on their gender, age, and estimated salary from the Social Network Ads dataset.

## 1. Data Loading and Preparation

```r
# Load the dataset
df <- read.csv("C:/Users/GANESH/Downloads/Social_Network_Ads.csv")

# View the first few rows of the dataset
head(df)

# Check the structure and summary statistics
str(df)
summary(df)

# Convert categorical variables to factors
df$Gender <- as.factor(df$Gender)
df$Purchased <- as.factor(df$Purchased)

# Check for missing values
sum(is.na(df))
```

## 2. Data Partitioning

```r
# Set seed for reproducibility
set.seed(222)

# Create 80% training and 20% test split
split <- sample(2, nrow(df), replace = TRUE, prob = c(0.8, 0.2))
train <- df[split == 1, ]
test <- df[split == 2, ]

# Check the distribution of Purchased in both sets
prop.table(table(train$Purchased))
prop.table(table(test$Purchased))
```

## 3. Decision Tree Model Building

```r
library(rpart)
library(rpart.plot)

# Model formulation
formula <- Purchased ~ Gender + Age + EstimatedSalary

# Build the decision tree with control parameters
model <- rpart(formula, data = train,
               method = "class",  # for classification
               control = rpart.control(minsplit = 20,  # minimum observations to split
                                       minbucket = 10, # minimum observations in leaf node
                                       cp = 0.01))    # complexity parameter

# Alternative: Let rpart choose parameters automatically
model <- rpart(formula, data = train, method = "class")
```

## 4. Model Visualization and Interpretation

```r
# Basic tree plot
rpart.plot(model)

# Enhanced plot with more information
rpart.plot(model, 
           extra = 104,  # show prob of each class and % observations
           box.palette = "GnBu", # color scheme
           branch.lty = 3, # branch line type
           shadow.col = "gray", # shadows under the node boxes
           nn = TRUE) # display node numbers

# Print the complexity parameter table
printcp(model)

# Plot the CP table
plotcp(model)
```

## 5. Model Evaluation

```r
# Detailed model summary
summary(model)

# Variable importance
model$variable.importance

# Predict on training data
train$predict <- predict(model, newdata = train, type = "class")

# Confusion matrix for training data
confusion_matrix_train <- table(Actual = train$Purchased, Predicted = train$predict)
confusion_matrix_train

# Calculate training accuracy
train_accuracy <- sum(diag(confusion_matrix_train))/sum(confusion_matrix_train)
cat("Training Accuracy:", train_accuracy, "\n")

# Predict on test data
test$predict <- predict(model, newdata = test, type = "class")

# Confusion matrix for test data
confusion_matrix_test <- table(Actual = test$Purchased, Predicted = test$predict)
confusion_matrix_test

# Calculate test accuracy
test_accuracy <- sum(diag(confusion_matrix_test))/sum(confusion_matrix_test)
cat("Test Accuracy:", test_accuracy, "\n")

# Additional metrics
library(caret)
confusionMatrix(test$predict, test$Purchased, positive = "1")
```

## 6. Model Pruning (Optional)

```r
# Find the optimal CP value
optimal_cp <- model$cptable[which.min(model$cptable[,"xerror"]),"CP"]

# Prune the tree
pruned_model <- prune(model, cp = optimal_cp)

# Visualize the pruned tree
rpart.plot(pruned_model)

# Evaluate pruned model
test$pruned_predict <- predict(pruned_model, newdata = test, type = "class")
confusionMatrix(test$pruned_predict, test$Purchased, positive = "1")
```

## 7. Feature Engineering (Optional)

```r
# Create new features that might help the model
train$AgeGroup <- cut(train$Age, breaks = c(0, 30, 40, 50, 60, 100))
test$AgeGroup <- cut(test$Age, breaks = c(0, 30, 40, 50, 60, 100))

train$SalaryGroup <- cut(train$EstimatedSalary, 
                        breaks = quantile(train$EstimatedSalary, probs = seq(0,1,0.2)))
test$SalaryGroup <- cut(test$EstimatedSalary, 
                        breaks = quantile(train$EstimatedSalary, probs = seq(0,1,0.2)))

# Build model with new features
formula2 <- Purchased ~ Gender + Age + EstimatedSalary + AgeGroup + SalaryGroup
model2 <- rpart(formula2, data = train, method = "class")
rpart.plot(model2)
```

## 8. Cross-Validation (Optional)

```r
# Using caret package for cross-validation
library(caret)

# Set up train control
ctrl <- trainControl(method = "cv", number = 10)

# Train the model
cv_model <- train(Purchased ~ Gender + Age + EstimatedSalary,
                 data = train,
                 method = "rpart",
                 trControl = ctrl,
                 tuneLength = 10)

# View results
cv_model$results
plot(cv_model)
```

## 9. Final Model Selection and Interpretation

After evaluating all models, you would select the best performing one based on accuracy and other metrics. The decision tree provides clear rules for prediction that can be easily interpreted by non-technical stakeholders.

For example, the tree might show that:
1. For users under 40, purchase likelihood is low regardless of salary
2. For users over 40 with high salaries, purchase likelihood is high
3. Gender might have a smaller effect compared to age and salary

This interpretation can guide marketing strategies by identifying the most promising customer segments.
