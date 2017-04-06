setwd("~/Programacion_Actuarial_III/Caso 1/specdata")
mediacontaminante<-function(directorio,contaminante,id=1:332){
    suma<-numeric()
    
    for (i in id)
        #Lee los archivos y rellena los "0" que falten
        ids<-formatC(i,width = 3,flag = "0")
        #Enumera los archivos y les asigna un nombre
        nid<-read.csv(paste(ids,".csv",sep = ""),header = T)
    
        if (contaminante=="sulfate"){
            suma<-c(suma,nid$sulfate)
    }
        else if (contaminante=="nitrate"){
            suma<-c(suma,nid$nitrate)
        }
        else{
            paste("Error,",contaminante,"no se encuentra.")
        }

    #Saca el promedio del contaminante sin contar los NA
    promedio<-mean(suma,na.rm = T)
    promedio
}

#Ejemplos para probar que funciona el código
mediacontaminante("specdata","nitrate",28)
mediacontaminante("specdata","sulfate",7:13)
