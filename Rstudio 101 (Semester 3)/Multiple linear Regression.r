#Multiple linear regression
model <-lm(sales~youtube+facebook, data = marketing)
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


predict <- predict(model, data.frame(youtube=130, facebook = 30))
predict 