#If you need to install ggplot package: 
#install.packages(ggplot2)
library(ggplot2)

setwd("...location of your file...") 
#alt: can use:
#Ages<-read.csv(file.choose())
Ages<-read.csv(file="Ages_by_survey.csv")

ggplot(Ages, aes(x=AGE, fill=Survey))+
  geom_histogram(binwidth=1, alpha=.5, position="identity")