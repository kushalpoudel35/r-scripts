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

?cut

# we will create height categories of A= <50, B= 50-55, C= 55-60, 
# D= 60-65, E= 65-70, F= 70+
CatHeight = cut(Height, breaks=c(0,50,55,60,65,70,100),
                labels=c('A', 'B', 'C', 'D', 'E', 'F'))
Height[1:10]
CatHeight[1:10]

# by default the cut generates intervals that are left-open and right-closed (a,b]
# meaning that 'border' observations go into left interval
# but we can change it to be other way around i.e. left-closed and right-open
CatHeight = cut(Height, breaks=c(0,50,55,60,65,70,100),
                labels=c('A', 'B', 'C', 'D', 'E', 'F'), right=FALSE)
# note that the right argument means right-closed

CatHeight = cut(Height, breaks=c(0,50,55,60,65,70,100), right=FALSE)
Height[1:10]
CatHeight[1:10]

# we can also tell R how many categories we want and it will choose the breakpoints for us
CatHeight = cut(Height, breaks=4, right=FALSE)