### Example 3.1:  Seat Belt Data (Confidence Intervals)

seatbelt <- data.frame(Use=c("No","No","Yes","Yes"),
                       Injury=c("Fatal","Nonfatal","Fatal","Nonfatal"),
                       Freq=c(54,10325,25,51790))

  # children under 18 in auto accidents in Florida in 2008

sb.tab <- xtabs(Freq ~ Use + Injury, data=seatbelt)

sb.tab

addmargins(sb.tab)  # with row/column sums and total


### Odds Ratio 95% CI

( OR.est <- sb.tab[1,1] * sb.tab[2,2] / (sb.tab[1,2] * sb.tab[2,1]) )

logOR.CI <- log(OR.est) + c(-1,1) * qnorm(1-0.05/2) * sqrt(sum(1/sb.tab))

exp(logOR.CI)


### Difference of Proportions 95% CI

n1 <- sb.tab[1,1] + sb.tab[1,2]
n2 <- sb.tab[2,1] + sb.tab[2,2]

pihat1 <- sb.tab[1,1] / n1
pihat2 <- sb.tab[2,1] / n2

pihat1 - pihat2 + c(-1,1) * qnorm(1-0.05/2) * sqrt(pihat1*(1-pihat1)/n1 +
                                                   pihat2*(1-pihat2)/n2)


### Relative Risk 95% CI

( r <- pihat1 / pihat2 )

logr.CI <- log(r) + c(-1,1) * qnorm(1-0.05/2) * sqrt((1-pihat1) / sb.tab[1,1] +
                                                     (1-pihat2) / sb.tab[2,1])

exp(logr.CI)
