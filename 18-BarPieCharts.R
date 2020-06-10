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



# or we could use ggplot2
library(ggplot2)
library(dplyr)

class(percentage)
percentage2 = data.frame(percentage)
class(percentage2)
percentage2

ggplot(percentage2, aes(x='', y=Freq, fill=Gender)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0)

ggplot(percentage2, aes(x='', y=Freq, fill=Gender)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0) +
  theme_void()

# Add label position
percentage2 = percentage2 %>% 
  arrange(desc(Gender)) %>%
  mutate(ypos = cumsum(Freq)- 0.5*Freq )

ggplot(percentage2, aes(x='', y=Freq, fill=Gender)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0) +
  theme_void() +
  geom_text(aes(y=ypos,label=round(Freq,1))) +
  ggsave('piechart.png', type='cairo')
