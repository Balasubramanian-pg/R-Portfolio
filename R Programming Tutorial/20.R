# importing the data
data<-read.csv("D:/Academics/Third Semester/Predictive Analytics Using R/Data/fitnessAppLog.csv")

View(data)
summary(data)

#splitting the data

split<-sample(2,nrow(data),replace = TRUE, prob = c(0.8,0.2))
train<- data[split==1,]
test<- data[split==2,]

#checking the dimensions

dim(data)
dim(test)
dim(train)

#preparation of model

library(rpart)
library(rpart.plot)

tree_model<- rpart(PayOrNot~., data= train, method="class")
rpart.plot(tree_model)

#prediction

prediction<- predict(tree_model, test, type = "class")
prediction

test$predictions<- prediction
View(test)

#creating confusion matrix
cf_matrix<- table(test$PayOrNot, test$predictions)
cf_matrix

#checking accuracy of the score

acc<- sum(diag(cf_matrix)/sum(cf_matrix))
acc*100

