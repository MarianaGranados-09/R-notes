#Facets

#One way to add additional variables is with aesthetics. Another way, particularly useful for categorical variables, 
#is to split your plot into facets, subplots that each display one subset of the data.

#To facet your plot by a single variable, use facet_wrap(), The first argument of facet_wrap() should be a formula, which you create with ~ followed by a variable name (here “formula” is the name of 
#a data structure in R, not a synonym for “equation”). The variable that you pass to facet_wrap() should be discrete.

ggplot(data=mpg)+geom_point(mapping = aes(x=displ, y=hwy))+facet_wrap(~ class, nrow = 2)

#To facet your plot on the combination of two variables, add facet_grid() to 
#your plot call, the first argument of facet_grid() is also a formula. This time, the formula should contain two variable names separated by a ~

ggplot(data=mpg)+geom_point(mapping = aes(x = displ, y=hwy))+facet_grid(drv ~ cyl )
#nrow, ncol defines the number of rows and columns

#Geometric objects

#Each plot uses a different visual object to represent the data, in ggplot2 syntax, we say
#that they use different geoms

#A geom is a geometrical object that a plot uses to represent data. We often describe plots
#by the type of geom that the plot uses. For example, bar charts are bar geoms, line charts use line geoms...

#Scatterplots break the trend, they use the point geom.

#To change the geom in your plot, change the geom function that you add to ggplot()
ggplot(data = mpg)+geom_point(mapping = aes(x=displ, y=hwy))

ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ, y=hwy))

ggplot(data=mpg)+geom_smooth(mapping = aes(x=displ, y=hwy, linetype = drv))
#Here geom_smooth() separates the cars into three lines based on their drv value, which describes a car's drivetrain
#One line describes all of the points with a 4 value, one line describes all of the points with an f value, and one line
#describes all of the points with an r value. Here, 4 stands for four wheel drive, f for front and r for rear

#Many geoms, like geom_smooth use a single geometric object to display multiple rows of data. For these geoms, you can set the group aesthetic to a categorical variable
#to draw multiple objects 

ggplot(data = mpg) +geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +geom_smooth(mapping = aes(x = displ, y = hwy, color = drv), show.legend = FALSE)

#To display multiple geoms in the same plot, add multiple geom functions to ggplot():
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + geom_smooth(mapping = aes(x = displ, y = hwy))

#This, however, introduces some duplication in our code. Imagine if you wanted to change the y-axis to display cty instead of hwy. 
#You’d need to change the variable in two places, and you might forget to update one. You can avoid this type of repetition by passing a set of mappings to ggplot(). 
#ggplot2 will treat these mappings as global mappings that apply to each geom in the graph.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point() + geom_smooth()

#If you place mappings in a geom function, ggplot2 will treat them as local mappings for the layer. It will use these mappings to extend or overwrite the global mappings for that layer only. 
#This makes it possible to display different aesthetics in different layers.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + geom_point(mapping = aes(color = class)) + geom_smooth()

#We can use the same idea to specify different data for each layer
#Here, our smooth line displays just a subset of the mpg dataset, the subcompact cars.
#The local data argument in geom_smooth() overrides the global data argument in ggplot() for that layer only.

ggplot(data = mpg, mapping = aes(x=displ, y=hwy))+geom_point(mapping = aes(color=class))+geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se= FALSE)
