rankhospital<-function(estado,resultado,num="mejor"){
    
    if (file.exists("outcome-of-care-measures.csv")==F){stop("No se encontró el archivo 'outcome-of-care-measures.csv' en el directorio actual")}
    
    datos <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    edos<-unique(datos[,7])
    if(length(edos[edos==estado])==0){stop("estado inválido")}
    res<-c("ataque","falla","neumonia")
    if(length(res[res==resultado])==0){stop("resultado inválido")}
    
    names(datos)[c(11,17,23)]<-res
    ndatos<-datos[datos[,7]==estado,c("Hospital.Name",resultado)]
    ndatos[,resultado]<-suppressWarnings(as.numeric(ndatos[,resultado]))
    ndatos<-na.omit(ndatos)
    ndatos<-ndatos[order(ndatos[,2],ndatos[,1]),]
    
    if(num=="mejor"){
        num<-1
    }else if(num=="peor"){
        num<-nrow(ndatos)
    }
    ndatos[num,1]
}
