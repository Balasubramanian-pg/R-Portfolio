# **Time Series Analysis of AirPassengers Dataset**

This analysis explores the classic `AirPassengers` dataset, which contains monthly totals of international airline passengers from 1949 to 1960. Below is a detailed breakdown of each step with explanations.

---

## **1. Loading and Initial Exploration**
### **Basic Dataset Inspection**
```r
a <- AirPassengers  # Load built-in dataset
a                  # View the time series
start(a)           # Jan 1949 (start date)
end(a)             # Dec 1960 (end date)
```
- **Structure**: Monthly data (12 observations per year).
- **Type**: `ts` (time series) object in R.

### **Initial Visualization**
```r
plot(a, main = "Monthly Air Passengers (1949-1960)", ylab = "Passengers")
abline(lm(a ~ time(a)), col = "red")  # Linear trend line
```
- **Observations**:
  - **Upward trend**: Passenger numbers increase over time.
  - **Seasonality**: Regular peaks (summer) and troughs (winter).

---

## **2. Time Series Decomposition**
### **Breaking Down Components**
```r
decomposed <- decompose(a)
plot(decomposed)
```
- **Decomposes** the series into:
  1. **Trend** (long-term growth)
  2. **Seasonal** (repeating patterns)
  3. **Random** (irregular fluctuations)

### **Boxplot for Seasonal Analysis**
```r
boxplot(a ~ cycle(a), 
        xlab = "Month", 
        ylab = "Passengers",
        main = "Seasonal Variation by Month")
```
- Shows **monthly distribution** (higher in summer months like July/August).

---

## **3. Stabilizing Variance with Log Transform**
### **Why Log Transform?**
- Reduces **multiplicative seasonality** → Makes variance constant.
```r
plot(log(a), main = "Log-Transformed Passengers")
abline(lm(log(a) ~ time(a)), col = "red")
```

### **Differencing to Remove Trend**
```r
plot(diff(log(a)), main = "Differenced Log-Passengers")
```
- **Makes data stationary** (constant mean/variance over time).

---

## **4. Autocorrelation Analysis**
### **ACF (Autocorrelation Function)**
```r
acf(a)  # Original series shows slow decay (non-stationary)
acf(diff(log(a)))  # Stationary after differencing
```
- **Spikes at lag 12** indicate **strong yearly seasonality**.

### **PACF (Partial Autocorrelation Function)**
```r
pacf(diff(log(a)))
```
- Helps identify **AR (AutoRegressive) terms** for modeling.

---

## **5. ARIMA Modeling**
### **Fitting a Seasonal ARIMA Model**
```r
model <- arima(log(a), 
               order = c(0, 1, 1),          # Non-seasonal: I(1) with MA(1)
               seasonal = list(order = c(0, 1, 0), period = 12))
summary(model)
```
- **`order = c(0, 1, 1)`**:
  - **0** AR terms.
  - **1** difference (to remove trend).
  - **1** MA term (moving average).
- **`seasonal = c(0, 1, 0)`**: Accounts for yearly seasonality.

### **Forecasting**
```r
prediction <- predict(model, n.ahead = 48)  # Predict next 4 years
air_predict <- exp(prediction$pred)         # Reverse log-transform
```
- **`exp()`** converts predictions back to original scale.

### **Visualizing Forecast**
```r
ts.plot(a, air_predict, 
        lty = c(1, 3), 
        col = c("black", "red"),
        main = "Actual vs Predicted Passengers",
        ylab = "Passengers")
legend("topleft", legend = c("Actual", "Predicted"), lty = c(1, 3), col = c("black", "red"))
```
- **Black line**: Historical data.
- **Red dashed line**: Forecast.

---

## **6. Model Diagnostics**
### **Residual Analysis**
```r
acf(residuals(model))  # Should show no significant autocorrelation
```
- **Ideal**: Residuals resemble white noise (no patterns).

---

## **Key Takeaways**
**Trend & Seasonality**: Clear upward trend + yearly seasonality.  
**Stationarity**: Achieved via **log + differencing**.  
**ARIMA Modeling**: Best for non-stationary, seasonal data.  
**Forecasting**: Predicts future passenger counts accurately.  
**Assumptions**: Always check residuals for randomness.  

---

### **Potential Improvements**
1. **Parameter Tuning**: Try different `(p,d,q)(P,D,Q)` combinations.
2. **External Regressors**: Include holidays/events in the model.
3. **Advanced Models**: Test `TBATS` or `Prophet` for better seasonality handling.
