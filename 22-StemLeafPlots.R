LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

femaleLungCap = LungCap[Gender=='female']
?stem
stem(femaleLungCap)
stem(femaleLungCap, scale=2)
