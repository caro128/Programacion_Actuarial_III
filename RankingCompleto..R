setwd("~/Programación_Actuarial_III/Caso 2 - Calidad de Hospitales/Calidad de Hospitales")
rankingcompleo <- function(resultado, op = "mejor"){
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    est <- levels(factor(data[,7]))
    res <- c("infarto", "falla", "neumonia")
    if (estado %in% est == F){
        stop("estado invalido")
    }
    #asignamos la columna dependiendo de lo que elegimos y validamos
    if (resultado == "infarto") columna <- 11
    else if (resultado == "falla") columna <- 17
    else if (resultado == "neumonia") columna <- 23
    else if (!((resultado == "ataque")|(resultado == "falla")| (resultado == "neumonia"))){
        stop("resultado invalido")
    }
    data[, columna] <- suppressWarnings(as.numeric(levels(data[, columna])[data[, columna]]))
    data[, 2] <- as.character(data[, 2])
    x <- vector() # asignamos un vector a llenar mediante el ciclo
    estados <- levels(data[, 7])
    for(i in 1:length(estados)) {
        estados2 <- data[grep(estados[i], data[,7]), ]
        orden <- estados2[order(estados2[, columna], estados2[, 2], na.last = NA), ]
        if(op == "mejor") hospital <- orden[1, 2]
        else if(op == "peor") hospital <- orden[nrow(orden), 2]
        else hospital <- orden[op, 2]
        x <- append(x, c(hospital, estados[i]))
    }
    #creamos el data frame con la informacion obtenida
    x <- as.data.frame(matrix(x, length(estados), 2, byrow = TRUE))
    colnames(x) <- c("hospital", "state")
    rownames(x) <- estados
    x
}
head(rankingcompleto("ataque", 20), 10)
tail(rankingcompleto("neumonia", "peor"), 3)
