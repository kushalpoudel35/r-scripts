LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

help(barplot)
count = table(Gender)
count
percentage = count/725 * 100
percentage
barplot(count)
barplot(percentage)
barplot(percentage, main='TITLE', xlab='Gender', ylab='%')
barplot(percentage, main='TITLE', xlab='Gender', ylab='%', las=1)
barplot(percentage, main='TITLE', xlab='Gender', ylab='%', las=1,
        names.arg=c('Females', 'Males'))
barplot(percentage, main='TITLE', ylab='Gender', xlab='%', las=1,
        names.arg=c('Females', 'Males'),
        horiz=TRUE, col='brown', border=NA)


pie(count)
pie(count, main='Title here', clockwise=T, col=c('pink', 'blue'))
box()

