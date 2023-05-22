library(datarium)
any(grepl("datarium",install.packages()))
install.packages("datarium")

library(datarium)

View(marketing)
summary(marketing)
split<-sample(2,nrow(marketing), replace = TRUE, prob = c(0.7,0.3))
train<- marketing[split==1,]
test<-marketing[split==2,]

dim(marketing)
dim(train)
dim(test)

model<-lm(sales~., data=train)
model
summary(model)

predictions<-predict(model, data.frame(youtube=19, facebook=120, newspaper=20))
predictions
