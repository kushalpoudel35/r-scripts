LungCapData = read.table(file='data/LungCapData.txt', header=T, sep='\t')

names(LungCapData)

LungCap = LungCapData$LungCap
Age = LungCapData$Age
Height = LungCapData$Height
Smoke = LungCapData$Smoke
Gender = LungCapData$Gender
Caesarean = LungCapData$Caesarean

# Create an AgeGroups variable:
AgeGroups = cut(Age, breaks=c(0,13,15,17,25),
                labels=c('<=13', '14/15', '16/17', '18+'))
levels(AgeGroups)
Age[1:5]
AgeGroups[1:5]

boxplot(LungCap, main='Lung Capacity', ylab='Lung capacity', las=1)

boxplot(LungCap~Smoke, main='Lung Capacity vs Smoke',
        ylab='Lung capacity', las=1)

boxplot(LungCap[Age>=18]~Smoke[Age>=18], main='Lung Capacity vs Smoke for 18+',
        ylab='Lung capacity', las=1)

boxplot(LungCap~Smoke*AgeGroups, main='Lung Capacity vs Smoke by Age group',
        ylab='Lung capacity', las=2, col=c('blue', 'red'))

boxplot(LungCap~Smoke*AgeGroups, main='Lung Capacity vs Smoke by Age group',
        ylab='Lung capacity', xlab='Age strata', axes=F,
        las=2, col=c('blue', 'red'))

box()
axis(2, at=seq(0,20,2), seq(0,20,2), las=1)
axis(1, at=c(1.5,3.5,5.5,7.5), labels=c('<=13', '14-15', '16-17', '18+'))
legend(x=5.5, y=4.5, legend=c('Non-smoke', 'Smoke'), col=c('blue', 'red'),
       pch=15, cex=0.8)


# using ggplot2 (recommended, coz it's easy)
library(ggplot2)

# normal boxplot
ggplot(LungCapData, aes(x=Smoke, y=LungCap)) +
        geom_boxplot()

ggplot(LungCapData, aes(x=Smoke, y=LungCap)) +
        stat_boxplot(geom='errorbar') +
        geom_boxplot()

# stratified boxplot
ggplot(LungCapData, aes(x=AgeGroups, y=LungCap, color=Smoke)) +
        geom_boxplot()

ggplot(LungCapData, aes(x=AgeGroups, y=LungCap, fill=Smoke)) +
        stat_boxplot(geom='errorbar') +
        geom_boxplot()
