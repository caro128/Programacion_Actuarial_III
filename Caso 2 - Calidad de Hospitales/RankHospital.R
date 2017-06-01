setwd("~/Programación_Actuarial_III/Caso 2 - Calidad de Hospitales/Calidad de Hospitales")
rankhospital <- function(estado, resultado, op = "mejor"){
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
        x <- enc[order(as.numeric(final[,2])),]
        if (op == "mejor") op <- 1
        else if (op == "peor") op <- nrow(x)
        else if (op > nrow(x)) {
            stop(return(NA))
        }
        i <- 0
        while (x[i+1,2] != x[op,2]){
            i <- i + 1
        }
        f <- op - i
        y <- x[which(x[,2] == x[num,2]),]
        z <- y[order(y[,1]),]
        z[f,1] 
    }
    else  {
        final <- enc[- grep("Not", enc[,2]),]
        x <- final[order(as.numeric(final[,2])),]
        if (op == "mejor") op <- 1
        else if (op == "peor") op <- nrow(x)
        else if (op > nrow(x)) {
            stop(return(NA))
        }
        i <- 0
        while (x[i+1,2] != x[op,2]){
            i <- i + 1
        }
        f <- op - i
        y <- x[which(x[,2] == x[op,2]),]
        z <- y[order(y[,1]),]
        z[f,1]
    }
}
rankhospital("TX","falla","peor")
rankhospital("TX","falla",4)