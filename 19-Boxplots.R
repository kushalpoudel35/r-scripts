LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

help(boxplot)
boxplot(LungCap)
quantile(LungCap, probs=c(0, 0.25, 0.5, 0.75, 1))
boxplot(LungCap, main='Boxplot', ylab='Lung Capacity', ylim=c(0,16), las=1)
boxplot(LungCap ~ Gender)
boxplot(LungCap ~ Gender, main='Boxplot by gender')

