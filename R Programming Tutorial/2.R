library(ggplot2)
View(mtcars)
ggplot(mtcars, aes(x= wt, y=mpg))+ geom_point()

View(ToothGrowth)
ggplot(ToothGrowth, aes(x= supp, y=len))+ geom_bar(stat = "identity")
