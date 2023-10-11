### Example 4.5:  Snoring & Heart Disease Grouped Data (Goodness of Fit)

snoreheart <- read.table("snoreheart.txt", header=TRUE)

snoreheart


### Checking Deviance

snorefit <- glm(cbind(Disease, NoDisease) ~ Snoring, family=binomial,
                data=snoreheart)

summary(snorefit)

  # "Null deviance" is for the intercept-only model
  # "Residual deviance" is for the full fitted model


### Goodness-of-Fit Test

deviance(snorefit)

df.residual(snorefit)

1 - pchisq(deviance(snorefit), df.residual(snorefit))  # P-value


### What if we use different scores for snoring levels?

newscores <- c(0,2,4,6)

snorefit2 <- glm(cbind(Disease, NoDisease) ~ newscores, family=binomial,
                 data=snoreheart)

deviance(snorefit2)

df.residual(snorefit2)

1 - pchisq(deviance(snorefit2), df.residual(snorefit2))  # P-value
