### Example 1.2:  Multinomial Tests (specified probabilities)


### Pearson Chi-Squared Test (example: Sec. 1.5.4)

chisq.test(x=c(6022,2001), p=c(0.75,0.25))


### Likelihood-Ratio Test (example: Sec. 1.5.4)

obs <- c(6022, 2001)
expected <- (6022+2001) * c(0.75, 0.25)
( G.squared <- 2 * sum(obs * log(obs/expected)) )
1-pchisq(G.squared, df=1)


