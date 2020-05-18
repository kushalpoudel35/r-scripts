# ggplot2 is very very hard
# making a simple pie chart requires lots of goddamned steps
# so use ggplot2 for everything but piechart
# for piechart and donut charts, use ggpubr library -> ggpie, ggdonutchart

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

# lets distinguish the points color by Smoking status
ggplot(LungCapData, aes(x=Age, y=LungCap, col=Smoke)) +
  geom_point()

# lets distinguish the points shape by gender
ggplot(LungCapData, aes(x=Age, y=LungCap, shape=Gender)) +
  geom_point()

# lets distinguish the points shape and color by smoking status
ggplot(LungCapData, aes(x=Age, y=LungCap, shape=Smoke, col=Smoke)) +
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
