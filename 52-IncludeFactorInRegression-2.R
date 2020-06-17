LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

class(Height)
# create a categorical representation of height
CatHeight = cut(Height, breaks=c(0,50,55,60,65,70,100),
                labels=c('A','B','C','D','E','F'))
class(CatHeight)
levels(CatHeight)

# fit a regression model using Age + CatHeight assuming no interaction
model2 = lm(LungCap ~ Age + CatHeight)

summary(model2)

# plot the data using different colors for different height categories
# first plot the data for CatHeight 'A' in red(=2)
plot(Age[CatHeight=='A'], LungCap[CatHeight=='A'], col=2, ylim=c(0,15), xlim=c(0,20),
     xlab='Age', ylab='LungCap', main='LungCap Vs Age,CatHeight')

# now add in the points for CatHeight 'B' in green(=3)
points(Age[CatHeight=='B'], LungCap[CatHeight=='B'], col=3)

# now add in the points for CatHeight 'C' in blue(=4)
points(Age[CatHeight=='C'], LungCap[CatHeight=='C'], col=4)

# now add in the points for CatHeight 'D' in light blue(=5)
points(Age[CatHeight=='D'], LungCap[CatHeight=='D'], col=5)

# now add in the points for CatHeight 'E' in purple(=6)
points(Age[CatHeight=='E'], LungCap[CatHeight=='E'], col=6)

# now add in the points for CatHeight 'F' in yellow(=7)
points(Age[CatHeight=='F'], LungCap[CatHeight=='F'], col=7)

# And add in a legend
legend(0,15.5, legend=c('A','B','C','D','E','F'), col=2:7, pch=1, cex=0.8)

# now lets add in the regression lines using abline command
# first for CatHeight 'A' using color 2
abline(a=0.98, b=0.20, col=2, lwd=2)

# then for CatHeight 'B' using color 3
abline(a=2.46, b=0.20, col=3, lwd=2)

# then for CatHeight 'C' using color 4
abline(a=3.67, b=0.20, col=4, lwd=2)

# then for CatHeight 'D' using color 5
abline(a=4.92, b=0.20, col=5, lwd=2)

# then for CatHeight 'E' using color 6
abline(a=5.99, b=0.20, col=6, lwd=2)

# then for CatHeight 'F' using color 7
abline(a=7.52, b=0.20, col=7, lwd=2)


# using ggplot2 (easier)
library(ggplot2)

summary(model2)
attributes(model2)
coef(model2)

# set the regression equations for different height categories
eqA = function(x){coef(model2)[1] + coef(model2)[2]*x}
eqB = function(x){coef(model2)[1] + coef(model2)[2]*x + coef(model2)[3]}
eqC = function(x){coef(model2)[1] + coef(model2)[2]*x + coef(model2)[4]}
eqD = function(x){coef(model2)[1] + coef(model2)[2]*x + coef(model2)[5]}
eqE = function(x){coef(model2)[1] + coef(model2)[2]*x + coef(model2)[6]}
eqF = function(x){coef(model2)[1] + coef(model2)[2]*x + coef(model2)[7]}


# plot the equations using different colors for different height categories
# scales::hue_pal()(how many colors do you want)[the index of color in that palette]
ggplot(LungCapData, aes(x=Age, y=LungCap, color=CatHeight)) +
  geom_point() +
  stat_function(fun=eqA, geom='line', size=1, color=scales::hue_pal()(6)[1]) +
  stat_function(fun=eqB, geom='line', size=1, color=scales::hue_pal()(6)[2]) +
  stat_function(fun=eqC, geom='line', size=1, color=scales::hue_pal()(6)[3]) +
  stat_function(fun=eqD, geom='line', size=1, color=scales::hue_pal()(6)[4]) +
  stat_function(fun=eqE, geom='line', size=1, color=scales::hue_pal()(6)[5]) +
  stat_function(fun=eqF, geom='line', size=1, color=scales::hue_pal()(6)[6]) +
  labs(title='Lung Capacity Vs Age,CatHeight') +
  ggsave('MultipleLinearRegression.png', type='cairo')
