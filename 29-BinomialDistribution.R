help(dbinom)

# The example of binomial distribution here is that of an MCQ test 
# containing 20 questions, each with 5 options out of which only one is correct
# and the the student knows nothing, so he chooses the options randomly

# P(x=3) probability of getting EXACTLY 3 questions right
dbinom(x=3, size=20, prob=1/5)

# P(x=0,1,2,3)
dbinom(x=0:3, size=20, prob=1/5)

# P(x<=3) probability of getting 3 or less questions right
sum(dbinom(x=0:3, size=20, prob=1/5))

# pbinom does the same thing as above, lower.tail means less than or equal to
pbinom(q=3, size=20, prob=1/5, lower.tail = T)

?rbinom
?qbinom
