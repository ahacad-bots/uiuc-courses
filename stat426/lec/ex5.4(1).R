### Example 5.4:  Horseshoe Crab Data (Mixed Predictors)

horseshoe <- read.table("horseshoe.txt", header=TRUE)

head(horseshoe)

# horseshoe <- transform(horseshoe, color.cat = factor(color))


### Logistic Regression on Color (categorical) and Width

hsfit <- glm(y ~ factor(color) + width, family=binomial, data=horseshoe)

summary(hsfit)

drop1(hsfit, test="Chisq")

  # color not quite significant


### Goodness-of-Fit Test

1 - pchisq(deviance(hsfit), df.residual(hsfit))


### Logistic Regression Curves by Color

plot(y ~ width, data=horseshoe, xlab="Width", ylab="Prob. Satellite", 
     type="n")
curve(predict(hsfit, data.frame(color=2,width=x), type="response"),
      col="brown1", add=TRUE, lwd=2)
curve(predict(hsfit, data.frame(color=3,width=x), type="response"),
      col="brown2", add=TRUE, lwd=2)
curve(predict(hsfit, data.frame(color=4,width=x), type="response"),
      col="brown3", add=TRUE, lwd=2)
curve(predict(hsfit, data.frame(color=5,width=x), type="response"),
      col="brown4", add=TRUE, lwd=2)

  # note: curves have same shape, different shift


### For comparison, use original scores (2,3,4,5) for color

hsfit2 <- glm(y ~ color + width, family=binomial, data=horseshoe)

summary(hsfit2)

drop1(hsfit2, test="Chisq")

  # now color is significant
