#creating 3 vectors
car_a<- c(5,2,4,1,2)
car_b<- c(3,4,2,2,3)
car_c<- c(3,3,5,4,3)

#combining all the cars in one set
all_car<-c(car_a,car_b,car_c)

inital_matrix<-matrix(all_car,ncol =3,nrow =5, byrow =F)
print(inital_matrix)

#add row & column name
criteria<- c('cost', 'practicality','performance','reliability','fuel economy')
option<-c('Ferrari','Mini Cooper', 'Benz')

m2<- matrix(all_car,ncol=3,nrow=5,byrow =F, dimnames =list(criteria,option))
print(m2)

#add column totals
Total_cars<-colSums(m2)
print(Total_cars)

#add total cars as an extra row in m2 =rbind
simple_decision_matrix<- rbind(m2,Total_cars)
print(simple_decision_matrix)

#add weights

weights<- c(4,1,3,5,2)
wcar_a<- car_a*weights
wcar_b<- car_b*weights
wcar_c<- car_c*weights

w_all_car<- c(wcar_a,wcar_b,wcar_c)
m3<-matrix(w_all_car,ncol=3,nrow=5,byrow=F, dimnames= list(criteria,option))
print(m3)

Total_weight<-colSums(m3)
print(Total_weight)
s_d_m=rbind(m3,Total_weight)
print(s_d_m)
