### Example 4.4:  British Train Collisions (Loglinear Rate Model)

tc <- read.table("traincollisions.txt", header=TRUE)

head(tc)


### Rate Model for Train/Road Vehicle Collisions

tcfit <- glm(TrRd ~ I(Year-1975), offset = log(KM), family=poisson, data=tc)

summary(tcfit)


### Plot empirical and fitted rates

plot(1000*TrRd/KM ~ Year, data=tc,
     ylab="Collisions per Billion Train-Kilometers")

curve(1000*predict(tcfit, data.frame(Year=x,KM=1), type="response"), add=TRUE)
