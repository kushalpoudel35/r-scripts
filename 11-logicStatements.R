LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')
dim(LungCapData)
attach(LungCapData)
Age[1:5]
temp = Age>15
temp[1:5]
temp2 = as.numeric(Age>15)
temp2[1:5]
FemSmoker = Gender=='female' & Smoke=='yes'
FemSmoker[1:5]
MoreData = cbind(LungCapData, FemSmoker)
MoreData[1:5, ]
detach(LungCapData)
