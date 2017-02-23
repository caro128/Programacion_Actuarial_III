?data.frame

x<-c(1,2,NA,10,3)
is.na(x)
is.nan(x)

#na valor faltante nan no numero
y<-c(1,2,NA,10,3,NaN)
is.na(y)
is.nan(y)

z<-data.frame(foo=1:4,bar=c(T,T,F,T))
z
nrow(z)
ncol(z)

z<-1:3
names(z)
names(z)<-c("Henry", "Yessi", "Elsy")
names(z)
z

w<-1:6
w
dim(w)<-c(2,3)
w

x<-list(a=1,b=2,c=3)
x
y<-list(1,2,3)
y

z<-matrix(1:4,2,2)
z
dimnames(z)
dimnames(z)<-list(c("a","b"),c("c","d"))
z

?read.table
?read.csv
