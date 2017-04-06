completos <- function(directorio, id){
    setwd(directorio)
    resultados<-c()
    for (i in id){
        if (i<=9){
            nombre <- paste(c("00",i,".csv"),collapse = "")
        }else if ((10<=i) & (i<=99)){
            nombre <- paste(c("0",i,".csv"),collapse = "")
        }else{
            nombre<- paste(c(i,".csv"),collapse = "")
        }
        doc<-read.csv(nombre,header = TRUE)
        comp<-nrow(na.omit(doc))
        resultados<-rbind(resultados,c(i,comp))
    }
    colnames(resultados)<-c("ID", "nobs")
    data.frame(resultados)
}
