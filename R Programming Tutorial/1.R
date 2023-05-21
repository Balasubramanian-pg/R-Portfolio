#GGPLOT
library(ggplot2)
ggplot(mtcars,aes(x = mtcars$wt,y=mtcars$mpg))+geom_point()
ggplot(ToothGrowth, aes(x=ToothGrowth$supp, y=ToothGrowth$len))+geom_bar(stat="identity")
ToothGrowth$len




#basic graphs
boxplot(mtcars$mpg,col = "red",horizontal = TRUE,notch = TRUE)
par(mfrow=c(2,2))
plot(mtcars$mpg,mtcars$hp)
plot(mtcars$disp)
boxplot(mtcars$mpg,col = "red",horizontal = TRUE,notch = TRUE)
plot(mtcars$mpg,mtcars$wt,xlim = c(1,50),ylim = c(1,7),ylab = "WT",xlab = "MPG")


#split
#sample method
split=sample(2,nrow(iris),replace = TRUE,prob=c(0.7,0.3))
split
train=iris[split==1,]
test=iris[split==2,]
dim(iris)
dim(train)
dim(test)

#outlier
boxplot(mtcars$hp)
out=boxplot.stats(mtcars$hp)$out
outlier=which(mtcars$hp%in%c(out))
mtcars[outlier,]


boxplot(mtcars$hp)
out=boxplot.stats(mtcars$hp)$out
outlier=which(mtcars$hp %in% c(out))
mtext(paste("outlier_data", paste(out,collapse = ",")))

#quantile
lower_bound <- quantile(mtcars$hp, 0.025)
