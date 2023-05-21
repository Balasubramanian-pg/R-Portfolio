AP<- AirPassengers
AP
start(AP)
end(AP)
plot(AP, type="l", main="Air passengers data (1949-60)")
abline(lm(AirPassengers~time(AirPassengers)))

decompose(AP)
plot(decompose(AP))

boxplot(AirPassengers~cycle(AirPassengers), main="Median passengers (Month-wise)")

library(fpp)
seasonplot(AirPassengers,year.labels = TRUE, year.labels.left = TRUE, 
           col=1:15,pch=15, lwd=2)
plot(log(AirPassengers), main="Variance in data")

plot(diff(AirPassengers), main="Mean in data")

abline<-lm(log(AirPassengers))~time(diff(AirPassengers))
acf(AirPassengers)

acf(diff(log(AirPassengers)))
plot(diff(log(AirPassengers)))

pacf(AirPassengers)
pacf(diff(log(AirPassengers)))

model<-arima(log(AirPassengers),c(0,1,1), seasonal= list(order=c(0,1,0),period=12))
prediction<-predict(model,48)
prediction

air_predict<- 2.718^prediction
air_predict

ts.plot(AirPassengers,air_predict,log="y",lty=c(1,3))
