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
class(Smoke)
levels(Smoke)

help(lm)

# fit a model using Age and Height as X-variables
model1 = lm(LungCap ~ Age + Height)

summary(model1)

# calculate Pearson's correlation betn age and height
cor(Age, Height, method='pearson')

# ask for confidence intervals for the model coefficients
confint(model1, conf.level=0.95)

# fit a model using all X-variables
model2 = lm(LungCap ~ Age + Height + Smoke + Gender + Caesarean)

summary(model2)

# check the regression diagnostic plots for this model
plot(model2)
