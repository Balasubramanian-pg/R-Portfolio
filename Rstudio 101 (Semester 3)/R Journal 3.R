#loading the data
df<-read.csv("D:/Academics/Third Semester/Predictive Analytics Using R/R Jounral/Bank Wages.csv")
#basic data reading commands
head(df)
tail(df)
str(df)
summary(df)

#to find missing values
colSums(is.na(df))
rowSums(is.na(df))
#outlier detection
library(ggplot2)
ggplot(df,aes(salary))+geom_boxplot()
summary(df$salary)
print(df)

#deletion method
df<-df[c(29),]
summary(df)
print(df)

#mode 2
#imputation with mean for salary
!is.na(df$salary)
#replacing na values
df$education[is.na(df$education)]<-mean(df$education[!is.na(df$education)])
sum(is.na(df$education))

df$education[is.na(df$education)]<-median(df$education[!is.na(df$education)])
sum(is.na(df$education))

df$gender[is.na(df$gender)]<-mean(df$gender[!is.na(df$gender)])
sum(is.na(df$gender))

df$gender[is.na(df$gender)]<-median(df$gender[!is.na(df$gender)])
sum(is.na(df$gender))

#Grubbs test for outliers to find Single outlier
install.packages("outliers")
library(outliers)
test<- grubbs.test(df$salary)
test1<-grubbs.test(df$education)

print(test)
print(test1)
df$salary[df$salary=='1000']<-mean(df$salary)
df$education[df$education=='139']<-mean(df$education)
summary(df$salary)
summary(df$education)

#MICE
df<-read.csv("")
install.packages("mice")
library(mice)
#removing categorical variables
df.n<-subset(df,select=-c(job,minority,gender))
#graphical rep
md.pattern(df.n)

#insight
imputed_df <- mice(df.n, method = "pmm", m = 5, maxit = 50, seed = 500)
summary(imputed_df)
completedata1<- complete(imputed_df,2)
summary(completedata1)

