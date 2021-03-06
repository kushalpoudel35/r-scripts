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
levels(Smoke)

?chisq.test
TAB = table(Gender, Smoke)
TAB
barplot(TAB, las=1, beside=T, legend=T)

CHI = chisq.test(TAB, correct=T)
CHI
attributes(CHI)
CHI$expected

fisher.test(TAB, conf.int=T, conf.level=0.99)
