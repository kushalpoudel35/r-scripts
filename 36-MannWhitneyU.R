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
class(Smoke)
levels(Smoke)

?wilcox.test
boxplot(LungCap~Smoke)

# Ho: Median lung capacity of smokers = that of non-smokers
# two sided test

wilcox.test(LungCap~Smoke, mu=0, alt='two.sided', conf.int=T, conf.level=0.95,
            paired=F, exact=T, correct=T)
wilcox.test(LungCap~Smoke, mu=0, alt='two.sided', conf.int=T, conf.level=0.95,
            paired=F, exact=F, correct=T)




