setwd("~/Programacion_Actuarial_III/Caso 1/specdata")
corr<-function(directorio,horizonte=0){
    correlacion<-vector("numeric")
    x<-vector("numeric")
    
    for (i in 1:332){
        #Lee los archivos y rellena los "0" que falten
        ids<-formatC(i,width = 3,flag = "0")
        #Enumera los archivos y les asigna un nombre
        nid<-read.csv(paste(ids,".csv",sep = ""),header = T)
        
        rc<-complete.cases(nid)
        #Extrae los rc del directorio
        y<-nid[rc,]
        if (i>=horizonte){
            #Definimos la correlación entre el sulfato y el nitrato
            correlacion<-cor(y[2],y[3])
            z<-as.vector(correlacion)
            x<-c(x,z)
        }
    }
    x
}

#Ejemplos para probar que funciona el código
corr("specdata",28)