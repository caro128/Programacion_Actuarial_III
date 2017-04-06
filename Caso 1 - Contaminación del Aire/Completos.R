setwd("~/Programacion_Actuarial_III/Caso 1/specdata")
completos<-function(directorio, id=1:332){
    registros<-vector("numeric")
        
    for (i in id){
        #Lee los archivos y rellena los "0" que falten
        ids<-formatC(i,width = 3,flag = "0")
        #Enumera los archivos y les asigna un nombre
        nid<-read.csv(paste(ids,".csv",sep = ""),header = T)
    
        rc<-complete.cases(nid)
        #Extrae los rc del directorio
        x<-nid[rc,]
        #Enumera los rc de la lista
        y<-nrow(x)
        registros<-c(registros,y)
    }
    
    #id igual al ID del monitor y #rc de ese monitor igual a los registros
    z<-data.frame(id=id,nobs=registros)
    z
}

#Ejemplos para probar que funciona el código
completos("specdata",7:13)
completos("specdata",28)