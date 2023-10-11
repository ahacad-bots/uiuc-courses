### Example 5.2:  Alcohol & Infant Malformation (Categorical Predictor)

malform <- data.frame(Present=c(48, 38, 5, 1, 1),
                      Absent=c(17066, 14464, 788, 126, 37),
                      Drinks=factor(c("0", "<1", "1-2", "3-5", ">=6")))

malform


### Logistic fit with predictor as nominal variable

mffit <- glm(cbind(Present,Absent) ~ Drinks, family=binomial, data=malform)

summary(mffit)

model.matrix(mffit)  # X matrix

predict(mffit)  # empirical logits

fitted(mffit)  # MLEs of probabilities


### Tests for relationship (perhaps questionable)

drop1(mffit, test="Chisq")  # LRT (same as G^2 test)


drop1(mffit, test="Rao")  # Pearson test

chisq.test(cbind(malform$Present, malform$Absent), correct=FALSE)
                                        # for comparison


### Logistic fit with predictor as ordinal scores

drink.score <- c(0, 0.5, 1.5, 4, 7)

mffit2 <- glm(cbind(Present,Absent) ~ drink.score, family=binomial,
              data=malform)

summary(mffit2)


drop1(mffit2, test="Chisq")  # LRT


1 - pchisq(deviance(mffit2), df.residual(mffit2))  # goodness-of-fit test
