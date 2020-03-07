LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

?barplot
Table1 = table(Smoke, Gender)
Table1
barplot(Table1)
barplot(Table1, beside=T)
barplot(Table1, beside=T, legend.text=T)
barplot(Table1, beside=T, legend.text=c('Non-smoker', 'Smoker'),
        main='Gender and smoking', xlab='Gender', las=1)

mosaicplot(Table1)
