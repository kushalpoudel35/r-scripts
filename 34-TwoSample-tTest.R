LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

help(t.test)
boxplot(LungCap ~ Smoke)

# lets conduct a two-sided test
# Ho: mean lung cap of smokers = that of nonsmokers
# H1: mean lung cap of smokers != that of nonsmokers
# assume non-equal variances
t.test(LungCap~Smoke, mu=0, alt='two.sided', conf=0.95, var.eq=F, paired=F)

# all the other arguments values are default as above
t.test(LungCap~Smoke)

# with equal variance
t.test(LungCap~Smoke, mu=0, alt='two.sided', conf=0.95, var.eq=T, paired=F)

# how to know whether to set variance equal or not
var(LungCap[Smoke=='yes'])
var(LungCap[Smoke=='no'])

# Levene's test
# Ho: population variances are equal
library(car)
leveneTest(LungCap~Smoke)
