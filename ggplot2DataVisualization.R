# ggplot2 is an excellent data visualization tool
# and it is very easy and fun too


LungCapData = read.table(file='data/LungCapData.txt', header=TRUE, sep='\t')
head(LungCapData)

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

library(ggplot2)
?ggplot


# Remember that we need dataframe for ggplot2
class(LungCapData)

# scatterplot
?geom_point
ggplot(LungCapData, aes(x=Age, y=LungCap)) +
  geom_point()

# normal plot is aliased which looks bad
ggplot(LungCapData, aes(x=Age, y=LungCap)) +
  geom_point() +
  stat_smooth(method='lm', color='red') +
  labs(title='Normal') +
  ggsave('normal.png')
  
# to antialias the plots, use type='cairo'
ggplot(LungCapData, aes(x=Age, y=LungCap)) +
  geom_point() +
  stat_smooth(method='lm', color='red') +
  labs(title='Cairo') +
  ggsave('cairo.png', type='cairo')


# lets distinguish the points color by Smoking status
ggplot(LungCapData, aes(x=Age, y=LungCap, color=Smoke)) +
  geom_point()

# lets distinguish the points shape by gender
ggplot(LungCapData, aes(x=Age, y=LungCap, shape=Gender)) +
  geom_point()

# lets distinguish the points shape and color by smoking status
ggplot(LungCapData, aes(x=Age, y=LungCap, shape=Smoke, color=Smoke)) +
  geom_point()


count = data.frame(table(Gender))
count
class(count)
# note the column names here
names(count)

# barplot
?geom_bar
ggplot(count, aes(x='', y=Freq, fill=Gender))+
  geom_bar(width=1, stat='identity')
ggplot(count, aes(x=Gender, y=Freq, fill=Gender))+
  geom_bar(width=0.5, stat='identity')
