normal4000 <- rnorm(4000, 4, 5) #Create a a vector of length 4000 drawn from a normal distribution with mean 4 and sd 5
exponen4000 <- rexp(4000, 2.1) #Create a a vector of length 4000 drawn from an exponential distribution with lambda = rate = 2.1.

sampleNormal50 <- sample(normal4000, 50) #Take a random sample of size 50 from the normal distribution
sampleNormall00 <- sample(normal4000, 100) #Take a random sample of size 100 from the normal distribution

sampleExponen50 <- sample(exponen4000, 50) #Take a random sample of size 50 from the exponen distribution
sampleExponenl00 <- sample(exponen4000, 100) #Take a random sample of size 100 from the expnonen distribution

zscore <- qnorm(0.975) #Calculate Z-score for 95% CI
tscoreNorm <- qt(0.975, length(sampleNormal50)-1) #Calculate t-value for 95% CI and sampleNormal50
tscoreExp <- qt(0.975, length(sampleExponen50)-1) #Calculate t-value for 95% CI and sampleExponen50

se_kn_norm <- sd(normal4000)/sqrt(length(sampleNormal50)) #Standard error of the 50 population normal sample using the known SD
se_kn_exp <- sd(exponen4000)/sqrt(length(sampleExponen50)) #Standard error of the 50 population exponential sample using the known SD
se_unkn_norm <- sd(sampleNormal50)/sqrt(length(sampleNormal50)) #Standard error of the 50 population normal sample using the sample SD
se_unkn_exp <- sd(sampleExponen50)/sqrt(length(sampleExponen50)) #Standard error of the 50 population exponential sample using the sample SD

left_z_known_norm <- mean(sampleNormal50)-zscore*se_kn_norm #Lower bound of the CL for the normal distribution using the zscore and known SD
right_z_known_norm <- mean(sampleNormal50)+zscore*se_kn_norm #Upper bound of the CL for the normal distribution using the zscore and known SD
left_z_known_exp <- mean(sampleNormal50)-zscore*se_kn_exp #Lower bound of the CL for the exponential distribution using the zscore and known SD
right_z_known_exp <- mean(sampleNormal50)+zscore*se_kn_exp #Upper bound of the CL for the exponential distribution using the zscore and known SD

left_t_unknown_norm <- mean(sampleNormal50)-tscoreNorm * se_kn_norm #Lower bound of the CL for the normal distribution using the tscore and unknown SD
right_t_unknown_norm <- mean(sampleNormal50)+tscoreNorm * se_kn_norm #Upper bound of the CL for the normal distribution using the tscore and unknown SD
left_t_unknown_exp <- mean(sampleNormal50)-tscoreExp * se_kn_exp #Lower bound of the CL for the exponential distribution using the tscore and unknown SD
right_t_unknown_exp <- mean(sampleNormal50)+tscoreExp * se_kn_exp #Upper bound of the CL for the exponential distribution using the tscore and unknown SD



  qqnorm(distribution) #normal qq plot
  qqline(distribution) #line 
  hist(distribution, freq = FALSE, main = title, xlab = title) #histogram of the distribution
  xfit <- seq(min(distribution), max(distribution), length = barwidth) #Setting x for the line
  yfit <- dnorm(xfit, mean = mean(distribution), sd = sd(distribution)) #Setting y for the line
  lines(xfit, yfit) #Draw the line


normalityplot(normal4000, "Normality of Normal 4000", 40) #Create the normality plot of the 4000 Normal(4,5)
normalityplot(exponen4000, "Normality of Exponential 4000", 40) #Create the normality plot of the 4000 Exponential(1)
normalityplot(sampleNormal50, "Normality of Normal 500", 40) #Create the normality plot of the 500 normal sample
normalityplot(sampleNormal100, "Normality of Normal 10", 40) #Create the normality plot of the 10 normal sample
normalityplot(sampleExponen50, "Normality of Exponential 500", 40) #Create the normality plot of the 500 exponential sample
normalityplot(sampleExponen100, "Normality of Exponential 10", 40) #Create the normality plot of the 10 exponential sample

# Would you trust/rely on the confidence intervals you calculated in part 2? Why/Why not?
# I would trust the CI because the sample size is very large.

