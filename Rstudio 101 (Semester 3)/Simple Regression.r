install.packages("datarium")
library(datarium)
View(marketing)
#preparation of model
# let's move to simple linear regression. Which has only one X variables
attach(marketing)
model <-lm(sales~youtube, data = marketing)
model
summary(model) 
abline (model, col="red", lwd=3)
#split the data into train and test
split<-sample(2,nrow(marketing),replace = TRUE, prob = c(0.6,0.4))
train<-marketing[split==1,]
test<-marketing[split==2,]
dim(marketing)
dim(train)
dim(test)

model_1<-lm(sales~youtube, data =train)
model_1
summary(model_1)
summary(model)

#predict has two parameters, one is the model and data frame value assigned
predict <- predict(model, data.frame(youtube=16))
predict

prediction_1<-predict(model_1,data.frame(youtube=130))
prediction_1
