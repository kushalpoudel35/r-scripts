df = read.table(file='data/asbestos.csv', header=T, sep=',')
head(df)
summary(df)

names(df)
class(df$Smoke)
class(df$Asbestos)
class(df$LengthOfStay)
levels(df$Smoke)
levels(df$Asbestos)

mean(df$LengthOfStay[df$Smoke=='no'])
mean(df$LengthOfStay[df$Smoke=='yes'])
mean(df$LengthOfStay[df$Asbestos=='no'])
mean(df$LengthOfStay[df$Asbestos=='yes'])

mean(df$LengthOfStay[df$Smoke=='no' & df$Asbestos=='no'])
mean(df$LengthOfStay[df$Smoke=='no' & df$Asbestos=='yes'])
mean(df$LengthOfStay[df$Smoke=='yes' & df$Asbestos=='no'])
mean(df$LengthOfStay[df$Smoke=='yes' & df$Asbestos=='yes'])

# lets boxplot this
library(ggplot2)
ggplot(df, aes(x=Asbestos, y=LengthOfStay, color=Smoke)) +
  geom_boxplot()

# lets fit a regression model using Smoke, asbestos and their interaction
model1 = lm(LengthOfStay ~ Smoke*Asbestos, data=df)
summary(model1)

# The regression equation will be:
# lengthOfStay = 7 + 7.5*Smoke + 8.5*Asbestos + 7*Smoke*Asbestos

# The summary gives us the p-value of 0.000547 for Smoke-asbestos interaction
# which is statistically significant
# and it also makes sense conceptually that smoking modifies the effect of asbestos
# exposure on the length of hospital stay, and vice-versa
# so this model is more appropriate with smoke-asbestos interaction included

# now how to interpret the interaction?

# Given they are not exposed to asbestos
# Mean length of hospital stay will increase by 7.5 days for smoker relative to non-smoker

# Given they are exposed to asbestos
# Mean length of hospital stay will increase by 14.5 days for smoker relative to non-smoker
# i.e. the effect of smoking on the length of hospital stay
# is much larger for those who have been exposed to asbestos than those who have not


# Given they do not smoke
# mean length of hospital stay will increase by 8.5 days for those 
# who are exposed to asbestos relative to those who are not

# Given they smoke
# mean length of hospital stay will increase by 15.5 days for those
# who are exposed to asbestos relative to those who are not
# i.e. the effect of asbestos exposure on the length of hospital stay
# is much larger for smokers than for non-smokers

# Conclusion: There is a strong interaction (synergistic) of smoking and
# asbestos exposure on their effect on the length of hospital stay.
