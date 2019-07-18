ggplot(data=mpg)
install.packages(tidyverse)
install.package("tidyverse")
install.packages("tidyverse")
library(tidyverse)
ggplot(data=mpg)
?mpg
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,colour=class))
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,shape=class))
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,alpha=class))
?mpg

ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_grid(drv~cyl)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_grid(.~cyl)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~cyl)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2,scales="free_x")
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2,shrink = TRUE)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2,shrink = FALSE)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2,shrink = TRUE)

ggplot(data=mpg) + geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))
ggplot(data=mpg) + geom_smooth(mapping=aes(x=displ,y=hwy,group=drv))
ggplot(data=mpg) + geom_smooth(mapping=aes(x=displ,y=hwy,colour=drv,se=FALSE))
ggplot(data=mpg) + geom_smooth(mapping=aes(x=displ,y=hwy,colour=drv,se=FALSE))

ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point()+geom_smooth(se=FALSE)
ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+geom_point()+geom_smooth(mapping=aes(linetype=drv),se=FALSE)

ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut))
?geom_bar
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,y=..prop..,group=1))

ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut,fill=clarity))
