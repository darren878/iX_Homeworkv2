ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,stroke=cty))
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy),shape=21, colour="black",fill="white",size=2,stroke=1)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,colour=displ<5))
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_wrap(~class,nrow=2)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_grid(drv~cyl)
ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy))+facet_grid(.~cyl)
?facet_wrap
ggplot(data=mpg)+geom_line(mapping=aes(x=displ,y=hwy)+geom_point(mapping=aes(x=displ,y=hwy))
                           