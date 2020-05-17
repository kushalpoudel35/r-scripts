LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

class(Age)
class(LungCap)

?cor.test
plot(Age, LungCap, las=1, main='Scatterplot')
cor(Age, LungCap, method='pearson')
cor(Age, LungCap)
cor(LungCap, Age)
cor(Age, LungCap, method='spearman')
cor(Age, LungCap, method='kendall')

cor.test(Age, LungCap, method='pearson')
cor.test(Age, LungCap, method='spearman')
cor.test(Age, LungCap, method='spearman', exact=F)
cor.test(Age, LungCap, method='pearson', alt='greater', conf.level=0.99)

cov(Age, LungCap)

pairs(LungCapData)
pairs(LungCapData[,1:3])

cor(LungCapData)
cor(LungCapData[,1:3])
cor(LungCapData[,1:3], method='spearman')

cov(LungCapData[,1:3])
