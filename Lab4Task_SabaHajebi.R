
install.packages('Rlab')
library(stats)
library(Rlab)

survey <- read.csv(file="survey.csv", header=TRUE)
Sample1 <-rnorm(100,6,4) #simulate some data
Sample2 <- rnorm(80,7,2) 

n1 <- length(Sample1) #size of the sample1
n2 <- length(Sample2) #size of the sample2

x_bar1 <- mean(Sample1) #mean of the sample1
x_bar2 <- mean(Sample2) #mean of the sample2

#this is the sample SD, in this case we know the population SD is 1 since we simulated our data
sd1 <- sd(Sample1)
sd2 <- sd(Sample2)
sd <- sqrt(((n1-1)*sd1*sd1+(n2-1)*sd2*sd2) / (n1+n2-2))

alpha <- 0.05 #Significance level
#calculate the test statistic for a Z-distribution
# the test statistics
test_stat1 <- (x_bar1-x_bar2-1)/(sd * sqrt(1/n1 + 1/n2))
