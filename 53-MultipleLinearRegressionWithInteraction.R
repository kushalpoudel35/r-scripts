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

# fit a regression model using Age, Smoke, and their INTERACTION
model1 = lm(LungCap ~ Age*Smoke)

summary(model1)
coef(model1)

# note that the '*' fits a model with Age, Smoke, and Age-Smoke interaction
# the same model can be fit manually using the ':'
model1 = lm(LungCap ~ Age + Smoke + Age:Smoke)
coef(model1)

summary(model1)

# Regression equation is
# LungCap = 1.052 + 0.558*Age + 0.226*Smoke - 0.06*Age*Smoke

# Plot the data, using different colors for smoke(red)/non-smoke(blue)
# first plot the data for non-smokers in blue
plot(Age[Smoke=='no'], LungCap[Smoke=='no'], col='blue', ylim=c(0,15),
     xlab='Age', ylab='Lung capacity', main='LungCap vs Age,Smoke & interaction')

# now add in the points for smokers in solid red circles
points(Age[Smoke=='yes'], LungCap[Smoke=='yes'], col='red', pch=16)

# and add in a legend
legend(3,15, legend=c('Non-smoker', 'Smoker'), col=c('blue', 'red'),
       pch=c(1,16), bty='n')

# Now add in the regression lines using abline command
# first for the non-smokers in blue
abline(a=1.052, b=0.558, col='blue', lwd=3)
# and now for smokers in red
abline(a=1.278, b=0.498, col='red', lwd=3)


# using ggplot2 (much much easier)
library(ggplot2)

coef(model1)

# Regression equation is
# LungCap = 1.052 + 0.558*Age + 0.226*Smoke - 0.06*Age*Smoke

eqNonSmoker = function(x){coef(model1)[1] + coef(model1)[2]*x}
eqSmoker = function(x){coef(model1)[1] + coef(model1)[2]*x + coef(model1)[3] + coef(model1)[4]*x}

# plot the equations using different colors for smokers and non-smokers
# scales::hue_pal()(how many colors do you want)[the index of color in that palette]
ggplot(LungCapData, aes(x=Age, y=LungCap, color=Smoke)) +
  geom_point() +
  stat_function(fun=eqNonSmoker, geom='line', size=1, color=scales::hue_pal()(2)[1]) +
  stat_function(fun=eqSmoker, geom='line', size=1, color=scales::hue_pal()(2)[2]) +
  labs(title='Lung capacity Vs Age,Smoke & their interaction')


# Now let's ask should we include interaction in our model?
# only if the answer to both the following questions is 'yes'
#1: Does the interaction make sense conceptually?
#2: Is the interaction term statistically significant?

summary(model1)
# answer to first question: smoking does not affect 15 yr-old & 19 yr-old differently
# the interaction does not make sense conceptually
# answer to second question: the p-value of interaction term is 0.377
# the interaction term is not statistically significant
# so our model is more appropriate with no interaction
# and its script can be found in 51-IncludeFactorInRegression.R