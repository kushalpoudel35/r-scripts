LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?text

plot(Age, LungCap, main='Scatterplot of Lung capacity vs Age', las=1)
cor(Age, LungCap)
text(x=5, y=12, label='r = 0.82', cex=1, font=3)
abline(h=mean(LungCap), col='red')
text(x=2.5, y=8.5, adj=0, label='Mean lung cap', cex=0.7, col='red', font=3)

plot(Age, LungCap, main='Scatterplot of Lung capacity vs Age', las=1)
mtext('r = 0.82', side=3, adj=1)
