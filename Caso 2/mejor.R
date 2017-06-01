mejor<-function(estado,resultado){
    
    if (file.exists("outcome-of-care-measures.csv")==F){stop("No se encontró el archivo 'outcome-of-care-measures.csv' en el directorio actual")}
    
    datos <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    edos <- unique(datos[,7])
    if(length(edos[edos==estado])==0){stop("estado inválido")}
    res<-c("ataque","falla","neumonia")
    if(length(res[res==resultado])==0){stop("resultado inválido")}
    
    names(datos)[c(11,17,33)]<-res
    ndatos<-datos[datos[,7]==estado,c("Hospital.Name",resultado)]
    ndatos[,resultado]<-suppressWarnings(as.numeric(ndatos[,resultado]))
    
    salida<-ndatos[ndatos[,2]==min(ndatos[,2],na.rm = T),1]
    (salida[order(salida)])[1]
    
}
