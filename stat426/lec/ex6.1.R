### Example 6.1:  Horseshoe Crab Data (Variable Selection)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

head(horseshoe)


### Initial fit (main effects only)

hsfit <- glm(y ~ weight + width + factor(color) + factor(spine),
             family=binomial, data=horseshoe)

summary(hsfit)

drop1(hsfit, test="Chisq")
  # nothing individually significant, even though overall fit would be


### Check suspected collinearity b/w weight and width

with(horseshoe, cor(weight, width))

with(horseshoe, plot(weight, width))

  # only one of weight and width may be needed --- we choose width


### Forward Selection

nullmod <- glm(y ~ 1, family=binomial, data=horseshoe)

formod <- step(nullmod, ~ width * factor(color) * factor(spine),
               direction="forward")

summary(formod)

drop1(formod, test="Chisq")


### Backward Elimination

fullmod <- glm(y ~ width * factor(color) * factor(spine), family=binomial,
               data=horseshoe)

backmod <- step(fullmod)

summary(backmod)


### Stepwise Selection

stepmod <- step(nullmod, ~ width * factor(color) * factor(spine),
                direction="both")

summary(stepmod)

