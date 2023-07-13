#working directory
getwd() #its just a record of systems data


#print
print("this is so cool")


# variable - a temporary body in which data values can be assign
# There are 4 ways of assigning variable  

#first way to assign value

a<-10
print(a)

# second way

"mitra"->b
print(b)

20->b
print(b)

#third way

d= "bobby"
print(d)

d=40
print(d)

#fourth way

f<<- "babykeem"
e<<-50
print(e)


# rules to naming of variable

#The name cannot start with number

9A<-10 #it shows an error Condition()

A_9<-10
#it shows no error because start with alphabet 

sales_jan_1<-
sales_feb_2<-  

  #it cannot start with a special character
  
@A<-10 # we cannot use any where in language it may be start or middle or end

_A<-10 # we cannot start with _(Underscore) in starting

a_<-20 # we can use in between or end



# data types i  R language

# 1) numeric data

a<-20
print(a)  
class(a)# use to particular numeric data

a<- "20,30"
print(a)  
class(a) # by putting "" its change into character data

# 2) Integer data type
b<-30L #only Capital letter can be use date is L no other alphabet can be used
print(b)
class(b)

# 3) character data

c<-"this is R language"
class(c)


# 4) logical data type

C<-TRUE
class(C)

# duplicate variable name

a<-10
print(a)


a<-30
print(a) # if duplicate variable is found, R will run latest assigned value 

# complex
e<-10+25i #(it with "i")
print(e)
class(e)

# how to check data type
a<-10
is.numeric(a) 

a<-10-30i
is.numeric(a)
  
b<-10
is.logical(b)
c<-"this is R langauage"
is.character(c)


d<-20-23i
is.complex(d)


e<-TRUE            
is.logical(e)


# convert data type into other data type

a<-10
class(a)
b<-as.integer(a)
class(b)


a<-10 # if value is 0 then it will show false, if it is not zero then it will shows true.
print(a)
b<-as.logical(a)
class(b)
b

a<-10
class(a)
b<-as.character(a)
b
class(b)

a<-10
class(a)

b<-as.complex(a)
b
class(b)



a<-35
class(a)
b<-as.numeric(a)
b
class(b)

a<-10L
b
class(b)
b<-as.logical(b)
b
class(b)

a<-10L
b
class(b)
b<-as.complex(b)
b
class(b)

a<-10L

class(b)
b<-as.character(b)
b
class(b)



a<-"i love uh"
class(a)

b<-as.numeric(a)
b
class(b)

a<-"i love uh"
class(a)
b<-as.complex(a)
b
class(b)


a<-"i love uh"
class(a)
b<-as.numeric(a)
b
class(b)

a<-"200"
class(a)
b<-as.logical(a)
b
class(b)

a<-"200"
class(a)
b<-as.complex(a)
b
class(b)


data() # function
data # variable 


## 16/02/2023

# operators

# assignment operators <-, ->,=, ->>

# arithmetic operator +,-,/,*,%%, %/%,^

a<-10
b<-20

c<-a/b
print(c)


a<-10
b<-20

c<-a*b
print(c)

a<-10
b<-20

c<-a-b
print(c)

a<-105
b<-20

c<-a%%b
print(c)


a<-120
b<-20

c<-a%/%b
print(c)

a<-2
b<-3

c<-a^b
print(c)



a<-1:100
b<-101:200
c<-a+b
print(c)

a<-1:100
b<-101:200
c<-a-b
print(c)


a<-1:100
b<-101:200
c<-a^b
print(c)


# VECTORS
# Vector is a data structre denoted with "c"

# length of two should be same
a<-c(12,34,56,78,89)
b<-c(34,45,67,89,12)

c<-a+b
c


a<-c(12,34,56,78,89)
b<-c(34,45,67,89,12)

c<-a^b
c

a<-c(12,34,56,78,89)
b<-c(34,45,67,89,12)

c<-a%/%b
c

a<-c(12,34,56,78)
b<-c(34,45,67,89,12)

c<-a+b
c

a<-c(12,34,56,78,89)
b<-c(34,45,67,89,12)
C<-c(25,43,67,89,24)
d<-a+b*c
d



#if want to know the length of function
a<-c(12,34,56,78)
b<-c(34,45,67,89,12)
length(a)

c<-a+b
c

a<-1:1000
length(a)


#string data
#arithmetic functions cannot be performed on character data type

a<-c("hi","this","is","r","language")
b<-c("oh","yeah","lets","do","it")

a+b

a<-c("hi","this","is","r","language")
b<-c(35,36,46,35,80)

a+b

a<-c("hi","this","is","r","language")
b<-c(TRUE,FALSE)

a+b


# Relational operators
# in relational operators output is in true and false only 
a<-10
b<-20

a>b

a<-10
b<-20

a==b

a<-10
b<-20

a<b

a<-300
b<-2000

a>=b
# relational operators - >,<, ==, >=, <=, !=
# also can perform in vectors also
a<-300
b<-2000

a<=b

a<-c(23,45,67,89,23)
b<-c(34,67,78,98,12)
a<b

a<-c(23,45,67,89,23)
b<-c(34,67,78,98,12)
a>=b

a<-c(23,45,67,89,23)
b<-c(34,67,78,98,12)
a!=b

a<-c(23,45,67,89,23)
b<-c(34,67,78,98,12)
a==b


#logical operators 
#denote with "&" "|"(or)

a<-10
b<-20

if(a==b & a<b){
 print("a is greater then b") 
}else
{
  print("a is not greater than b")
}

a<-10
b<-20
if(a==b | a<b){
  print("a is greater then b") 
}else
{
  print("a is not greater than b")
}


#if statement
a<-200
if(a>18){
  print("you are eligible")
}else{
  print("you are not eligible")
}


a<-16
if(a>18){
  print("you are eligible")
}else{
  print("you are not eligible")
}


#if & else if

a<-80

if(a>=80){
  print("you are passed in distinction")
}else if (a<80 & a>=60)
{
  print("passed with first division")
}else if (a<60 & a>=40)
{
  print("you are passed in second division")
}else
  {
  print("you are fail")
  }


a<-55

if(a>=80){
  print("you are passed in distinction")
}else if (a<80 & a>=60)
{
  print("passed with first division")
}else if (a<60 & a>=40)
{
  print("you have passed into second division")
}else
{
  print("you have failed")
}



#Indexing
# r language is only start with 1 in other its start with 0
a<-c(12,34,56,78,90)

#switch
a<-switch(3,12,14,56,78,90,45)
a


a<-1:1000
a
b<-switch(2,"hi",29,"15+1i",TRUE)
b


b<-"10"
c<-switch(b,
          "10"="this",
          "20"="that",
          "30"="there")
c

#loop
#for loop
for (a in 1:1000) {
  print(a)
}
a<-c(12,23,45,67,89,90,12,34,56,78,90)
a
for (b in a){
  print(b)
}


# function
#built function()
#user Function

fun_name<-function(X,Y,Z){
     result<-X+Y+Z
     print(result)
}

fun_name(20,30,12)
fun_name(34,100,76)

fun_name<-function(){
  for (i in 1:100) {
    print(i)
  }
}

fun_name()

fun_name2<- function (x=7, y=9, z=23){
  res<- x*y-z
  print(res)
}

fun_name2()

fun_name2(23,30,56)

#Built in function
#absolute value is always positive
x<- -10
abs(x)

x<- c(10, -23, -44, 56,78)
abs(x) #it converted negative value to postive

#ceiling function
# thos value in desimal it rund figure that value in upper figure

ceiling(9.3)
ceiling(19.5)
ceiling(100.1)


#floor function
#those value in desimal it rund of that value in lower figure

floor(20.3)
floor(125.1)


#trunc
#its remove decimal value from the figure

trunc(85.3)
trunc(60.9)


#min function
#its shows min value from all figure
a<-c(12,45,78,90,24,56,89)
min(a)

min(20,25,36,10,1)

#View function
data<-mtcars
min_mileage<-min(data$hp)
min_mileage
View(data)

max_mileage<-max(data$mpg)
max_mileage


sin(234)
log(234)
cos(234)
tan(234)


#mode

mode<-table(data$mpg)
mode

mode<-table(data$mpg)
mode
sort(mode, decreasing = TRUE)

#function for string
a<-c('NFRealmusic')
substr(a,4,9)
 
# to upper function its change lower to uppercase.
a<-c('NFRealmusic')
toupper(a)
a<-c('NFREALMUSIC')
tolower(a)


#grep function

a<-c("1234rty","1234tyu", "456yu","567nhu")
pattern <- '67'
grep(pattern,a)



#Data structure

# Vector it is a collection of same data type

#first method is c method
a<-c(1,2,3,4,5)
class(a)
is.vector(a)
# colon method 
a<-1:100
View(a)

is.vector(a)


#sequence method

a<-seq(1,100, by=2.5)
a
is.vector(a)


a<-seq(1,100,length.out= 1000)
a
is.vector(a)

#vector in integer

a<-c(12L,20L,30L)
a
class(a)
is.vector(a)

a<-c(1L:20L)
a
class(a)
is.vector(a)



a<-c(1,2,3,4,5,6)
class(a)
b<-as.integer(a)
b
is.vector(b)

#charcter vector
a<-c("i","love","you")
class(a)
b<-as.numeric(a)
b
is.vector(b)



#how to access vector


a<-c(12,45,65,85,30,58,78,89)
a[4]
a[2:6]
a[1:15]

a[c(3,5)] # for random select only by vector can do

a[-2]

a[c(-2,-4)]


a<-c("this"=1,"is"=2, "R"=3)# only sequence number can be use 
a[3]
a[2]
# how to give name to vector
a<-c("this", "is", "r", "langauage")

names(a)= c("sith", "si", "r", "uage")
a


a["si"]
a<-c("this", "is", "r", "langauage")
names(a)= c("25","20","4","25")
a["4"]


21/03/2023

#Rep function i vector
#to repeat the element of vector

a<-rep(c(1,2,3,4,5,6), time=5)
a


a<-rep(c(1,2,3,4,5,6), each=3)
a

a<-rep(c(1,2,3,4,5),time=c(2,3,4,5,6))
a



#any n all
# any use in sales or in profit to check which value is greater then
a<-1:10
any(a>8)

a<-1:10
any(a>11)

all(a>12)

#rank sort order
#sort use to give ascending order
a<-c(23,56,12,4,87,43)
sort(a)

a<-c(23,56,12,4,87,43)
sort(a, decreasing = T) #T is True if we want in descending order then 
# have to mention decreasing if not it will auto show ascending

#order function

a<-c(23,56,12,4,87,43)
order(a) #it give index number

#rank

a<-c(23,56,12,4,87,43)
rank(a) # it give rank of particular numerical

#list

#collection of multiple data type 
#note vector is only one data type

a<-list(12,"there",20+10i, TRUE)
a

a_num<-c(3,5,7,8,9)
a_char<-c("there", "is", "a", "function")
a_log<-c(TRUE,FALSE)
alist=list(a_num,a_char,a_log)
alist

#how to give name to a list

list_1<-list(c("Abel","Travis","Drake"),
             c("BA","BBA","BCA"),
             c(24,56,60))
list_1
names(list_1)<-c("studentName","course","marks")
list_1


list_1[[1]][1]

list_1["course"] # colum name

list_1$studentName
list_1$course


#unlist - to convert list into vector

list_1<-list(1:10)
list_2<-list(2:11)
list_1
list_2

list_1+list_2 # its give error


unlist_1<-unlist(list_1)
unlist_2<-unlist(list_2)
unlist_1+unlist_2


#matrix
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P <- matrix(c(3:14), nrow = 4, ncol = 3, dimnames = list(rownames, colnames))
P
rbind(P,c(12,34,45)) #to add a row
cbind(P,c(32,45,45,34)) #to add a col

#transpose

mat=matrix(c(3:14), nrow = 4, ncol = 3)
mat
t(mat)

#dataframe : collection of different types of data
df=data.frame(
  student_id=c(1:5),
  student_name=c("A","B","C","D","E"),
  student_fees=c(30000,45000,45000,23000,12000),
  join_date = as.Date(c("2022-01-01", "2022-09-23", "2022-11-15", "2022-05-11","2022-03-27")),
  stringsAsFactors = FALSE
)

plot(x=df$student_id,y=df$student_fees,type ='o')

motor=mtcars
View(trees)
data()
plot(x=motor$hp,y=motor$mpg)
str(df)
summary(df)

df[2,3]
df[2:5,3]
df[c(2,5),c(1,4)]


#factor - it is categorical data
direction=c("north","east","west","south")
x=factor(direction)
x
direction[2]

# upload data 
error_store_data=read.csv("D:/Academics/Third Semester/Predictive Analytics Using R/Global Superstore Orders 2016.xlsx")

store_data=read.csv("D:/Academics/Third Semester/Predictive Analytics Using R/Global Superstore Orders 2016.xlsx")

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

install.packages('openxlsx')
options(java.parameters = "-Xmx8000m")
library(openxlsx)

a=read.xlsx('D:/Academics/Third Semester/Predictive Analytics Using R/Global Superstore Orders 2016.xlsx',sheet = 1)
View(a)

b=read.delim('"D:/Academics/Third Semester/Predictive Analytics Using R/Data/LungCapData.txt"')
View(b)

data()

a=CO2
View(a)
data(package=.packages(all.available = TRUE))

install.packages('datarium')
library(datarium)
a=marketing
View(a)


#split the data into train and test
install.packages('caTools')
library(caTools)
split=sample.split(a,SplitRatio = 0.8)
train=subset(a,split==TRUE)
test=subset(a,split==FALSE)
dim(a)
dim(train)
dim(test)

#another way
set.seed(234)
rows=sample(nrow(a))
data=a[rows,]
View(data)

split=nrow(data)*0.60
train=data[1:split,]
test=data[(split+1):(nrow(data)),]
dim(data)
dim(train)
dim(test)


#missing data value
c=c(1,2,3,NA,4,NA,NA,7,8,NA,10)
b=c[complete.cases(c)]
b

install.packages('tidyverse')
library('tidyverse')
data=starwars
View(data)

data%>%select(height,mass,hair_color,gender)%>%
  filter(!complete.cases(.))%>%View()


#mice
install.packages('mice')
library(mice)
md.pattern(data)

#na.omit
b=na.omit(data)
data=starwars
b%>%select(height,mass,hair_color,gender)%>%na.omit(.)%>%View()
b%>%select(height,mass,hair_color,gender)%>%drop_na(.)%>%View()
data%>%select(sex)%>%mutate(sex=replace_na(sex,"Third gender"))%>%View()

mean(data$height,na.rm=TRUE)


x<-c(12,34,56,78,90)
label<-c("ind","pak","NZ","aus","us")
colour<-c("blue","red","yellow","green","pink")
pie_percentage<-round(100*x/sum(x))
pie(x,pie_percentage, main = "population country",
    col = colour)# main is heading 



#3d pie chart
#plotrix
install.packages("plotrix")
library(plotrix)
pie3D(x,labels=pie_percentage,main="Population",explode = 0.2)
legend("topleft",label,cex=1,fill=colour) #cex is a size of label


a<-c(12,34,56,78,89)
label<-c("jan","feb","mar","apr","may")
barplot(a,names.arg=label,xlab = "MOnth",
        ylab="Sales", main = "Sales in year",
        col = rainbow(length(a)),ylim = c(1,100))
legend("topleft",labels=label,cex=0.1,fill=rainbow(length(a))) #cannot use legend in barplot


a=mtcars
View(a)
hist(a$gear,col = rainbow(length(a$gear)),
     ylim = c(1,20),xlim = c(1,5),xlab = "Gears",ylab = "Frequency",
     breaks = 15
     )

library(openxlsx)
install.packages('ggplot2')
library(ggplot2)
data=read.xlsx('D:/STUDIES/MBA/Sem 3/R/global_superstore_2016.xlsx',sheet = 1)



data=iris
class(data)
View(data)
library(dplyr)


a=iris%>%count(Species)
a
pie(a$n,labels=a$Species)



b=read.delim('D:/STUDIES/MBA/Sem 3/R/lung_data.txt')
View(b)
a=b%>%count(Smoke)
a
pie(a$n,labels = a$Smoke,col=rainbow(length(a$Smoke)))
barplot(a$n,names.arg = a$Smoke,col=rainbow(length(a$Smoke)))

#graph
a=c(12,32,34,34,56,12,67)
b=c(43,54,67,23,12,56,12)
c=c(42,54,34,32,13,54,45,24)
plot(a)
plot(a,type = "o",col="red",lwd=2)
plot(a,type = "l")
plot(a,pch=5,type = "o")

lines(b,type='o',col="blue",lwd=2)
lines(c,type='o',col="green",lwd=2)


a=mtcars$carb
b=mtcars$drat
c=mtcars$wt
plot(a,type = "o",col="red",lwd=2)
lines(b,type='o',col="blue",lwd=2)
lines(c,type='o',col="green",lwd=2)

#scatterplot
mtcars
plot(mtcars$mpg,mtcars$wt,xlim = c(1,50),ylim = c(1,7),ylab = "WT",xlab = "MPG")


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



























# youtube, facebook, newspaper are x values
# data should be continous and not categorical
# generally linear regression is for data prediction and inferenece ex: housing data and fit

install.packages("datarium")
library(datarium)
View(marketing)
#preparation of model
# let's move to simple linear regression. Which has only one X variables
attach(marketing)
plot(youtube,sales) # the scatter plot is in an upward movement, this show the data is moving in relation to other

#once we visualize let's model the data

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
# if slope value is low, it indicates that when there is a 
# watch out values like residual error, coefficients and intercept
# the m value should not be negative, that makes less sense 
# the more R-squared the more accurate our R-squared, Residual standard error - the distance between our prediction and absolute values
# we care for the stars in the value, 1* don't take, 3*- Yes cigar
# the residual error - the lesser the better
# P value justifies the changes the Variables

#assigning the air passenger to a variable and initial analysis
a<- AirPassengers
a
start(a)
end(a)
plot(a)
abline(lm(AirPassengers~time(AirPassengers)))

#decomposing the data to find out the trend
decompose(a)
#plotting the decompose
plot(decompose(a))

#finding the cyclical variation using boxplot
boxplot(AirPassengers~cycle(AirPassengers))

library(fpp)

seasonplot(AirPassengers,years.label=TRUE,years.label.left=TRUE,col=1:20,pch=19,lwd=2)
# to find the variance in the time series
plot(log(AirPassengers))

abline(lm(log(AirPassengers~time(AirPassengers))))

#to find the difference among mean
diff(AirPassengers)
plot(diff(AirPassengers))

# we can see this is a non stationery dataset

#converting to stationery dataset and comparing
plot(AirPassengers)
abline(lm(log(AirPassengers))~time(diff(log(AirPassengers))))

acf(AirPassengers)
acf(diff(log(AirPassengers)))

plot(diff(log(AirPassengers)))

pacf(AirPassengers)
pacf(diff(log(AirPassengers)))

model<-arima(log(AirPassengers),c(0,1,1),seasonal = list(order=c(0,1,0),period=12))
prediction <- predict(model,48)
prediction

air_predict<-2.718^prediction
air_predict

ts.plot(AirPassengers, air_predict, log='y', lty=c(1,3))


# random forest


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


#08-05-23

#Decision-tree
library(rpart)
#upload the data
data<-read.csv("C:/Users/GANESH/Downloads/fitnessAppLog.csv")
View(data)
# the algorithm selects the best suited x value
# we prepare the model, the confusion matrix, and the accuracy
split<- sample(2,nrow(data),replace= TRUE, prob = c(0.7,0.3))
train<- data[split==1,]
test<- data[split==2,]

dim(data)
dim(train)
dim(test)
#preparation of model
library(rpart)
# there are three components for decision tree - formula, data, method. The predictive value is Y value.
attach(data)
tree_model<- rpart(PayOrNot~., data = train, method  ="class")
plot(tree_model)
text(tree_model)
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(tree_model, extra =4) # extra= 4  is used for width
# the value "hours" is significantly correlated


data<-read.csv("C:/Users/GANESH/Downloads/fitnessAppLog.csv")
View(data)
split<- sample(2,nrow(data),replace= TRUE, prob = c(0.8,0.2))
train<- data[split==1,]
test<- data[split==2,]

tree_model<- rpart(PayOrNot~., data = train, method  ="class")
plot(tree_model)
text(tree_model)
library(rpart.plot)
rpart.plot(tree_model, extra =4)
tree_model

#prediction
prediction<-predict(tree_model,test, type ="class")
prediction
# we can add the prediction value to the data so that we can compare them
View(test)
test$predictions<-prediction
View(test)

#confusion matrix

matrix<- table(test$PayOrNot, test$predictions)
matrix

accuracy<-sum(diag(matrix)/sum(matrix))
accuracy*100

#on the iris dataset
data<- iris
split<-sample(2,nrow(data), replace = TRUE, prob =c(0.7,0.3))
train<- data[split==1,]
test<- data[split==2,]
dim(data)
dim(train)
dim(test)
attach(data)
model<-rpart(Species~.,data=train,method="class")
rpart.plot(model)

prediction<- predict(model, test, type = "class")
prediction
test$predictions<- prediction
View(test)

matrix<- table(test$Species, test$predictions)
matrix

accuracy<-sum(diag(matrix)/sum(matrix))
accuracy*100

install.packages("neuralnet")
data<-read.csv("C:/Users/GANESH/Downloads/dividendinfo.csv")
View(data)
#Step 1: normalize the data
#formula for normalization, (x-min(x))/max((x)-min(x))
names(data)
attach(data)
data$fcfps <-(data$fcfps- min(data$fcfps))/(max(data$fcfps)-min(data$fcfps))
data$earnings_growth <-(data$earnings_growth- min(data$earnings_growth))/(max(data$earnings_growth)-min(data$earnings_growth))
data$de <-(data$de- min(data$de))/(max(data$de)-min(data$de))
data$mcap <-(data$mcap- min(data$mcap))/(max(data$mcap)-min(data$mcap))
data$current_ratio <-(data$current_ratio- min(data$current_ratio))/(max(data$current_ratio)-min(data$current_ratio))

View(data)

#split the data into train and test

split<-sample(2,nrow(data), replace=TRUE, prob = c(0.7,0.3))
train<- data[split==1,]
test<-data[split==2,]

dim(data)
dim(train)
dim(test)

#model
#set seeds - jumbling the data
library(neuralnet)
set.seed(169)
model<-neuralnet(dividend~fcfps+de+mcap, data=train, 
                 hidden = 4,err.fct = 'ce',linear.output = FALSE)
plot(model)  
  
#prediction

predictions<-compute(model,test[,-1])
View(prediction)  
head(prediction$net.result)

pred<- prediction$net.result
ann<- ifelse(pred>.05,1,0)
test$prediction<-ann
matrix<-table(test$dividend, test$prediction)
matrix

acc<-sum(diag(matrix)/sum(matrix))
acc*100


#univariate analysis
#single variable, or single column of our data for analysis is known as univariate analysis
mtcars
View(mtcars)
table(mtcars$gear)
table(mtcars$cyl)

boxplot(mtcars$mpg)
plot(mtcars$mpg)
summary(mtcars$mpg)
hist(mtcars$mpg)
pie(mtcars$cyl)

library(dplyr)
a<- mtcars%>%count(mtcars$cyl)
a
pie(a$n, labels=a$'mtcars$cyl')

data<-read.csv("C:/Users/GANESH/Downloads/US Tornado Database/us_tornado_dataset_1950_2021.csv")
View(data)
table(data$Magnitude)
a<-table(data$State)
sort(a)

install.packages("psych")
library(psych)
describe(data$Magnitude)
describe(data$Fatalities)
 
cor(data$Fatalities,data$Injuries, method = "pearson")
