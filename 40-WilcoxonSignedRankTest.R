BloodPressure = read.table(file='data/BloodPressure.txt', header=T, sep='\t')
dim(BloodPressure)
names(BloodPressure)

Subject = BloodPressure$Subject
Before = BloodPressure$Before
After = BloodPressure$After

?wilcox.test
boxplot(Before, After)

# Ho: Median change in SBP is 0
# two-sided test
wilcox.test(Before, After, mu=0, alt='two.sided', paired=T, conf.int=T, conf.level=0.99)
wilcox.test(Before, After, mu=0, alt='two.sided', paired=T, conf.int=T, conf.level=0.99,
            exact=F, correct=F)
