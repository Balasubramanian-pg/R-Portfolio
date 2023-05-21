#graph
a=c(23,27,29,31,33,35,37)
b=c(26,29,32,35,38,41,44)
c=c(29,34,38,42,46,50,54)
plot(a, type = "o", col="red", lwd=2)
plot(a, type = "l")
plot(a,pch=5, type="o")
lines(b,type='o',col="blue",lwd=2)
lines(c,type='o',col="green",lwd=2)


a=mtcars$carb
b=mtcars$drat
c=mtcars$wt
plot(a,type = "o",col="red",lwd=2)
lines(b,type='o',col="blue",lwd=2)
lines(c,type='o',col="green",lwd=2)
