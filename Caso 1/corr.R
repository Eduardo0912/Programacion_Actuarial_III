corr <- function(directorio, horizonte){
    setwd(directorio)
    resultados<-c()
    for (i in 1:332){
        if (i<=9){
            nombre <- paste(c("00",i,".csv"),collapse = "")
        }else if ((10<=i) & (i<=99)){
            nombre <- paste(c("0",i,".csv"),collapse = "")
        }else{
            nombre<- paste(c(i,".csv"),collapse = "")
        }
        doc<-read.csv(nombre,header = TRUE)
        comp<-na.omit(doc)
        if (nrow(comp)>horizonte){
            resultados<-c(resultados, cor(comp[,2],comp[,3]))
        }else{
            resultados<-resultados
        }
    }
    resultados
}