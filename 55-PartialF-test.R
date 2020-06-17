LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

# Partial F-test is used to compare two nested models
# i.e. Reduced model should be a subset of Full model

# Example 1:
# Full model:
FullModel1 = lm(LungCap ~ Age + I(Age^2))
# Reduced model:
ReducedModel1 = lm(LungCap ~ Age)

summary(FullModel1)
summary(ReducedModel1)

# carry out the partial F-test
# Ho: Models do not significantly differ
# H1: Full model (with Age^2) is significantly better
anova(ReducedModel1, FullModel1)


# Example 2:
# Full model:
FullModel2 = lm(LungCap ~ Age + Gender + Smoke + Height)
# Reduced model:
ReducedModel2 = lm(LungCap ~ Age + Gender + Smoke)

# Compare the two using partial F-test
# Ho: Models do not significantly differ
# H1: Full model (with Height) is significantly better
anova(ReducedModel2, FullModel2)
