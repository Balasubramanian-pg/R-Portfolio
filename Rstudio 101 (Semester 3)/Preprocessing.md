## **1. Loading and Initial Exploration**
- **`read.csv()`**: Loads the dataset from the specified path.
- **`head()`, `tail()`**: Show the first/last few rows to get a quick look at the data.
- **`str()`**: Displays the structure (variable types, dimensions).
- **`summary()`**: Provides basic statistics (mean, median, min, max, etc.) for numeric columns.

### **2. Missing Value Detection**
- **`colSums(is.na(df))`**: Counts missing values per column.
- **`rowSums(is.na(df))`**: Counts missing values per row (to check if some rows have too many NAs).

### **3. Outlier Detection**
- **Boxplot (`ggplot2`)**:
  - Visualizes outliers in `salary` (values far from Q1/Q3).
- **`summary(df$salary)`**:
  - Helps identify extreme values (very high/low compared to mean/median).

### **4. Handling Missing Data**
#### **Method 1: Deletion**
- **`df <- df[-c(29), ]`**  
  - Deletes row 29 (likely because it had too many missing values or outliers).

#### **Method 2: Imputation (Mean/Median)**
- **Mean Imputation**:
  - Replaces missing values in `education` and `gender` with the mean.
  - **Problem**: Mean is not suitable for categorical variables (e.g., `gender`).
- **Median Imputation**:
  - Replaces missing values with the median (better for skewed data).

### **5. Outlier Treatment (Grubbs’ Test)**
- **`grubbs.test()`** detects a single outlier:
  - Applied to `salary` and `education`.
  - If an outlier is detected (e.g., `salary = 1000`), it is replaced with the mean.
  - **Limitation**: Grubbs’ test only checks for **one** outlier at a time.

### **6. Advanced Imputation (MICE)**
- **MICE (Multivariate Imputation by Chained Equations)**:
  - **`md.pattern(df.n)`**: Shows missing data patterns.
  - **`mice()`**:
    - `method = "pmm"` (Predictive Mean Matching) → Better than mean/median imputation.
    - `m = 5` → Creates 5 imputed datasets.
    - `maxit = 50` → Maximum iterations.
    - `seed = 500` → Ensures reproducibility.
  - **`complete()`**: Extracts one of the imputed datasets (e.g., the 2nd one).

### **Key Insights & Recommendations**
✔ **Mean/Median Imputation** is simple but can distort data distribution.  
✔ **MICE is better** because it preserves relationships between variables.  
✔ **Outliers** should be carefully examined—sometimes they are valid data points.  
✔ **Categorical variables** (e.g., `gender`) should not be imputed with mean/median (use mode or MICE).  

### **Next Steps (If You Were to Expand)**
- Check if `gender` is binary (0/1 or Male/Female) → Mode imputation would be better.
- Use **scaling/normalization** if machine learning is planned.
- Try **multiple outlier detection methods** (IQR, Z-score, DBSCAN).  

Would you like a deeper explanation of any specific part? 🚀
