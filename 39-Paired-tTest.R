BloodPressure = read.table(file='data/BloodPressure.txt', header=T, sep='\t')
dim(BloodPressure)
names(BloodPressure)

Subject = BloodPressure$Subject
Before = BloodPressure$Before
After = BloodPressure$After

?t.test
boxplot(Before, After)
plot(Before, After)
abline(a=0, b=1)

# Paired t-test
# Ho: Mean difference in SBP is 0
# two-sided test
t.test(Before, After, mu=0, alt='two.sided', paired=T, conf.level=0.99)
t.test(After, Before, mu=0, alt='two.sided', paired=T, conf.level=0.99)
