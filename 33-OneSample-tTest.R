LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

class(LungCap)
help(t.test)
boxplot(LungCap)

#lets conduct a t-test (mu = population mean of LungCap)
# Ho: mu = 8
# H1: mu < 8
# one-sided 95% confidence interval for mu
t.test(LungCap, mu=8, alternative='less', conf.level=0.95)
t.test(LungCap, mu=8, alt='less', conf=0.95)

# two sided
# Ho: mu = 8
# H1: mu != 8
t.test(LungCap, mu=8, alt='two.sided', conf=0.95)
TEST = t.test(LungCap, mu=8, alt='two.sided', conf=0.99)
TEST
attributes(TEST)
TEST$conf.int
TEST$p.value
