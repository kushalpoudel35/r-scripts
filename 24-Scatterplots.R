LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?plot
cor(Age, Height)
plot(Age, Height)
plot(Age, Height, main='Scatterplot', las=1)
plot(Age, Height, main='Scatterplot', las=1, xlim=c(0,25), cex=0.5, col='blue')
abline(lm(Height~Age), col='red')
lines(smooth.spline(Age, Height))
lines(smooth.spline(Age, Height), lty=2, lwd=5)
