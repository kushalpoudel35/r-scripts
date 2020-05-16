DietData = read.table(file='data/DietWeightLoss.txt', header=T, sep='\t')
head(DietData)
dim(DietData)
names(DietData)

WeightLoss = DietData$WeightLoss
Diet = DietData$Diet
class(WeightLoss)
class(Diet)
levels(Diet)

?aov
boxplot(WeightLoss~Diet)

# Ho: Mean weight loss is same for all diets
ANOVA1 = aov(WeightLoss~Diet)
ANOVA1
summary(ANOVA1)
attributes(ANOVA1)
ANOVA1$coefficients

TukeyHSD(ANOVA1)
plot(TukeyHSD(ANOVA1))
plot(TukeyHSD(ANOVA1), las=1)

kruskal.test(WeightLoss~Diet)
