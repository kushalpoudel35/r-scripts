LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?legend

plot(Age[Smoke=='no'], LungCap[Smoke=='no'],
     main='Lung capacity vs Age for smokers and non-smokers',
     xlab='Age', ylab='Lung capacity', las=1, col='blue')

points(Age[Smoke=='yes'], LungCap[Smoke=='yes'], col='red')

legend(x=3.5, y=14, legend=c('Non-smokers', 'Smokers'), fill=c('blue', 'red'))

plot(Age[Smoke=='no'], LungCap[Smoke=='no'],
     main='Lung capacity vs Age for smokers and non-smokers',
     xlab='Age', ylab='Lung capacity', las=1,
     pch=16, col='blue')

points(Age[Smoke=='yes'], LungCap[Smoke=='yes'], pch=17, col='red')

legend(x=3.5, y=14, legend=c('Non-smokers', 'Smokers'),
       pch=c(16,17), col=c('blue', 'red'), bty='n')


plot(Age[Smoke=='no'], LungCap[Smoke=='no'],
     main='Lung capacity vs Age for smokers and non-smokers',
     xlab='Age', ylab='Lung capacity', las=1,
     pch=16, col='blue')

points(Age[Smoke=='yes'], LungCap[Smoke=='yes'], pch=17, col='red')

lines(smooth.spline(Age[Smoke=='no'], LungCap[Smoke=='no']),
      lty=2, col='blue', lwd=2)
lines(smooth.spline(Age[Smoke=='yes'], LungCap[Smoke=='yes']),
      lty=1, col='red', lwd=2)

legend(x=3.5, y=14, legend=c('Non-smokers', 'Smokers'),
       lty=c(2,1), lwd=2, col=c('blue', 'red'), bty='n')
