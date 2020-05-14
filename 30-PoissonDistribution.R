?dpois

# The example of Poisson distribution here is that of a firefly
# which lights average 3 times in 10 seconds.

# P(x=4) probability that it will light EXACTLY 4 times in next 10 seconds
dpois(x=4, lambda = 3)

# P(x= 0,1,2,3,4)
dpois(x=0:4, lambda = 3)

# P(x <=4) probability that it will light 4 or less times in next 10 seconds
sum(dpois(x=0:4, lambda = 3))

# another way to do the same thing
ppois(q=4, lambda = 3, lower.tail = T)

# P(x >=4)
ppois(q=4, lambda = 3, lower.tail = F)

?rpois
?qpois
