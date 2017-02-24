# Clase de 16/02/2017
x <- 1
print(x)
x
msg <- "Hola"
msg
X<- #esta expresión está incompleta
...
x<-1:50
print(x)
print(x)
a<-1
b<-1L
#class función que devuelve el tipo de la variable

#Creación de vectores
#Con la función vector

mi_vector<-vector("integer",5)

#con la funcion C
x<-c(0.5,0.6)
x1<-c(TRUE,FALSE)
x3<-c(T,F)
x4<-c("a","b","c")
x5<-9:29
x6<-c(2-1i,3-5i,3.14-1.186i)
y<-c(1.7,"a")
y1<-c(TRUE,2)
y2<-c("a",TRUE)

as.character(xy)
yy<-c(0:6,1.5)
as.logical(yy)
as.character(yy)
 as.numeric(x4)
 
 l<-0:6
 as.character(l)
 as.logical(l)
 hola<-c(1.5,3.15,6.9)
 as.integer(hola)
 
 ad<-list(1,"a",FALSE,1+4i,1:100)
 ad
 m<-matrix(nrow = 2,ncol = 3)
 m
 n<-matrix(1:6,nrow = 2,ncol = 3,byrow = TRUE)
 n
 nn<-matrix(1:6,2,3)
 nn
 m<-1:10
 m
 dim(m)<-c(5,2)
 m
 x<-1:3
 y<-10:12
 cbind(x,y)
 rbind(x,y)
 
 
 x<-factor(c("yes","yes","no","yes","no"),levels=c("yes","no"))
 x
 table(x)
 unclass(x)
 
 ################
x<-c(1,2,NA,10,3,NaN)
is.na(x)
is.nan(x)

x<-data.frame(foo=1:4,bar=c(T,T,F,T))
x
nrow(x)
ncol(x)
x<-1:3
names(x)
names(x)<-c("foo","bar","bia")
names(x)
x
x<-list(a=1,b=2,c=3)
x
x<-list(1,2,3)
m=matrix(1:4,2,2)
m
dimnames(m)
dimnames(m)<-list(c("a","b"),c("c","d"))
dimnames(m)
dimnames(m)
m

############
y<-data.frame(a=1,b="a")
y
dput(y)
dput(y,"y.R")
dget("y.R")
y=dget("y.R")
getwd() #para saber cual es el directorio de trabajo
x<-"Programacion Actuarial III"
y<-data.frame(a=1:10,b="a")
dump(c("x","y"),file = "data.R")
source("data.R")

 
 
 
 
 
 
 
 
 
 
 
