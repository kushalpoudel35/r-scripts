LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

# Barplots
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

# using ggplot2
library(ggplot2)
count2 = data.frame(count)
class(count2)
?geom_bar
ggplot(count2, aes(x='', y=Freq, fill=Gender))+
  geom_bar(width=1, stat='identity')
ggplot(count2, aes(x=Gender, y=Freq, fill=Gender))+
  geom_bar(width=0.5, stat='identity')


# Pie charts
?pie
pie(count)
lbls = paste(names(percentage), '\n', round(percentage,1), '%')
pie(count, main='Pie title', clockwise=T, col=c('#A6DBAE','#E5C19D'), labels=lbls,
    border='white')
box()

# Alternatively for pie and donut charts, we can use ggpubr library
library(ggpubr)
class(percentage)
percentage2 = data.frame(percentage)
class(percentage2)
percentage2

labl = paste(round(percentage2$Freq, 1), '%')

ggpie(percentage2, 'Freq', label='Gender')
ggpie(percentage2, 'Freq', label='Gender', fill='Gender', color='white',
      palette = c('pink', 'blue'))
ggpie(percentage2, 'Freq', label=labl, fill='Gender', color='white',
      palette = c('pink', 'blue'))

# donut chart
ggdonutchart(percentage2, 'Freq', label='Gender')
ggdonutchart(percentage2, 'Freq', label='Gender', fill='Gender', color='white',
      palette = c('pink', 'blue'))
ggdonutchart(percentage2, 'Freq', label=labl, fill='Gender', color='white',
      palette = c('pink', 'blue'))
