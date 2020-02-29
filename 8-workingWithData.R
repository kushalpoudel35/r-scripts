LungCapData = read.csv(file='data/LungCapData.csv', header=TRUE)
View(LungCapData)
dim(LungCapData)
head(LungCapData)
tail(LungCapData)
LungCapData[c(5,6,7,8,9), ]
LungCapData[5:9, ]
LungCapData[-(5:720), ]
names(LungCapData)
