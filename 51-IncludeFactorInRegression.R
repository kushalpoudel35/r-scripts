LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

class(Smoke)
levels(Smoke)

# fit a regression model using Age + Smoke
model1 = lm(LungCap ~ Age + Smoke)
summary(model1)

# note that smoke is the dummy variable with Smoke = 1 for smoker and 0 for non-smoker

# Plot the data, using different colors for smoke(red)/non-smoke(blue)
# first plot the data for non-smokers in blue
plot(Age)