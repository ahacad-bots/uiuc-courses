### Example 6.3:  Horseshoe Crab Data (Predictive Power)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

  # Note y is binary


### R Measures of Fitted Models

mod1 <- glm(y ~ width, family=binomial, data=horseshoe)

cor(horseshoe$y, fitted(mod1))

mod2 <- glm(y ~ factor(color), family=binomial, data=horseshoe)

cor(horseshoe$y, fitted(mod2))

mod3 <- glm(y ~ width + factor(color), family=binomial, data=horseshoe)

cor(horseshoe$y, fitted(mod3))


### Apparent Classification Table (Model 3)

pi0 <- 0.5

table(y=horseshoe$y, yhat=as.numeric(fitted(mod3) > pi0))

96 / (15 + 96)  # apparent sensitivity

31 / (31 + 31)  # apparent specificity

(31 + 96) / (31 + 31 + 15 + 96)  # apparent prob. correct


### Cross-Validated Classification Table (Model 3)

pihatcv <- numeric(nrow(horseshoe))

for(i in 1:nrow(horseshoe))
  pihatcv[i] <- predict(update(mod3, subset=-i), newdata=horseshoe[i,],
                        type="response")

table(y=horseshoe$y, yhat=as.numeric(pihatcv > pi0))

94 / (94 + 17)  # cross-validated sensitivity

28 / (28 + 34)  # cross-validated specificity

(28 + 94) / (28 + 34 + 17 + 94)  # cross-validated prob. correct


### ROC Curve (Model 3)

n <- nrow(horseshoe)

pihat <- fitted(mod3)

true.pos <- cumsum(horseshoe$y[order(pihat, decreasing=TRUE)])

false.pos <- 1:n - true.pos

plot(false.pos/false.pos[n], true.pos/true.pos[n], type="l",
     main="ROC Curve", xlab="1 - Specificity", ylab="Sensitivity")
abline(a=0, b=1, lty=2, col="blue")


mean(outer(pihat[horseshoe$y==1], pihat[horseshoe$y==0], ">") +
     0.5 * outer(pihat[horseshoe$y==1], pihat[horseshoe$y==0], "=="))
  # area under curve (concordance index)
