### Example 4.3:  Horseshoe Crab Data (Simple Loglinear Regression)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

head(horseshoe)


### Plot of Number of Satellites versus Width

plot(satell ~ width, data=horseshoe, xlab="Width",
     ylab="Number of Satellites")


### Loglinear Regression on Width

hsfit <- glm(satell ~ width, family=poisson, data=horseshoe)

summary(hsfit)

