Here's an expanded and enhanced version of your basic R script with detailed explanations and additional functionality:

```R
# File: InstallingR.R
# Course: R: An Introduction (with RStudio)
# Description: Comprehensive introduction to R programming with iris dataset example
# Author: [Your Name]
# Date: [Current Date]

# INSTALLATION AND SETUP ###################################

# Install packages (commented out as they only need to run once)
# install.packages("datasets")  # Contains the iris dataset
# install.packages("pacman")    # Package management tool

# LOAD PACKAGES ############################################

# Load base packages
library(datasets)  # Load built-in datasets

# Load pacman to manage additional packages
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  ggplot2,    # Advanced plotting
  dplyr,      # Data manipulation
  psych       # Extended summary statistics
)

# LOAD AND INSPECT DATA ###################################

# Load iris dataset (already loaded with datasets package)
data(iris)  # Explicitly load the dataset

# Basic inspection
head(iris)         # Show first 6 rows
tail(iris)         # Show last 6 rows
str(iris)          # Show structure of the data
names(iris)        # Show column names
dim(iris)          # Show dimensions (rows, columns)

# SUMMARIZE DATA ##########################################

# Base R summary
summary(iris)      # Summary statistics for all variables

# Enhanced summary with psych package
psych::describe(iris)  # More detailed statistics

# Frequency tables for categorical variable (Species)
table(iris$Species)
prop.table(table(iris$Species))  # Proportions

# Correlation matrix (for numeric variables)
cor(iris[, 1:4])  # Exclude Species (factor variable)

# VISUALIZE DATA ##########################################

# Base R graphics
plot(iris)         # Scatterplot matrix for all variables

# Individual plots
hist(iris$Sepal.Length)  # Histogram
boxplot(iris$Sepal.Width) # Boxplot
plot(iris$Species)       # Bar plot for categorical

# Enhanced plots with ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  ggtitle("Sepal Length vs. Width by Species")

ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  ggtitle("Petal Length Distribution by Species")

# DATA MANIPULATION #######################################

# Using dplyr for data manipulation
iris_summary <- iris %>%
  group_by(Species) %>%
  summarize(
    mean_sepal_length = mean(Sepal.Length),
    mean_sepal_width = mean(Sepal.Width),
    count = n()
  )

print(iris_summary)

# SAVE DATA ##############################################

# Save summary table
write.csv(iris_summary, "iris_summary.csv", row.names = FALSE)

# Save plot
png("iris_plot.png", width = 800, height = 600)
plot(iris)
dev.off()

# CLEAN UP ###############################################

# Clear environment
rm(list = ls()) 

# Clear packages (more comprehensive approach)
p_unload(all)  # Unload all pacman-loaded packages
detach("package:datasets", unload = TRUE)

# Clear plots
while (!is.null(dev.list())) dev.off()

# Clear console (simulate Ctrl+L)
cat("\014")  

# Clear R brain garbage collector (just for fun)
gc()

# Clear mind :)
message("\nAnalysis complete! Mind refreshed and ready for more R!\n")
```

### Key Improvements:

1. **Better Documentation**: Added more detailed header information

2. **Package Management**: 
   - Added pacman for easier package management
   - Included ggplot2 for advanced plotting
   - Added dplyr for data manipulation
   - Included psych for enhanced statistics

3. **Enhanced Data Inspection**:
   - Added more ways to examine the data (tail, str, names, dim)
   - Included psych::describe for better statistics

4. **Improved Visualization**:
   - Added individual plot types
   - Included ggplot2 examples for publication-quality graphics

5. **Data Manipulation**:
   - Added dplyr examples for common data tasks
   - Created summary tables

6. **Data Export**:
   - Added code to save results and plots

7. **More Comprehensive Cleanup**:
   - Better package unloading
   - Environment clearing
   - Plot clearing that works with multiple devices
   - Console clearing simulation

8. **Error Prevention**:
   - Added conditionals for package loading
   - More explicit data loading

This expanded version provides a much more complete introduction to R while maintaining the simplicity of the original script. It shows best practices and introduces important packages used in real-world data analysis.
