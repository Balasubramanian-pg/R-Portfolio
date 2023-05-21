ap<-AirPassengers
plot(ap)
start(ap)
end(ap)
abline(lm(AirPassengers~time(AirPassengers)))
decomposed<-decompose(ap)
plot(decomposed)

#finding varaince
variance=log(AirPassengers)
plot(varaince, main="Difference in Variance")
#finding mean
mean=diff(AirPassengers)
plot(mean, main="Difference in Mean")

#finding auto correlation factor
acf(diff(AirPassengers))

#finding partial correlation factor
pacf(diff(AirPassengers))

#building model

model<-arima(log(AirPassengers),c(0,1,1),seasonal = list(order=c(0,1,0),period=12))

#prediction
prediction<- predict(model,48)
prediction

#converting log values in numeric
air_prediction<-2.718 ^ prediction
#plotting time series prediction
ts.plot(AirPassengers,air_prediction,log="y",lty=c(1,3))
