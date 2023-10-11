### Example 5.3:  Death Penalty and Race (Categorical Predictors)

deathpenalty <- read.table("deathpenalty.txt")

deathpenalty

dp <- reshape(deathpenalty, v.names="Freq", timevar="DeathPenalty",
              idvar=c("Defendant","Victim"), direction="wide")

dp


### Fit Saturated Model

sat.mod <- glm(cbind(Freq.Yes,Freq.No) ~ Defendant*Victim, family=binomial,
               data=dp)

summary(sat.mod)
  # note deviance


### Fit Additive Model, Test Homogeneous Association

add.mod <- glm(cbind(Freq.Yes,Freq.No) ~ Defendant + Victim, family=binomial,
               data=dp)

summary(add.mod)

anova(add.mod, sat.mod, test="Chisq")


### Test Main Effects

drop1(add.mod, test="Chisq")


### Another Test for (Conditional) Defendant Race Effect

vic.mod <- glm(cbind(Freq.Yes,Freq.No) ~ Victim, family=binomial, data=dp)

anova(vic.mod, sat.mod, test="Chisq")
