#help on student t distribution
# to calculate p value
?pt

#let's suppose we conduct a t-test with df=25 and obtain t-stat = 2.3
# we want to find one sided p value
# P(t > 2.3)
pt(q=2.3, df=25, lower.tail=F)

# two sided p value:
pt(q=2.3, df=25, lower.tail=F) + pt(q=-2.3, df=25, lower.tail=T)
pt(q=2.3, df=25, lower.tail=F)*2

# to find out the t-stat to compare with our obtained t-stat
?qt

# find t for 95% confidence
# value of t with 2.5% in each tail
# this is basically the t-table in the back of statistics book
qt(p=0.025, df=25, lower.tail=T)

help(pf)
help(pexp)
