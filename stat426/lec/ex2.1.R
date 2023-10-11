### Example 2.1:  Death Penalty Data (Conditional Association)

deathpenalty <- read.table("deathpenalty.txt")

deathpenalty

deathpenalty <- transform(deathpenalty,
                          DeathPenalty = relevel(DeathPenalty, "Yes"),
                          Defendant = relevel(Defendant, "White"),
                          Victim = relevel(Victim, "White"))
  # define the "first" level of each variable


### Show Partial Tables

dp <- xtabs(Freq ~ Victim + Defendant + DeathPenalty, data=deathpenalty)

dp

dpflat <- ftable(DeathPenalty ~ Victim + Defendant, data=dp)

dpflat


### Estimated Proportions

prop.table(dpflat)


### Estimated Conditional Odds Ratios (conditional on victim race)

53*37/(11*414)  # white victim

0*139/(4*16)  # black victim


### Show Marginal Table

xtabs(Freq ~ Defendant + DeathPenalty, data=deathpenalty)


### Estimated Marginal Odds Ratio (unconditional)

53*176/(15*430)

  # Shows Simpson's Paradox:  white defendants are marginally more likely
  # to get the death penalty (theta > 1), but less likely after conditioning
  # on victims race (theta(k) < 1)
