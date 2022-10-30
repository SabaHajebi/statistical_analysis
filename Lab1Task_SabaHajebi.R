Lab1 <- read.csv(file="~/R Working Directory 2022/Lab1.csv", header=TRUE)

Lab1_false <- read.csv(file="Lab1.csv", header=FALSE)

#see summary statistics for the variable EARN 
summary(Lab1$EARN)

#see frequencies statistics for the variable Job.class 
table(Lab1$Job.class) 

#see a three-way cross-tabulation of the proportions of variables Educ, Gender and Job.Class 
ftable(Lab1$EDUC, Lab1$Gender, Lab1$Job.class) 

#see histogram for the variable EARN 
hist(Lab1$EARN) 

#see boxplot of the variable EARN by EDUC
boxplot(Lab1$EARN~Lab1$EDUC) 

#see new variable AGE_500 that is equal to Age divided by 500
AGE_500 = Lab1$AGE/500 

#see a scatterplot with AGE_500 on the x axis and EARN on the Y axis
plot(AGE_500, Lab1$EARN)