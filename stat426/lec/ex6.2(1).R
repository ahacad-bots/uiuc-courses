### Example 6.2:  Heart Disease/Blood Pressure Data (Diagnostics)

hdbp <- data.frame(cases = c(3, 17, 12, 16, 12, 8, 16, 8),
                   total = c(156, 252, 284, 271, 139, 85, 99, 43),
                   bloodpressure = factor(c("<117","117-126","127-136",
                                            "137-146","147-156","157-166",
                                            "167-186",">186")))

hdbp


### Intercept-Only (Independence) Model

nullmod <- glm(cbind(cases,total-cases) ~ 1, family=binomial, data=hdbp)

1 - pchisq(deviance(nullmod), df.residual(nullmod))
  # apparent lack of fit

rstandard(nullmod, type="pearson")
  # some large-magnitude standardized residuals --- increasing trend


### Linear Logit Model (using scores)

bpscore <- c(111.5, 121.5, 131.5, 141.5, 151.5, 161.5, 176.5, 191.5)

llmod <- glm(cbind(cases,total-cases) ~ bpscore, family=binomial, data=hdbp)

1 - pchisq(deviance(llmod), df.residual(llmod))
  # apparent adequate fit

rstandard(llmod, type="pearson")
  # one large-magnitude residual, but no trend


### Cook's Distances

cooks.distance(llmod)
  # possible high influence in second observation


### Dfbetas

dfbetas(llmod)
  # possible high influence in second observation on both parameters


# Note: Influence measures used in Agresti differ slightly from these.
