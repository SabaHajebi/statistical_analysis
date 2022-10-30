#Inspecting the data
head(pressure)  # accessing data
cor(pressure$temperature, pressure$pressure)  # check the correlation between the variables
plot(pressure$temperature, pressure$pressure)  # visualise a scatterplot of the dataset 

scatter.smooth(x=pressure$temperature, pressure$pressure, main="temp ~ pressure")  # scatterplot

#A box plot can help us check for outliers
par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(pressure$temperature, main="temp") # box plot for 'temp'
boxplot.stats(pressure$temperature)$out # display outliers
boxplot(pressure$pressure, main="pressure")  # box plot for 'pressure'
boxplot.stats(pressure$pressure)$out # display outliers

#We can also look at the density of the variables. 
plot(density(pressure$temperature), main="Density Plot: temp")  # density plot for 'temp'
plot(density(pressure$pressure), main="Density Plot: pressure") # density plot for 'pressure'
par(mfrow=c(1, 1))  # back to 1 plot

#Fitting the Model
pressure.lm <- lm(temperature ~ pressure, data=pressure)  # build linear regression model on full data
print(pressure.lm)

#And now we can inspect the results
summary(pressure.lm)

#Next, we can visualise our regression line on a scatterplot of our data.
plot(pressure$temperature, pressure$pressure)

#Inspecting Residuals
abline(pressure.lm)

#We can plot the residuals against the observed values
pressure.res <- resid(pressure.lm)
plot(pressure$temperature, pressure.res, ylab="Residuals", xlab="temp", 
     main="pressure Linear Model") 
abline(0, 0)                  # the horizon

#We can inspect the residuals density
plot(density(pressure.res), main="Density Plot: residuals") 


plot(pressure.lm) # each plot individually
par(mfrow=c(2,2)) # 2x2 grid of plots
plot(pressure.lm)
par(mfrow=c(1, 1))  # back to 1 plot



#Write an equation that describes the linear model you have fitted

# temp  = 132.79072  + 19.94314 * pressure

#Comment on what you saw from the previous parts. Is the model appropriate?
# I feel the model is appropriate.
# Because it satisfies the assumptions set for regression model
# p-value < 03e-06 , p-value < significance, therefore it is significant
# So rejecting the null hypothesis, and accepting the alternative hypothesis
# So there is a statistically significant relationship between temp and pressure

#Why are the p-values for the variable pressure and the overall F test so similar for this model?
# Because the t test and the F test are testing the same hypothesis.
