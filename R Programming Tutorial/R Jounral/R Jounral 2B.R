View(mtcars)
library(ggplot2)

#histogram
# the aim being finding underlying distribution on the data

light_blue<-'#51a8c9'
b_plot<-ggplot(mtcars,aes(mpg, fill=factor(am)))
b_plot+geom_histogram(binwidth = 1,fill = light_blue)
#change the position of dodge
b_plot+ geom_histogram(position = "dodge")
#change the position of fill
b_plot+geom_histogram(position="fill")
#change the position to identity, with transparency= 0.4
b_plot+geom_histogram(position = "identity", alpha =0.4)
#change the color using scale_fill brewer
b_plot+geom_histogram()+scale_fill_brewer(palette = "Accent")
b_plot+geom_histogram(aes(y = ..density..), alpha = 0.6, binwidth = 0.5) +
  geom_density()
b_plot+geom_histogram(aes(y = ..density..), alpha = 0.6, binwidth = 0.5) +
  geom_density() +
  facet_grid(factor(am) ~ .)
