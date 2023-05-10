# Bar plot
#callable function

View(mtcars)
library(ggplot2)
#position bar plot
base_plot<-ggplot(mtcars,aes(factor(cyl),fill=factor(am)))
#stacked bar
base_plot+geom_bar()
#dogde barplot
base_plot+geom_bar(position = "dodge")

#fill barplot
base_plot+geom_bar(position = 'fill')

#overlapping bar plots
base_plot+geom_bar(position = position_dodge((width=0.2)))
#far transparency we use aplha
base_plot+ geom_bar(position = position_dodge(width = 0.2), alpha = 0.6)

#for flip
base_plot+geom_bar(position = position_dodge(width = 0.2), alpha = 0.6) +
  coord_flip()
