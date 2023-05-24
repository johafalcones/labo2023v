require("data.table")
require("rpart")
require("rpart.plot")
library(knitr)
library(ggplot2)
options(scipen = 999)

setwd("~/Desktop/US/US03 10 sem")  #Establezco el Working Directory


#Leo los archivos de ganancias
dataset1  <- fread("exp_ZZ8920_US03_ganancias_01_061.txt")
dataset2  <- fread("exp_ZZ8920_US03_ganancias_02_040.txt")
dataset3  <- fread("exp_ZZ8920_US03_ganancias_05_065.txt")
dataset4  <- fread("exp_ZZ8920_US03_ganancias_10_018.txt")
dataset5  <- fread("exp_ZZ8920_US03_ganancias_20_062.txt")
dataset6  <- fread("exp_ZZ8920_US03_ganancias_50_029.txt")

ds1 <-  round(max(dataset1[ , gan_suavizada], na.rm=T)/1000000,1)
ds2 <-  round(max(dataset2[ , gan_suavizada], na.rm=T)/1000000,1)
ds3 <-  round(max(dataset3[ , gan_suavizada], na.rm=T)/1000000,1)
ds4 <-  round(max(dataset4[ , gan_suavizada], na.rm=T)/1000000,1)
ds5 <-  round(max(dataset5[ , gan_suavizada], na.rm=T)/1000000,1)
ds6 <-  round(max(dataset6[ , gan_suavizada], na.rm=T)/1000000,1)

ymax  <- max(ds1,ds2,ds3,ds4,ds5,ds6)


#Dibujo los modelos
#Modelo 1
plot( x= dataset1[ , envios],
      y= dataset1[ , gan_suavizada]*1/1000000,
      type= "l",
      col="blue",
      xlim= c( 0, 20000 ),
      ylim= c( 0, ymax ),
      main= paste0("Mejor gan Modelo = ", ymax),
      xlab= "Envios",
      ylab= "Ganancia",
      panel.first= grid()
)


#Modelo 2
lines( x= dataset2[ , envios],
       y= dataset2[ , gan_suavizada ]*1/1000000,
       col= "gray" )

#Modelo 3
lines( x= dataset3[ , envios],
       y= dataset3[ , gan_suavizada ]*1/1000000,
       col= "green" )

#Modelo 4
lines( x= dataset4[ , envios],
       y= dataset4[ , gan_suavizada ]*1/1000000,
       col= "purple" )

#Modelo 5
lines( x= dataset5[ , envios],
       y= dataset5[ , gan_suavizada ]*1/1000000,
       col= "orange" )

#Modelo 6
lines( x= dataset6[ , envios],
       y= dataset6[ , gan_suavizada ]*1/1000000,
       col= "brown" )


legend("bottomright", legend = c(paste("Iter 1", ds1, sep = ": "), paste("Iter 2", ds2, sep = ": "), paste("Iter 5", ds3, sep = ": "), paste("Iter 10", ds4, sep = ": "), paste("Iter 20", ds5, sep = ": "), paste("Iter 50", ds6, sep = ": ")),
       lwd = 3, cex = 0.8, title = "Undersampling 0.3 - Future 202106", col = c("blue","gray", "green","purple", "orange","brown"))




#layout(matrix(c(1:4), nrow=2, byrow=FALSE))
#layout.show(4) # Muestra las cuatro particiones


#layout(matrix(c(1:6), nrow=2, byrow=TRUE))
#layout.show(6) # Muestra las cuatro particiones