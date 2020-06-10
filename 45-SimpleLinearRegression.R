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
plot(Age, LungCap, las=1, main='Scatterplot')
cor(Age, LungCap)

# Regression is used to predict one variable based on another
# regression is based on causality i.e. one variable affects another
# variables cannot be flipped i.e. prediction can be done one way only
help(lm)
mod = lm(LungCap~Age)
summary(mod)
attributes(mod)
mod$coefficients

plot(Age, LungCap, las=1, main='Scatterplot')
abline(mod)
abline(mod, col=2, lwd=3)

coef(mod)
confint(mod)
confint(mod, level=0.99)
summary(mod)
anova(mod)
