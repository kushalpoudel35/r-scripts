LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

class(Gender)
class(Smoke)
levels(Gender)
levels(Smoke)

TAB = table(Gender, Smoke)
TAB
barplot(TAB, las=1, beside=T, legend=T)

library(epiR)
help(package='epiR')

epi.2by2(TAB, method='cohort.count', conf.level=0.95)

TAB
TAB2 = matrix(c(44,314,33,334), nrow=2, byrow=T)
TAB2
TAB3 = cbind(TAB[,2], TAB[,1])
TAB3
colnames(TAB3) = c('yes', 'no')
TAB3

epi.2by2(TAB3, method='cohort.count')
