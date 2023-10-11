### Example 4.7:  Horseshoe Crab Data (Residuals)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

hsfit <- glm(satell ~ color + spine + width + weight, family=poisson,
             data=horseshoe)

### Raw Residuals

plot(residuals(hsfit, type="response"))


### Pearson Residuals

plot(residuals(hsfit, type="pearson"))

X.2 <- sum(residuals(hsfit, type="pearson")^2)

X.2  # generalized Pearson chi-squared statistic

deviance(hsfit)  # for comparison


### Deviance Residuals

plot(residuals(hsfit))

sum(residuals(hsfit)^2)  # equals deviance


### Standardized Residuals

plot(hatvalues(hsfit), type="h")  # leverages

plot(rstandard(hsfit, type="pearson"))  # standardized residuals
