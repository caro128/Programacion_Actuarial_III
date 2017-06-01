setwd("~/Programación_Actuarial_III/Caso 2 - Calidad de Hospitales/Calidad de Hospitales")
mejor <- function(estado,resultado){
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    #encontramos el nombre de cada estado y resultado y validamos   
    est <- levels(factor(data[,7]))
    res <- c("infarto", "falla", "neumonia")
    
    if (estado %in% est == F){
        stop("estado invalido")
    }
    #asignamos la columna dependiendo de lo que elegimos
    if (resultado == "infarto") columna <- 11
    else if (resultado == "falla") columna <- 17
    else if (resultado == "neumonia") columna <- 23
    else if (!((resultado == "ataque")|(resultado == "falla")| (resultado == "neumonia"))){
        stop("resultado invalido")
    }
    datos <- data[data$State == estado,]
    enc <- datos[,c(2,columna)]
    if (sum(enc[,2]=="Not Available") < 1) {
        x <- enc[order(as.numeric(enc[,2])),]
        y <- x[which(x[,2] == x[1,2]),]
        z <- y[order(y[,1]),]
        z[1,1]
    }
    else{
        u<- enc[- grep("Not", enc[,2]),]
        #grep busca coincidencias con el
        #argumento para cada elemento de un vector de c.
        
        x <- u[order(as.numeric(u[,2])),]
        y <- x[which(x[,2] == x[1,2]),]
        z <- y[order(y[,1]),]
        z[1,1]
    }
}
mejor("TX","falla")
mejor("MD", "neumonia")
