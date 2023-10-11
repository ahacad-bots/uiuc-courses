### Example 4.8:  Horseshoe Crab Data (Poisson Overdispersion)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

hsfit <- glm(satell ~ color + spine + width + weight, family=poisson,
             data=horseshoe)


### Ordinary GLM Analysis

summary(hsfit)


### Deviance-based Goodness of Fit Test

deviance(hsfit)

df.residual(hsfit)

1 - pchisq(deviance(hsfit), df.residual(hsfit))  # P-value


### Standardized residuals should have variance about 1, but ...

var(rstandard(hsfit, type="pearson"))


### Estimate Dispersion Parameter

X2 <- sum(residuals(hsfit, type="pearson")^2)

X2

phihat <- X2 / df.residual(hsfit)

phihat


### Modified (Dispersion-Adjusted) Wald Inference

summary(hsfit, dispersion=phihat)  # same MLEs, different SEs

  # Nothing is significant anymore!  (probably collinearity)


### Modified LRTs

drop1(hsfit, test="F")


### Another possible approach ...

quasihsfit <- glm(satell ~ color + spine + width + weight,
                  family=quasipoisson, data=horseshoe)

summary(quasihsfit)  # essentially same as before
