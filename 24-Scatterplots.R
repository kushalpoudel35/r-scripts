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

# using ggplot2 (recommended, coz it's easier)
library(ggplot2)
?ggplot


# Remember that we need dataframe for ggplot2
class(LungCapData)

# scatterplot
?geom_point
ggplot(LungCapData, aes(x=Age, y=LungCap)) +
  geom_point()

# normal plot is aliased which looks bad
ggplot(LungCapData, aes(x=Age, y=LungCap)) +
  geom_point() +
  stat_smooth(method='lm', color='red') +
  labs(title='Normal') +
  ggsave('normal.png')

# to antialias the plots, use type='cairo'
ggplot(LungCapData, aes(x=Age, y=LungCap)) +
  geom_point() +
  stat_smooth(method='lm', color='red') +
  labs(title='Cairo') +
  ggsave('cairo.png', type='cairo')


# lets distinguish the points color by Smoking status
ggplot(LungCapData, aes(x=Age, y=LungCap, color=Smoke)) +
  geom_point()

# lets distinguish the points shape by gender
ggplot(LungCapData, aes(x=Age, y=LungCap, shape=Gender)) +
  geom_point()

# lets distinguish the points color by Smoking status & shape by gender
ggplot(LungCapData, aes(x=Age, y=LungCap, color=Smoke, shape=Gender)) +
  geom_point()

