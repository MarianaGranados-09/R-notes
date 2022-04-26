#Adding a third variable, like class, to a two dimensional scatterplot by mapping it to an 
#aesthetic, which is a visual property of the objects in your plot. 
#-size, shape, or color of points

#For example, we can map the colors of your points to the class variable to reveal the class of each car 
ggplot(data=mpg)+geom_point(mapping=aes(x=displ, y=hwy, color=class))
#To map an aesthetic to a variable, associate the name of the aesthetic to the name
#of the variable inside aes(). ggplot2 will assign a unique level of the aesthetic to each unique value
#of the variable, a process known as scaling. 


#mapped class to the color aesthetic, size aesthetic, alpha, or shape
ggplot(data=mpg)+geom_point(mapping=aes(x=displ, y=hwy, alpha=class))

#For each aesthetic, you use aes() to associate the name of the aesthetic with a variable to display
#the x and y locations of a point are themselves aesthetics, visual properties that you can map to display
#information about the data

#You can also set aesthetics properties of your geom manually
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, stroke=class), color = "blue")

#stroke adjusts the thickness of the border for shapes that can take on different colors both inside and outside. 
#It only works for shapes 21-24.
