# **Random Forest Classification with Iris Dataset**

This analysis demonstrates how to build a **Random Forest** classifier to predict iris flower species (`setosa`, `versicolor`, `virginica`) based on sepal and petal measurements. Below is a detailed breakdown of each step.

---

## **1. Data Loading & Preparation**

### **Loading the Dataset**
```r
a <- iris  # Load the built-in iris dataset
a          # View the dataset
```
- `iris` is a built-in dataset in R containing:
  - **4 numerical features**: `Sepal.Length`, `Sepal.Width`, `Petal.Length`, `Petal.Width`
  - **1 categorical target variable**: `Species` (3 classes)

### **Installing & Loading Required Packages**
```r
install.packages("randomForest")  # Install the randomForest package
library(randomForest)             # Load the package
```
- **`randomForest`** is used to train an ensemble decision tree model.

---

## **2. Train-Test Split (80-20)**

### **Splitting the Data**
```r
set.seed(123)  # Ensures reproducibility
split <- sample(2, nrow(iris), replace = TRUE, prob = c(0.8, 0.2))
train <- iris[split == 1, ]  # 80% training data
test <- iris[split == 2, ]   # 20% testing data
```
- **`sample()`** randomly splits data into two groups.
- **`prob = c(0.8, 0.2)`** ensures an 80-20 split.
- **`dim(train)` & `dim(test)`** confirm the split sizes.

---

## **3. Training the Random Forest Model**

### **Model Training**
```r
model <- randomForest(Species ~ ., data = train, ntree = 500, importance = TRUE)
```
- **`Species ~ .`**: Predicts `Species` using all other columns.
- **`ntree = 500`**: Number of decision trees (higher = more robust but slower).
- **`importance = TRUE`**: Stores variable importance metrics.

### **Model Summary**
```r
print(model)  # View model details
```
- **Confusion Matrix (Training)**: Shows how well the model classifies training data.
- **OOB (Out-of-Bag) Error**: Estimates generalization error.

---

## **4. Making Predictions on Test Data**

### **Predicting Test Classes**
```r
predict <- predict(model, test)  # Predicts Species for test data
test$prediction <- predict       # Adds predictions to test data
View(test)                      # Displays test data with predictions
```

---

## **5. Evaluating Model Performance**

### **Confusion Matrix (Test Data)**
```r
matrix <- table(test$Species, test$prediction)
print(matrix)
```
- **Rows**: Actual species.
- **Columns**: Predicted species.
- **Diagonal values**: Correct predictions.

### **Accuracy Calculation**
```r
accuracy <- sum(diag(matrix)) / sum(matrix)  # Correct predictions / Total predictions
cat("Accuracy:", accuracy * 100, "%\n")
```
- **Example Output**: `Accuracy: 96.67%` (varies due to randomness).

---

## **6. Variable Importance**
### **Which Features Matter Most?**
```r
importance(model)  # Shows importance scores
varImpPlot(model)  # Plots feature importance
```
- **MeanDecreaseGini**: Higher = More important in classification.
- **MeanDecreaseAccuracy**: Impact on prediction accuracy.

---

## **7. Trying with `iris3` Dataset (Optional)**

### **Why `iris3`?**
- `iris3` is a 3D array version of `iris`.
- Requires reshaping before use:
  ```r
  iris3_df <- data.frame(
    Sepal.Length = as.vector(iris3[, 1, ]),
    Sepal.Width = as.vector(iris3[, 2, ]),
    Petal.Length = as.vector(iris3[, 3, ]),
    Petal.Width = as.vector(iris3[, 4, ]),
    Species = rep(dimnames(iris3)[[3]], each = 50)
  )
  ```
- Then repeat the same steps (split, train, predict, evaluate).

---

## **Key Takeaways**

**Random Forest** is powerful for classification tasks.  
**Train-Test Split (80-20)** helps evaluate model performance.  
**Confusion Matrix** reveals true vs. predicted classes.  
**Variable Importance** identifies key predictors.  
**`iris3` requires reshaping** before use in `randomForest`.  

---

### **Next Steps (Improvements)**
1. **Hyperparameter Tuning**: Adjust `mtry` (features per split) and `ntree` (number of trees).
2. **Cross-Validation**: Use `caret` for k-fold CV.
3. **Handling Imbalanced Data**: If classes are uneven, use `classwt` in `randomForest`.

Would you like a deeper dive into any specific part? 
