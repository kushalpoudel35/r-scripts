LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')
View(LungCapData)
dim(LungCapData)
head(LungCapData)
tail(LungCapData)
LungCapData[c(5,6,7,8,9), ]
LungCapData[5:9, ]
LungCapData[-(5:720), ]
names(LungCapData)
