setwd("~/Programacion_Actuarial_III/Caso 3 - RAH con Celulares/UCI HAR Dataset")

xtr <-read.table("./train/X_train.txt")
ytr <-read.table("./train/Y_train.txt")
str <-read.table("./train/subject_train.txt")

xts <- read.table("./test/X_test.txt")
yts <- read.table("./test/y_test.txt")
sts <- read.table("./test/subject_test.txt")

dtX <- rbind(xtr, xts)
dtY <- rbind(ytr, yts)
dtS <- rbind(str, sts)

rm(xtr)
rm(ytr)
rm(str)
rm(xts)
rm(yts)
rm(sts)

caracteristicas <- read.table("./features.txt")
promedioStdIndex <- grep("mean\\(\\)|sd\\(\\)", caracteristicas[, 2])
dtX <- dtX[, promedioStdIndex]
names(dtX) <- gsub("\\(\\)", "", caracteristicas[promedioStdIndex, 2])
names(dtX) <- gsub("mean", "Mean", names(dtX)) 
names(dtX) <- gsub("sd", "Sd", names(dtX)) 
names(dtX) <- gsub("-", "", names(dtX)) 
rm(caracteristicas)
rm(promedioStdIndex)

actividad <- read.table("./activity_labels.txt")
actividad[, 2] <- tolower(gsub("_", "", actividad[, 2])) 
substr(actividad[2, 2], 8, 8) <- toupper(substr(actividad[2, 2], 8, 8)) 
substr(actividad[3, 2], 8, 8) <- toupper(substr(actividad[3, 2], 8, 8)) 
dtY[, 1] <- actividad[dtY[, 1], 2]
names(dtY) <- "actividad"

names(dtS) <- "sujeto"
cleandata <- cbind(dtS, dtY, dtX)
rm(dtX)
rm(dtY)

SLen <- length(table(dtS)) 
actividadLen <- dim(actividad)[1]
colLen <- dim(cleandata)[2]
op <- as.data.frame(matrix(NA, nrow=SLen*actividadLen, ncol=colLen))
colnames(op) <- colnames(cleandata)

f <- 1
for(i in 1:SLen) {
    for(j in 1:actividadLen) {
        op[f, 1] <- sort(unique(dtS)[, 1])[i]
        op[f, 2] <- actividad[j, 2]
        die1 <- i == cleandata$sujeto
        die2 <- actividad[j, 2] == cleandata$actividad
        op[f, 3:colLen] <- colMeans(cleandata[die1&die2, 3:colLen])
        f <- f + 1
    }
}

write.table(op, "Completed.txt", row.name=FALSE)
