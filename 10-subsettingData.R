LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')
head(LungCapData)
names(LungCapData)
attach(LungCapData)
Age[11:14]
LungCapData[11:14, ]
mean(Age[Gender=='female'])
mean(Age[Gender=='male'])
FemData = LungCapData[Gender=='female', ]
MaleData = LungCapData[Gender=='male', ]
dim(FemData)
dim(MaleData)
summary(Gender)
FemData[1:4, ]
MaleOver15 = LungCapData[Gender=='male' & Age>15, ]
MaleOver15[1:5, ]
detach(LungCapData)
