LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)
View(LungCapData)
names(LungCapData)

mean(Age)   # Shows an error because Age is not defined

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

mean(Age)
class(Age)
class(LungCap)
class(Height)
class(Smoke)
class(Gender)
class(Caesarean)
levels(Smoke)
levels(Gender)
levels(Caesarean)
summary(LungCapData)


x = c(0,1,1,0,1,1,0,0,1,0)
class(x)
summary(x)
x = as.factor(x)
class(x)
summary(x)
