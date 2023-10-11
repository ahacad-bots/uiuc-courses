### Example 5.1:  Horseshoe Crab Data (Simple Logistic Regression)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

head(horseshoe)

  # y indicates if there are any satellites (0 = no, 1 = yes)


### Simple Logistic Regression on Width

hsfit <- glm(y ~ width, family=binomial, data=horseshoe)

summary(hsfit)


### Plot of Data and Fitted Curve

plot(y ~ width, data=horseshoe, xlab="Width", ylab="Prob. Satellite")

curve(predict(hsfit, data.frame(width=x), type="response"), add=TRUE)


### Likelihood Ratio Test (for beta=0)

drop1(hsfit, test="Chisq")


### Profile Likelihood CIs

confint(hsfit)

exp(confint(hsfit)[2,])  # for odds ratio when increasing width 1cm


### Estimation of "median effective level" (width with prob = 0.5)

coef(hsfit)

-coef(hsfit)[1]/coef(hsfit)[2]


### Estimated logit and probability at width = 26.5

predict(hsfit, data.frame(width=26.5))  # estimated logit

predict(hsfit, data.frame(width=26.5), type="response")  # estimated prob


### Estimated asymptotic covariance matrix (inverse information)

vcov(hsfit)


### Wald 95% CIs for logit and probability at width = 26.5

predict(hsfit, data.frame(width=26.5), se.fit=TRUE)

logit.Wald.CI <- 0.8257928 + c(-1,1) * 1.96 * 0.1886957

logit.Wald.CI  # for logit

exp(logit.Wald.CI) / (1 + exp(logit.Wald.CI))  # for probability


# First 10 fitted values (estimated probs for first 10 obs)

fitted(hsfit)[1:10]
