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

# fit a regression model using Age + Smoke assuming no interaction
model1 = lm(LungCap ~ Age + Smoke)
summary(model1)

# note that smoke is the dummy variable with Smoke = 1 for smoker and 0 for non-smoker
# from the summary we can get regression equation for smokers and non-smokers
# for non-smoker: LungCap = 1.086 + 0.55*Age
# for smoker: LungCap = 1.086 + 0.55*Age - 0.648 = 0.438 + 0.55*Age

# Plot the data, using different colors for smoke(red)/non-smoke(blue)
# first plot the data for non-smokers in blue
plot(Age[Smoke=='no'], LungCap[Smoke=='no'], col='blue', ylim=c(0,15),
     xlab='Age', ylab='Lung capacity', main='LungCap vs Age,Smoke')

# now add in the points for smokers in solid red circles
points(Age[Smoke=='yes'], LungCap[Smoke=='yes'], col='red', pch=16)

# and add in a legend
legend(3,15, legend=c('Non-smoker', 'Smoker'), col=c('blue', 'red'),
       pch=c(1,16), bty='n')

# Now add in the regression lines using abline command
# first for the non-smokers in blue
abline(a=1.08, b=0.555, col='blue', lwd=3)
# and now for smokers in red
abline(a=0.431, b=0.555, col='red', lwd=3)


# using ggplot2 (easier)
library(ggplot2)

# set the regression equations for smokers and non-smokers
attributes(model1)
coef(model1)
coef(model1)[2]

# regression equation is
# LungCap = 1.086 + 0.55*Age - 0.648*Smoke
eqNonSmoker = function(x){coef(model1)[1] + coef(model1)[2]*x}
eqSmoker = function(x){coef(model1)[1] + coef(model1)[2]*x + coef(model1)[3]}


# plot the equations using different colors for smokers and non-smokers
# scales::hue_pal()(how many colors do you want)[the index of color in that palette]
ggplot(LungCapData, aes(x=Age, y=LungCap, color=Smoke)) +
  geom_point() +
  stat_function(fun=eqNonSmoker, geom='line', size=1, color=scales::hue_pal()(2)[1]) +
  stat_function(fun=eqSmoker, geom='line', size=1, color=scales::hue_pal()(2)[2]) +
  labs(title='Lung capacity Vs Age,Smoke')

