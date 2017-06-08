README

1. Une los datos de test con los de training, para crear un solo conjunto de datos

#Establece el directorio de trabajo en la carpeta 'UCI HAR Dataset'
setwd("~/UCI HAR Dataset")

#Almacena los datos del archivo 'subject_test.txt'
subject_test<-read.table("./test/subject_test.txt")

#Almacena los datos del archivo 'y_test.txt'
y_test<-read.table("./test/y_test.txt")

#Almacena los datos del archivo 'X_test.txt'
X_test<-read.table("./test/X_test.txt")

#Crea un Data Frame con los objetos 'subject_test', 'y_test' y 'X_test'
datatest<-cbind(subject_test,y_test,X_test)

#Almacena los datos del archivo 'subject_train.txt'
subject_train<-read.table("./train/subject_train.txt")

#Almacena los datos del archivo 'y_train.txt'
y_train<-read.table("./train/y_train.txt")

#Almacena los datos del archivo 'X_train.txt'
X_train<-read.table("./train/X_train.txt")

#Crea un Data Frame con los objetos 'subject_train', 'y_train' y 'X_train'
datatrain<-cbind(subject_train,y_train,X_train)

#Crea un Data Frame uniendo los objetos 'datatest' y 'datatrain'
data<-rbind(datatest,datatrain)

#Ordena la base de datos 'data' de acuerdo a las columnas 1 y 2
data<-data[order(data[,1],data[,2]),]

2. Extrae únicamente las medidas de media y desviación estándar de cada medición

#Almacena los datos del archivo 'features.txt'
features<-read.table("features.txt")

#Crea un vector con los nombres de las variables
encabezado<-c("ID Subject", "Activity", as.vector(features[,2]))

#Del vector encabezado extrae las posiciones de las variables 'mean' y 'std' de cada medición,
#Agrega los números 1:2 porque son el número de columna de 'ID Subject' y 'Activity'
#Ordena estos números y los guarda en el vector 'ext'
ext<-sort(c(1:2,grep("mean\\()",encabezado),grep("std\\()",encabezado)))

#Almacena en 'data8' las columnas de media y desviación estándar de 'data'
data8<-data[,ext]

3. Usa nombres de actividad para describir los nombres de las actividades en la base de datos

#Almacena los datos del archivo 'activity_labels.txt'
activity_labels<-read.table("activity_labels.txt")

#Crea un vector 'actividades' con los nombres de las activiadades a utilizar en un ciclo for
actividades<-apply(activity_labels,1,paste,collapse=" ")

#Crea un Data Frame vacío que ocuparemos para el for
fdata<-data.frame()

#Crea un ciclo for que va de 1 a 6 (Porque hay 6 actividades diferentes), donde asigna a la segunda columna el nombre de la actividad correspondiente. 
for (i in 1:6){
    num<-subset(data8,data8[,2]==i)
    num[,2]<-actividades[i]
    fdata<-rbind(fdata,num)
}
#Ordenamos el Data Frame 'fdata' de acuerdo a las columnas 1 y 2 
fdata<-fdata[order(fdata[,1],fdata[,2]),]

4. Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan

#Asigna una parte del vector 'encabezado' (ext) a los nombres de las columnas de 'fdata'
colnames(fdata)<-encabezado[ext]

#Asigna los nombres de las observaciones para que se vean de forma ordenada
rownames(fdata)<-1:10299

#Guarda la base de datos ordenada en el directorio de trabajo actual
dput(fdata,"RAH con celulares.R")
