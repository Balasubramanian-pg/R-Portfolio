data<-AirPassengers

start(data)
end(data)
summary(data)

plot(data, main="Air passengers data (1949-61)")
abline(lm(AirPassengers~time(AirPassengers)))

decomposed<-decompose(data)
plot(decomposed)
boxplot(AirPassengers~cycle(AirPassengers))

#plotting the seasonal variations
library(fpp)
seasonplot(AirPassengers,year.labels = TRUE, year.labels.left = TRUE, col=1:20, pch=19, lwd=2)


plot(log(AirPassengers), main = "difference in mean over years")
#we try to identify the variance and mean differences
log(AirPassengers)
diff(AirPassengers)
plot(diff(AirPassengers))
plot(log(AirPassengers))

#finding the auto correlation factor and partial correlation factor

acf(AirPassengers)
acf(diff(log(AirPassengers)))

plot(diff(log(AirPassengers)))
abline(lm(log(AirPassengers))~time(diff(AirPassengers)))

#finding the partial auto correlation factor
pacf(log(AirPassengers))

plot(pacf(diff(log(AirPassengers))))

#model
model<- arima(log(AirPassengers),c(0,1,1), 
              seasonal = list(order=c(0,1,0),period = 12))
model

#prediction
predictions<-predict(model,48)
predictions

#converting log values into numeric
norm_value<- exp(predictions$pred)
norm_value

#plotting
ts.plot(log(AirPassengers),norm_value, y= log, lty= c(1,3))
