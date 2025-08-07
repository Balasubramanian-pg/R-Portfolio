# **Simple Linear Regression Analysis with Marketing Data**

This analysis demonstrates how to perform **simple linear regression** to understand the relationship between YouTube advertising spending (`youtube`) and product sales (`sales`). Below is a detailed breakdown with explanations at each step.

---

## **1. Data Loading & Exploration**
### **Installing & Loading the Dataset**
```r
install.packages("datarium")  # Install the datarium package (contains marketing data)
library(datarium)            # Load the package
View(marketing)              # View the dataset in a spreadsheet-like format
```
- The `marketing` dataset contains:
  - **`youtube`**: Advertising budget spent on YouTube (independent variable, X).
  - **`sales`**: Resulting product sales (dependent variable, Y).

### **Basic Data Inspection**
```r
head(marketing)  # First 6 rows
summary(marketing)  # Summary statistics (mean, median, min, max)
```
- Helps identify:
  - Data distribution.
  - Missing values (`NA` checks).
  - Potential outliers.

---

## **2. Simple Linear Regression Model**
### **Fitting the Model**
```r
model <- lm(sales ~ youtube, data = marketing)
```
- **`lm()`** fits a linear regression model.
- **Formula**: `sales ~ youtube` means "predict sales based on YouTube spending."

### **Model Summary**
```r
summary(model)
```
Key outputs:
1. **Coefficients**:
   - **Intercept (`β₀`)** → Expected sales when YouTube spending = 0.
   - **`youtube` slope (`β₁`)** → Expected increase in sales per unit increase in YouTube spending.
2. **R-squared (R²)** → % of variance in `sales` explained by `youtube`.
3. **p-value** → Statistical significance (`< 0.05` means a strong relationship).

### **Visualizing the Regression Line**
```r
plot(marketing$youtube, marketing$sales, 
     xlab = "YouTube Ad Spending", 
     ylab = "Sales",
     main = "Sales vs YouTube Advertising")
abline(model, col = "red", lwd = 3)  # Adds the regression line
```
- **Interpretation**: The red line shows the predicted trend.

---

## **3. Train-Test Split (60-40)**

### **Why Split Data?**
- **Training set (60%)**: Used to train the model.
- **Test set (40%)**: Used to evaluate model performance on unseen data.

### **Splitting the Data**
```r
set.seed(123)  # Ensures reproducibility
split <- sample(2, nrow(marketing), replace = TRUE, prob = c(0.6, 0.4))
train <- marketing[split == 1, ]  # 60% training data
test <- marketing[split == 2, ]   # 40% test data
```
- **`dim(train)` & `dim(test)`** → Verify split sizes.

---

## **4. Re-training the Model on Training Data**
```r
model_train <- lm(sales ~ youtube, data = train)
summary(model_train)
```
- Compare coefficients with the full model (`model`).
- If they differ significantly, the model might be **overfitting**.

---

## **5. Making Predictions**

### **Predicting on a Single Value**
```r
predict_single <- predict(model, data.frame(youtube = 16))
predict_single
```
- **Interpretation**: Predicted sales when YouTube spending = 16.

### **Predicting on Test Data**
```r
test$predicted_sales <- predict(model, newdata = test)
View(test)  # Compare actual vs predicted sales
```

---

## **6. Model Evaluation**

### **Calculating Prediction Error (RMSE)**
```r
rmse <- sqrt(mean((test$sales - test$predicted_sales)^2))
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
```
- **Lower RMSE** = Better predictions.

### **R-squared on Test Data**
```r
test_r2 <- 1 - (sum((test$sales - test$predicted_sales)^2) / 
                sum((test$sales - mean(test$sales))^2))
cat("Test R-squared:", test_r2, "\n")
```
- Measures how well the model generalizes to unseen data.

---

## **7. Checking Assumptions**

### **1. Linearity**
```r
plot(model, which = 1)  # Residuals vs Fitted plot
```
- **Ideal**: Residuals should be randomly scattered around 0.

### **2. Normality of Residuals**

```r
hist(residuals(model))  # Should be roughly bell-shaped
shapiro.test(residuals(model))  # Formal test (p > 0.05 → normal)
```

### **3. Homoscedasticity (Constant Variance)**

```r
plot(model, which = 3)  # Scale-Location plot
```
- **Ideal**: No funnel shape in residuals.

---

## **8. Improving the Model (Optional)**

### **Adding Polynomial Terms**
```r
model_poly <- lm(sales ~ youtube + I(youtube^2), data = marketing)
summary(model_poly)
```
- Captures non-linear relationships.

### **Log Transformation**
```r
model_log <- lm(log(sales) ~ youtube, data = marketing)
summary(model_log)
```
- Useful if the relationship is exponential.

---

## **Key Takeaways**
**Simple linear regression** models the relationship between `youtube` ads and `sales`.  
**Train-test split** helps evaluate model performance.  
**RMSE & R²** quantify prediction accuracy.  
**Always check assumptions** (linearity, normality, homoscedasticity).  
**Improvements**: Try polynomial terms or log transforms if the relationship isn’t linear.  
