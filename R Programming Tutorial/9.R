#3d pie chart
#plotrix
install.packages("plotrix")
library(plotrix)
pie3D(x,labels=pie_percentage,main="Population",explode = 0.2)
legend("topleft",label,cex=1,fill=colour) #cex is a size of label