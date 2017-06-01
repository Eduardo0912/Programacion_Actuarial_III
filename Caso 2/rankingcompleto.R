rankingcompleto<-function(resultado,num="mejor"){
    if (file.exists("outcome-of-care-measures.csv")==F){stop("No se encontró el archivo 'outcome-of-care-measures.csv' en el directorio actual")}
    
    datos <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    edos<-unique(datos[,7])
    res<-c("ataque","falla","neumonia")
    if(length(res[res==resultado])==0){stop("resultado inválido")}
    
    names(datos)[c(11,17,23)]<-res
    ndatos<-datos[,c("Hospital.Name","State",resultado)]
    ndatos[,resultado]<-suppressWarnings(as.numeric(ndatos[,resultado]))
    ndatos<-na.omit(ndatos)
    ldatos<-split(ndatos,ndatos$State)
    extrae<-function(dato){
        if(num=="mejor"){
            num<-1
        }else if(num=="peor"){
            num<-nrow(dato)
        }
        c((dato[order(dato[,3],dato[,1]),])[num,1],dato[1,2])
    }
    l<-t(sapply(ldatos,extrae))
    l<-as.data.frame(l)
    names(l)<-c("Hospital","Estado")
    l
    
}
