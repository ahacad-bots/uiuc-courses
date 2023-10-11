### Example 3.2:  Belief Data (Independence Tests)

belief <- read.table("degreebelief.txt")

belief

belief$Degree <- factor(belief$Degree, levels=levels(belief$Degree)[c(3,2,1)])

btable <- xtabs(Freq ~ Degree + Belief, data=belief)

btable


### Estimated Expectations under Independence

muhat <- outer(margin.table(btable,1), margin.table(btable,2)) / sum(btable)

muhat


### Pearson X^2 Independence Test

X2.test <- chisq.test(btable, correct=FALSE)

X2.test


### G^2 (Likelihood Ratio) Independence Test

G.sq <- 2 * sum(btable * log(btable / muhat))

G.sq

1 - pchisq(G.sq, df=(nrow(btable)-1)*(ncol(btable)-1))


### Residuals Analysis

round(X2.test$residuals, 2)  # Pearson residuals (rounded)

round(X2.test$stdres, 2)  # standardized residuals (rounded)
