installed.packages("tidyverse")
library(tidyverse)
#read data MPG
mpg

#info about data
?mpg
head(mpg)
tail(mpg)

#create ggplot
#scatter plot
ggplot(data = mpg)+geom_point(mapping = aes(x=displ,y=hwy))

#class of the car
ggplot(data = mpg)+geom_point(mapping = aes(x=displ,y=hwy, color=class))
ggplot(data = mpg)+geom_point(mapping = aes(x=displ,y=hwy, size=class))                              
ggplot(data = mpg)+geom_point(mapping = aes(x=displ,y=hwy, alpha=class))
ggplot(data = mpg)+geom_point(mapping = aes(x=displ,y=hwy, shape=class))
ggplot(data = mpg)+geom_point(mapping = aes(x=displ,y=hwy), color="blue")

#plot: cty vs cyl
ggplot(data = mpg)+geom_point(mapping = aes(x=cyl,y=cty))
ggplot(data = mpg)+geom_point(mapping = aes(x=cyl,y=cty, color=class))

#facet
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2)

#geometric objects
ggplot(data=mpg)+geom_smooth(mapping=aes(x=displ,y=hwy))
ggplot(data=mpg)+geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))

#combine
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+geom_smooth(mapping=aes(x=displ,y=hwy))

#add class
ggplot(data=mpg, mapping=aes(x=displ,y=hwy))+geom_point(mapping=aes(color=class))+geom_smooth()

#certain data only
ggplot(data=mpg, mapping=aes(x=displ, y=hwy))+geom_point(mapping=aes(color=class))+geom_smooth(data=filter(mpg,class=="subcompact"),se=FALSE)

#box plot
ggplot(data=mpg)+geom_boxplot(mapping=aes(x=class,y=hwy,color=class))
ggplot(data=mpg)+geom_boxplot(mapping=aes(x=class,y=hwy,color=class))+coord_flip()

#bar plot()
#data diamonds
diamonds
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut))

#for colour
ggplot(data=diamonds)+geom_bar(mapping=aes(x=color))

#stat_count
ggplot(data=diamonds)+stat_count(mapping=aes(x=cut))

#plot cut vs probability
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,y=stat(prop),group=1))

#detail statistical info
ggplot(data=diamonds)+stat_summary(mapping=aes(x=cut,y=depth),fun.min=min,fun.max=max,fun=median)

#change bar colour
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,color=cut))
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=cut))
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity))
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=color))

#stacking
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut, fill=clarity),position='fill')

#position dodge
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut, fill=clarity),position='dodge')

bar <- ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=cut),show.legend=FALSE,width=1)+
  theme(aspect.ratio=1)+labs(x=NULL,y=NULL)

bar+coord_flip()
bar+coord_polar()

#pie chart (own data)
data <- data.frame(group=LETTERS[1:5],value=c(13,7,9,21,2))
data

ggplot(data,aes(x="",y=value,fill=group))+geom_bar(stat="identity",width=1)+coord_polar("y",start=0)



ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut, y=stat(prop),group=1))
