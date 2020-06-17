LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)
View(LungCapData)
names(LungCapData)

mean(Age)   # Shows an error because Age is not defined

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

# Instead of redefining these variables manually, we could also load the variables
# of the dataset directly into R's memory by attaching the data
# attach(LungCapData)
# detach(LungCapData)
# but I prefer not to attach,
# because it can result in conflict when manipulating variables
# actually we cannot manipulate the variables already loaded into the memory
# so even though we think that we modified the variable
# we will still be getting the wrong results
# so attaching the data is a bad practice
# The BEST practice is neither to attach the data to memory nor to redefine variables
# but to import the data with a short name, like 'data' or simply 'd'
# and use variables with $ sign: like data$Age, or d$Gender
# this way we can easily manipulate the variables when we need to
# and get the correct results.

mean(Age)
class(Age)
class(LungCap)
class(Height)
class(Smoke)
class(Gender)
class(Caesarean)
levels(Smoke)
levels(Gender)
levels(Caesarean)
summary(LungCapData)


x = c(0,1,1,0,1,1,0,0,1,0)
class(x)
summary(x)
x = as.factor(x)
class(x)
summary(x)
