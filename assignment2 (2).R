library("MASS")
data("mtcars")
z<-mtcars[c(2,3,4,6,11)]

y<-mtcars[c(1)]

z<-cbind(count=1, z)

z_matrix=data.matrix(z)
y_matrix=data.matrix(y)

ztranspose<-t(z_matrix)# transpose
ztranspose_z<-ginv(ztranspose%*%z_matrix)

a<-ztranspose%*%y_matrix
final<-ztranspose_z%*%a
final

# using linear regression
final1<-lm(mpg~cyl+ disp+hp+wt+carb,data=mtcars)
summary(final1)