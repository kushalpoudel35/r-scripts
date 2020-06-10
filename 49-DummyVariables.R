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
CatHeight = cut(Height, breaks=c(0,50,55,60,65,70,100),
                labels=c('A', 'B', 'C', 'D', 'E', 'F'), right=FALSE)
Height[1:10]
CatHeight[1:10]
class(CatHeight)
levels(CatHeight)

# calculate mean LungCap for each category of CatHeight
mean(LungCap[CatHeight=='A'])
mean(LungCap[CatHeight=='B'])
mean(LungCap[CatHeight=='C'])
mean(LungCap[CatHeight=='D'])
mean(LungCap[CatHeight=='E'])
mean(LungCap[CatHeight=='F'])

mod = lm(LungCap ~ CatHeight)
summary(mod)

# here R generated the dummy or indicator variables automatically, keeping
# Category A as the reference variable
# intercept is the mean lungcap for cat A
# for all other categories, mean = intercept + estimate of that category