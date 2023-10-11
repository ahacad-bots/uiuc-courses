### Example 1.1:  Binomial Inference

n <- 25


### Binomial probability models --- for example ...

pi <- c(0.05, 0.1, 0.3, 0.5)

par(mfrow=c(2,2))

for(i in 1:length(pi))
  plot(0:n, dbinom(0:n,n,pi[i]), type="h",
       xlab=bquote(pi == .(pi[i])), ylab="Density")


### Binomial model likelihood

par(mfrow=c(1,1))

y <- 10

curve(dbinom(y,n,x), xlim=c(0,1), xlab=expression(pi),
      main=paste("Likelihood for y =",y))

y <- 0

curve(dbinom(y,n,x), xlim=c(0,1), xlab=expression(pi),
      main=paste("Likelihood for y =",y))


### Wald confidence interval for pi (example: Sec. 1.4.3)

y <- 10

pihat <- y/n

pihat + c(-1,1) * qnorm(1-0.5/2) * sqrt(pihat*(1-pihat)/n)

y <- 0

pihat <- y/n

pihat + c(-1,1) * qnorm(1-0.5/2) * sqrt(pihat*(1-pihat)/n)


### Likelihood-ratio confidence interval for pi (example: Sec. 1.4.3)

LR <- function(pi, y, n, alpha){
  -2*(y * log(pi) + (n-y) * log(1-pi)) - qchisq(1-alpha,df=1)
}

uniroot(LR, interval=c(0.000001,0.999999), n=n, y=y, alpha=0.05)$root

  # UPPER endpoint of CI (lower is 0 in this case: y=0)


### Score confidence interval for pi (example: Sec. 1.4.3)

prop.test(y, n, correct=FALSE)$conf.int

  # ... or with a "continuity correction":

prop.test(y, n)$conf.int


### Clopper-Pearson "exact" confidence interval (Sec. 16.6.1)

binom.test(y, n)$conf.int


  # prop.test and binom.test also can be used for point-null
  # hypothesis tests --- see R help

