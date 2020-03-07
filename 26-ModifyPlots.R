LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?par
plot(Age, Height, main='Scatterplot')
plot(Age, Height, main='Scatterplot', las=1, cex=0.5)
plot(Age, Height, main='Scatterplot', las=1, cex=0.5,
     cex.lab=0.9, cex.axis=0.8, font.lab=2, col='blue', pch=2)
abline(lm(Height~Age), col='red', lty=2, lwd=5)

plot(Age[Gender=='male'], Height[Gender=='male'], main='Height vs Age',
     xlab='Age', ylab='Height', pch=2, col='blue', las=1)
points(Age[Gender=='female'], Height[Gender=='female'], pch=1, col='red')


par(mfrow=c(1,2))
plot(Age[Gender=='male'], Height[Gender=='male'],
     main='Height vs Age for males', xlab='Age', ylab='Height',
     las=1, xlim=c(0,20), ylim=c(45,85))
plot(Age[Gender=='female'], Height[Gender=='female'],
     main='Height vs Age for females', xlab='Age', ylab='Height',
     las=1, xlim=c(0,20), ylim=c(45,85))

par(mfrow=c(1,1))
plot(Age, Height, main='Title', axes=F)
axis(side=1, at=seq(0,20,2), labels=TRUE)
axis(side=2, at=seq(40, 90, 10), labels=T, las=1)
axis(side=4, at=seq(40, 90, 10), labels=T, las=1)
