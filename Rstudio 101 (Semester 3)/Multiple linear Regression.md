Here's an expanded and enhanced version of your multiple linear regression analysis with detailed explanations, visualizations, and model evaluation:

```R
# MULTIPLE LINEAR REGRESSION ANALYSIS #########################################

# Load necessary packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  tidyverse,    # Data manipulation and visualization
  ggplot2,      # Advanced plotting
  ggpubr,       # Publication-ready plots
  broom,        # Tidy model outputs
  car,          # For VIF calculation
  caret         # For train/test split and model evaluation
)

# LOAD AND EXPLORE DATA ######################################################

# Load the marketing dataset (assuming it's already loaded)
# If not, you would use:
# marketing <- read.csv("path/to/marketing.csv")

# Basic data inspection
head(marketing)
str(marketing)
summary(marketing)

# Check for missing values
sum(is.na(marketing))

# Visualize relationships
ggplot(marketing, aes(x = youtube, y = sales)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Sales vs YouTube Advertising")

ggplot(marketing, aes(x = facebook, y = sales)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Sales vs Facebook Advertising")

# Correlation matrix
cor(marketing[, c("sales", "youtube", "facebook")])

# MODEL BUILDING #############################################################

# Fit multiple linear regression model
model <- lm(sales ~ youtube + facebook, data = marketing)

# Model summary
summary(model)

# Enhanced model interpretation
tidy_model <- broom::tidy(model)
glance_model <- broom::glance(model)

# Confidence intervals for coefficients
confint(model)

# MODEL DIAGNOSTICS ##########################################################

# 1. Check for multicollinearity
vif_values <- car::vif(model)
print(vif_values)  # Values > 5-10 indicate multicollinearity issues

# 2. Residual analysis
par(mfrow = c(2, 2))  # Set up 2x2 plotting area
plot(model)           # Diagnostic plots
par(mfrow = c(1, 1))  # Reset plotting area

# 3. Normality of residuals
shapiro.test(residuals(model))

# 4. Homoscedasticity
car::ncvTest(model)

# DATA SPLITTING #############################################################

# Set seed for reproducibility
set.seed(123)

# Create train/test split (60%/40%)
train_index <- createDataPartition(marketing$sales, p = 0.6, list = FALSE)
train <- marketing[train_index, ]
test <- marketing[-train_index, ]

# Verify dimensions
cat("Original data dimensions:", dim(marketing), "\n")
cat("Training set dimensions:", dim(train), "\n")
cat("Test set dimensions:", dim(test), "\n")

# Re-fit model on training data
train_model <- lm(sales ~ youtube + facebook, data = train)
summary(train_model)

# MODEL EVALUATION ###########################################################

# Predict on test data
test$predicted_sales <- predict(train_model, newdata = test)

# Calculate performance metrics
postResample(pred = test$predicted_sales, obs = test$sales)

# Visualize actual vs predicted
ggplot(test, aes(x = sales, y = predicted_sales)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, color = "red", linewidth = 1) +
  ggtitle("Actual vs Predicted Sales") +
  xlab("Actual Sales") +
  ylab("Predicted Sales")

# PREDICTION #################################################################

# Make prediction for specific values
new_data <- data.frame(youtube = 130, facebook = 30)
prediction <- predict(train_model, newdata = new_data, interval = "confidence")

cat("Predicted sales value:", prediction[1], "\n")
cat("95% Confidence interval:", prediction[2], "to", prediction[3], "\n")

# VISUALIZATION OF MODEL #####################################################

# 3D plot of the regression plane (if rgl package is available)
if (require(rgl)) {
  plot3d <- scatter3d(
    x = train$youtube, 
    y = train$facebook, 
    z = train$sales,
    surface = FALSE,
    xlab = "YouTube", 
    ylab = "Facebook", 
    zlab = "Sales"
  )
  # Add regression plane
  rgl::planes3d(
    a = coef(train_model)["youtube"],
    b = coef(train_model)["facebook"],
    c = -1,
    d = coef(train_model)["(Intercept)"],
    alpha = 0.5,
    color = "lightblue"
  )
}

# Alternative 2D visualization
ggplot(train, aes(x = youtube, y = sales, color = facebook)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_gradient(low = "blue", high = "red") +
  ggtitle("Sales vs YouTube Ads (colored by Facebook budget)")

# MODEL IMPROVEMENT (OPTIONAL) ###############################################

# Consider adding interaction term
model_interaction <- lm(sales ~ youtube + facebook + youtube:facebook, 
                       data = train)
summary(model_interaction)

# Compare models
anova(train_model, model_interaction)

# FINAL MODEL SELECTION ######################################################

# Based on evaluation, select the best performing model
final_model <- train_model  # Or model_interaction if better

# Save model for future use
saveRDS(final_model, "final_sales_model.rds")

# To load later: final_model <- readRDS("final_sales_model.rds")
```

### Key Enhancements:

1. **Comprehensive Data Exploration**:
   - Added visualization of relationships between predictors and outcome
   - Included correlation analysis

2. **Enhanced Model Diagnostics**:
   - Added VIF calculation for multicollinearity check
   - Formal tests for normality and homoscedasticity
   - Better residual analysis

3. **Improved Data Splitting**:
   - Used caret's createDataPartition for more balanced splits
   - Added dimension verification

4. **Complete Model Evaluation**:
   - Added proper performance metrics (RMSE, R-squared)
   - Included visualization of predictions vs actuals

5. **Better Prediction**:
   - Added confidence intervals to predictions
   - More robust prediction code

6. **Advanced Visualization**:
   - Added 3D visualization option (if rgl is available)
   - Enhanced 2D visualizations

7. **Model Improvement Options**:
   - Added interaction term exploration
   - Model comparison

8. **Model Deployment**:
   - Added code to save the final model

9. **Reproducibility**:
   - Added set.seed() for reproducible splits
   - Better package management

This expanded version provides a complete workflow for multiple linear regression analysis, from data exploration to model deployment, with proper validation and diagnostic checks.
