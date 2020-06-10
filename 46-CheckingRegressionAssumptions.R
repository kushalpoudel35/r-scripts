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

# diagnostic tools to check regression assumption are a series of plots
# note that plot(mod) does not plot the model itself
# but plots some diagnostic plots that help to verify the assumptions
plot(mod)

# there are four plots returned
# 1st one is k/a the residual plot
# if the linearity assumption is met we should see no pattern here
# the red line should be fairly flat and the points should be as clouds evenly

# 2nd one is k/a quantile-quantile plot
# checks if the errors/residuals are normally distributed

# 3rd and 4th plots help identify non-linearity, non-constant variance, and others

# if we would like all 4 plots in one single screen
par(mfrow=c(2,2))
plot(mod)

# change back to one plot at a time
par(mfrow=c(1,1))
plot(mod)