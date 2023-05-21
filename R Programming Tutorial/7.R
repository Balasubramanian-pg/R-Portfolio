error_store_data=read.csv("D:/Academics/Third Semester/Predictive Analytics Using R/Global Superstore Orders 2016.csv")

store_data=read.csv("D:/Academics/Third Semester/Predictive Analytics Using R/Global Superstore Orders 2016.csv")

View(store_data)
ncol(store_data)
nrow(store_data)
summary(store_data)
str(store_data)
dim(store_data)
names(store_data) #col names
head(store_data) #top 6
tail(store_data) #bottom 6

a=store_data$Sales
max(a)
mean(a)
which.max(a) #in which row the sales in max (row no)
store_data[which.max(a),]
store_data[c(1:10),]

store_data$costofproduction=store_data$Sales-store_data$Profit
View(store_data)

#subset
detail = subset(store_data,store_data$Sales==max(store_data$Sales))
detail

#dplyr
install.packages('dplyr')
any(grepl("grid",installed.packages()))
library(dplyr)


a=select(store_data,Sales:costofproduction)
a=select(store_data,c(Sales,costofproduction))
View(a)
b=select(store_data,starts_with("S"))
b=select(store_data,ends_with("S"))
b=select(store_data,contains("a"))
b=select(store_data,matches("ua"))
View(b)
c=filter(store_data,Sales>=1000 & Profit>=1000 & Country=="Australia")
View(c)


#pipe %>%
store_data%>%
  filter(Sales>=1000)%>%
  filter(Profit>=1000)%>%
  filter(Country=="Australia")%>%
  View()

d=arrange(store_data,Country)
View(d)
e=mutate(store_data,cop=Sales-Profit)
View(e)
