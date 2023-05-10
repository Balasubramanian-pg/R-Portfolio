# creating vectors

name<-c('a','b','c','d','e','f','g','h')
type<- c('Ice Cream', 'Ice Cream','Milk Shake','Ice Cream','Ice Cream', 'Ice Cream','Milk Shake','Milk Shake')
revenue<- c(233.5,178.5,200.7,350.8,13.8,356.8,243.8,412.3)
quantity<-c(3,4,6,1,7,2,8,5)
cash<-c('Y','N','Y','Y','N','N','Y','Y')

#Creating dataframes
d1<- data.frame(name,type,revenue,quantity,cash)
print(d1)
View(d1)
d1["revenue"]

#conditional indexing or filtering; '$' is used to mention the columns which are constant

d2<-d1[d1$cash=='Y',]
d2

d3<-d1[d1$quantity>4,]
d3

sum(d1[d1$type=='Milk Shake',3])
sum(d1[d1$type=='Ice Cream',3])

cash_payment<- c(d1$cash!='Y')
sum(cash_payment)

ice_cream<-c(d1$type=='Ice Cream')
sum(ice_cream)

milk_shake<-c(d1$type=='Milk shake')
sum(milk_shake)

#sales depending on quantity

sum(d1[d1$type=='Milk Shake',4])
sum(d1[d1$type=='Ice Cream',4])
