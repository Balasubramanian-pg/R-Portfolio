a<- iris
a

install.packages("randomForest")
library(randomForest)


attach(iris)
# the first step is split data into train and test
split<-sample(2,nrow(iris), replace =TRUE, prob = c(0.8,0.2))
train<-iris[split==1,]
test<-iris[split==2,]
dim(iris)
dim(train)
dim(test) # to check the data has been split properly

#let's add one column named prediction in our test value
test$prediction<-predict
View(test)

predict<-predict(model, test)
predict

test$prediction<-predict
View(test)


#confusion matrix

matrix<- table(test$Species, test$prediction)
matrix

# preparing the accuracy check
#the formula for accuracy is sum of log divided by sum of the matrix

accuracy<-sum(diag(matrix)/sum(matrix))
accuracy*100

attach(iris3)
split<-sample(2,nrow(iris3), replace =TRUE, prob = c(0.8,0.2))
train<-iris3[split==1,]
test<-iris3[split==2,]
dim(iris3)
dim(train)
dim(test)

predict<-predict(model, test)
predict

test$prediction <-predict
View(test)

#Confusion matrix
matrix<- table(test$Species, test$prediction)
matrix

accuracy <-sum(diag(matrix)/sum(matrix))
accuracy *100
