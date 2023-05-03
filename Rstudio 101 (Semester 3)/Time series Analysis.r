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
