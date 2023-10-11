### Example 4.6:  Horseshoe Crab Data (LRTs and Profile Likelihood CIs)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

head(horseshoe)

  # color is actually ordinal (light to dark) --- we treat it as numeric
  # spine is also ordinal and treated as numeric


### Fit full loglinear model:

hsfit <- glm(satell ~ color + spine + width + weight, family=poisson,
             data=horseshoe)

summary(hsfit)


### Consider dropping spine and width (LRT):

hsfit0 <- glm(satell ~ color + weight, family=poisson, data=horseshoe)

summary(hsfit0)

anova(hsfit0, hsfit, test="Chisq")


### Consider dropping each predictor separately (LRTs):

drop1(hsfit, test="Chisq")


### Alternative: Score Tests

anova(hsfit0, hsfit, test="Rao")

drop1(hsfit, test="Rao")


### Profile Likelihood Confidence Intervals (all coefficients)

confint(hsfit)
