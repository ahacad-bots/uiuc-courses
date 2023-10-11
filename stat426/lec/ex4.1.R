### Example 4.1:  Psych Data (Logistic Regression)

psych <- read.table("psych.txt", header=TRUE)

head(psych)


### Logistic Regression: Separate X variables for the 5 questions

psychfit1 <- glm(ill ~ x1 + x2 + x3 + x4 + x5, family=binomial, data=psych)

  # canonical logit link used by default

summary(psychfit1)

  # effects have same direction, but none appears significant
  # (possible collinearity?)


### Logistic Regression: One X variable = sum of all question scores

xsum <- apply(psych[,2:6], 1, sum)

psychfit2 <- glm(ill ~ xsum, family=binomial, data=psych)

summary(psychfit2)

  # significant fit


### Plot fitted probabilities versus total score

plot(xsum, fitted(psychfit2), xlab="Total Score",
     ylab="Fitted Probability of Illness")
