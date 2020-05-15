?pnorm

# Normal distribution is most common in real life, in nature
# P(x <= 70):
pnorm(q=70, mean=75, sd=5, lower.tail=T)
pnorm(q=70, mean=75, sd=5)

# P(x >= 85)
pnorm(q=85, mean=75, sd=5, lower.tail=F)

# Area under the curve above z =1 is given by P(z >=1)
pnorm(q=1, mean=0, sd=1, lower.tail=F)

#find Q1
qnorm(p=0.25, mean=75, sd=5, lower.tail=T)

#Probability density
x = seq(from=55, to=95, by=0.25)
dens = dnorm(x, mean=75, sd=5)
plot(x, dens)
plot(x, dens, type='l')
plot(x, dens, type='l', main='X-normal: Mean=75, SD=5', xlab='x',
     ylab='Probability density', las=1)
abline(v=75)

# Random sampling
rand = rnorm(n=40, mean=75, sd=5)
rand
hist(rand)
