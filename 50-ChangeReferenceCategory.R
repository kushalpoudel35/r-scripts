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

help(relevel)

mod1 = lm(LungCap ~ Age + Smoke)
# by default the reference category is non-smokers because 'no' comes first
# in alphabetical order
summary(mod1)

table(Smoke)

# lets change the reference category to smokers
Smoke = relevel(Smoke, ref='yes')

table(Smoke)

mod2 = lm(LungCap ~ Age + Smoke)
summary(mod2)
