data = read.table(file='data/BadData.txt', header=T, sep='\t')
head(data)
names(data)


class(data$Gender)
levels(data$Gender)

library(car)
?recode

levels(data$Gender)
data$Gender = recode(data$Gender, "c('f','F','fem','Female') = 'Female';
                c('m','M','mal','male','Male' ) = 'Male'")
levels(data$Gender)
summary(data)
summary(data$Gender)
class(data$Gender)
