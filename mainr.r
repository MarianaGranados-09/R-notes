mpg
#mpg variables
#1. displ, a car's engine size, in litres
#2. hwy, a car's fuel efficiency on the highway, in miles per gallon
#Creating a ggplot
#To plot mpg, run this code to put displ on the x-axis
#and hwy on the y-axis

ggplot(data = mpg) + geom_point(mapping = aes(x = cyl, y = hwy, color=class))

#The plot shows a negative relationship between engine size (displ)
#and fuel efficiency (hwy). 

#In other words, cars with big engines use more fuel.
#with ggplot2, you begin to plot with the function ggplot()
#ggplot() creates a coordinate system that you can add layers to

#The first argument of ggplot() is the dataset to use in the graph, so ggplot(data = mpg)
#creates an empty graph

#You complete your graph by adding one or more layers to ggplot, the function geom_point()
#adds a layer of points to your plot, creating a scatterplot

#Each geom function in ggplot2 takes a mapping argument, this defines how variables
#in your datasheet are mapped to visual properties

#The mapping argument is always pared with aes(), and the x and y arguments of aes() specify
#which variables to map to the x and y axes. In this case, x plots displ and y hwy.

#A graphing template
#Let’s turn this code into a reusable template for making graphs with ggplot2. 
#To make a graph, replace the bracketed sections in the code below with a dataset, a geom function, or a collection of mappings.
