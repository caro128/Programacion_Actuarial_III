#Clase de 16.Feb.17
#asignar un valor a una variable <-
x<-1
#poner solo la x para imprimir en la consola
x
print(x)
msg<-"Hola"
msg
y<-#esta expresión está incompleta
5
msg1

x<-1:20
x
y<-1:100
y
#guardar una variable con 1 quiere decir número  1L quiere decir que es intero
#la opción class te imprime el tipo de variable que es
a<-1
b<-1L
#1/0 inf y 0/0 NaN

#Creación de vectores

#Con la función de vector
vector(mode = "integer", length = 5)
mi_vector<-("integer",5)

#Con la función C
x1<-c(0.5,0.6)
x2<-c(TRUE,FALSE)
x3<-c(T,F)
x4<-c("a","b","c")
x5<-9:29
x6<-c(2+1i,3-5i,3.14+1.186i)

y1<-c(1.7,"a")
y2<-c(TRUE,2)
y3<-c("a",TRUE)

z<-0:6
as.numeric(z)
as.logical(z)
as.character(z)

w<-c(0:6,0.5)
as.logical(w)

q<-c("a","b","c")
as.numeric(q)
as.logical(q)
as.complex(q)

r<-c(1.5,5.7,6.2)
as.integer(r)
s<-list(1,"a",TRUE,1+4i)
s
t<-list(1,"a",TRUE,1+4i,1:100)
t

x<-matrix(nrow = 2, ncol = 3)
x
dim(x)
attributes(x)
attributes(matrix(1:100,10,10))
y<-matrix(1:6,2,3)
y
z<-matrix(1:6,nrow = 2,ncol = 3,byrow = TRUE)
z

m<-1:10
m
dim(m)<-c(2,5)
m
dim(m)<-c(5,2)
m

x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

x<-factor(c("yes","yes","no","yes","no"))
x
table(x)
unclass(x)
y<-factor(c("yes","yes","no","yes","no"))
levels=c("yes","no")
y

