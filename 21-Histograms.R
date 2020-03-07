LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?hist
hist(LungCap)
hist(LungCap, freq=FALSE)
hist(LungCap, prob=T, ylim=c(0,0.2))
hist(LungCap, prob=T, ylim=c(0,0.2), breaks=7)
hist(LungCap, prob=T, ylim=c(0,0.2), breaks=14)
hist(LungCap, prob=T, ylim=c(0,0.2), breaks=seq(0,16,2))
hist(LungCap, prob=T, ylim=c(0,0.2), breaks=seq(0,16,2),
     xlab='Lung capacity', main='Histogram of lung capacity', las=1)
lines(density(LungCap), col='red', lwd=3)
