LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?mean

# Categorical variable

table(Smoke)
length(Smoke)
table(Smoke)/length(Smoke) * 100
table(Smoke, Gender)

# Numeric variable

mean(LungCap)
mean(LungCap, trim=0.10)
median(LungCap)
var(LungCap)
sd(LungCap)
sqrt(var(LungCap))
sd(LungCap)^2
min(LungCap)
max(LungCap)
range(LungCap)
quantile(LungCap, probs=0.90)
quantile(LungCap, probs=c(0.03, 0.5, 0.97, 1))
sum(LungCap)
sum(LungCap)/725
cor(LungCap, Age)
cor(LungCap, Age, method='spearman')
cov(LungCap, Age)
var(LungCap, Age)
summary(LungCap)
summary(Smoke)
summary(LungCapData)
