# Question 1
x<-c(8,2,2,3)
x
variance=((x-3.75)%*%(x-3.75))/3
variance
#By in-built function var()
var(x)

# Question 2

y1<-c(4,3)
y2<-c(2,7)
y<- rbind(y1,y2)
y
tranx<-t(y)
tranx
a<-tranx%*%y
a
# Question3 

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
# Question 4

summary(`housing.(1)`)
M1<-lm(CRIM ~.,data=`housing.(1)`)# linear regression
summary(M1)
coefficients(M1)
# backward elimination
library(MASS)
M2<-lm(CRIM ~.,data=`housing.(1)`)
step<-stepAIC(M2,direction = "backward")
step$anova
summary(step)

# forward Selection
model_full<-lm(CRIM ~.,data=`housing.(1)`)
model_empty<-lm(CRIM ~1,data=`housing.(1)`)
step2<-stepAIC(model_empty,direction = "forward", scope = list(upper= model_full, lower=model_empty))

summary(step2)