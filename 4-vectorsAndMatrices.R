# Vectors:
x = c(1,3,5,7,9)
x
y = seq(from=2, to=10, by=2)
y
z = c('Kushal', 'Poudel', 'Gulmi', 'IOM')
z
rep('Kushal', times=5)

x+10

a = c(2,4,6,8,10)
# if two vectors are of same length, we can add/subtract/mult/div 
# corresponding elements
x + a
x[3]
a[-3]
a[1:3]
a[c(1,5)]
a[a<6]

matrix(c(1:9), nrow=3, byrow=TRUE)
mat = matrix(c(1:9), nrow=3, byrow=FALSE)
mat
mat[1,]
mat[1,2]
mat[,3]
mat*10
