LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

cor(Age, LungCap)
plot(Age, LungCap)
mod = lm(LungCap ~ Age)
summary(mod)
abline(mod)
plot(mod)
par(mfrow=c(2,2))
plot(mod)
par(mfrow=c(1,1))
plot(x,y)
