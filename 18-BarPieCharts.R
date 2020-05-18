LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

help(barplot)
?pie

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
lbls = paste(names(percentage), '\n', round(percentage,1), '%')
pie(count, main='Pie title', clockwise=T, col=c('#A6DBAE','#E5C19D'), labels=lbls,
    border='white')
box()

# Alternatively for pie and donut charts, we can use ggpubr library
library(ggpubr)
class(percentage)
percentage = data.frame(percentage)
class(percentage)
percentage

labl = paste(round(percentage$Freq, 1), '%')

ggpie(percentage, 'Freq', label='Gender')
ggpie(percentage, 'Freq', label='Gender', fill='Gender', color='white',
      palette = c('pink', 'blue'))
ggpie(percentage, 'Freq', label=labl, fill='Gender', color='white',
      palette = c('pink', 'blue'))

# donut chart
ggdonutchart(percentage, 'Freq', label='Gender')
ggdonutchart(percentage, 'Freq', label='Gender', fill='Gender', color='white',
      palette = c('pink', 'blue'))
ggdonutchart(percentage, 'Freq', label=labl, fill='Gender', color='white',
      palette = c('pink', 'blue'))
