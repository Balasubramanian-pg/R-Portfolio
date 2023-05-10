# box plot
ggplot(mtcars,aes(mpg,factor(cyl)))+ geom_boxplot()
#add notch =TRUE
ggplot(mtcars,aes(mpg,factor(cyl)))+ geom_boxplot(notch =TRUE)
#OUTLIER COLOR,SHAPE AND SIZE
ggplot(mtcars, aes(mpg, factor(cyl))) +
  geom_boxplot(outlier.colour = "blue", outlier.shape = 8, outlier.size = 3) +
  stat_summary(fun = mean, geom = 'point', shape = 20, size = 8)
ggplot(mtcars, aes(mpg, factor(cyl))) +
  geom_boxplot(outlier.colour = "blue", outlier.shape = 8, outlier.size = 3) +
  stat_summary(fun = mean, geom = 'point', shape = 20, size = 8)

A<-mtcars[mtcars$cyl=='4',1]
print(a)
summary(a)

B<-mtcars[mtcars$cyl=='6',1]
print(B)
summary(B)

C<- mtcars[mtcars$cyl=='8',1]
print(C)
summary(C)

