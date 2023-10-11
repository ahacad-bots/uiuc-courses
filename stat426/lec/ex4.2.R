### Example 4.2:  Snoring & Heart Disease Grouped Data (Logistic Regression)

snoreheart <- read.table("snoreheart.txt", header=TRUE)

snoreheart


### Logistic Regression: Binomial Response

snorefit <- glm(cbind(Disease, NoDisease) ~ Snoring, family=binomial,
                data=snoreheart)

summary(snorefit)


### Plot empirical probabilities of Disease, with model curve:

with(snoreheart, plot(Snoring, Disease/(Disease+NoDisease),
                      xlab="Snoring Level", ylab="Prob. Heart Disease"))

curve(predict(snorefit, data.frame(Snoring=x), type="response"), add=TRUE)
