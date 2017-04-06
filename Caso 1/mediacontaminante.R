#contaminante==1 para sulfato y contaminante==2 para nitrato
mediacontaminante <- function(directorio,contaminante,id){
    setwd(directorio)
    suma<-0
    div<-0
    for (i in id){
        if (i<10){
            nombre <- paste(c("00",i,".csv"),collapse = "")
        }else if ((9<i) & (i<100)){
            nombre <- paste(c("0",i,".csv"),collapse = "")
        }else{
            nombre<- paste(c(i,".csv"),collapse = "")
        }
        archivo<-read.csv(nombre,header = TRUE )[,2:3]
        suma<-sum(archivo[,contaminante],na.rm = TRUE)+suma
        x<-archivo[,contaminante]
        div<-length(x[!is.na(x)])+div
    }
    suma/div
}