?dput

y<-data.frame(a=1,b="a")
dput(y)
dput(y,"y.R")
dget("y.R")
y<-dget("y.R")

x<-"Programación Actuarial III"
y<-data.frame(a=1:10,b="a")
dump(c("x","y"),file="data.R")
source("data.R")
