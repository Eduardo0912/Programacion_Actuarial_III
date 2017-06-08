#####1. Une los datos de test con los de training, para crear un solo conjunto de datos#####
setwd("~/UCI HAR Dataset")
subject_test<-read.table("./test/subject_test.txt")
y_test<-read.table("./test/y_test.txt")
X_test<-read.table("./test/X_test.txt")
datatest<-cbind(subject_test,y_test,X_test)
subject_train<-read.table("./train/subject_train.txt")
y_train<-read.table("./train/y_train.txt")
X_train<-read.table("./train/X_train.txt")
datatrain<-cbind(subject_train,y_train,X_train)
data<-rbind(datatest,datatrain)
data<-data[order(data[,1],data[,2]),]

#####2. Extrae únicamente las medidas de media y desviación estándar de cada medición#####
features<-read.table("features.txt")
encabezado<-c("ID Subject", "Activity", as.vector(features[,2]))
ext<-sort(c(1:2,grep("mean\\()",encabezado),grep("std\\()",encabezado)))
data8<-data[,ext]

#####3. Usa nombres de actividad para describir los nombres de las actividades en la base de datos#####
activity_labels<-read.table("activity_labels.txt")
actividades<-apply(activity_labels,1,paste,collapse=" ")
fdata<-data.frame()
for (i in 1:6){
    num<-subset(data8,data8[,2]==i)
    num[,2]<-actividades[i]
    fdata<-rbind(fdata,num)
}
fdata<-fdata[order(fdata[,1],fdata[,2]),]

#####4. Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan#####
colnames(fdata)<-encabezado[ext]
rownames(fdata)<-1:10299
dput(fdata,"RAH con celulares.R")

#####5. Crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto#####
fdata<-dget("RAH con celulares.R")
hdr<-names(fdata)
act<-unique(fdata[,2])
means<-data.frame()
for(i in 1:30){
    for(j in 1:6){
        x<-c(i,colMeans((fdata[fdata[,1]==i & fdata[,2]==act[j],])[,3:68]))
        means<-rbind(means,x)
    }
}
means<-cbind(means[,1],rep(act,30),means[,2:67])
names(means)<-hdr