require("data.table")
require("rpart")
require("rpart.plot")
library(knitr)
library(ggplot2)
#options(scipen = 999)

setwd("C:\\Users\\rodri\\Downloads\\")  #Establezco el Working Directory




#Modelo 1
dataset1  <- fread("ganancias_01_028.txt")
plot( x= dataset1[ , envios],
      y= dataset1[ , gan_sum],
      type= "l",
      col="blue",
      xlim= c( 0, 20000 ),
      ylim= c( 0, 7e+07 ),
      xlab= "Envios",
      ylab= "Ganancia",
      panel.first= grid()
)


#Modelo 2
dataset2  <- fread("ganancias_02_030.txt")
lines( x= dataset2[ , envios],
       y= dataset2[ , gan_sum ],
       col= "gray" )

#Modelo 3
dataset3  <- fread("ganancias_05_034.txt")
lines( x= dataset3[ , envios],
       y= dataset3[ , gan_sum ],
       col= "green" )

#Modelo 4
dataset4  <- fread("ganancias_10_019.txt")
lines( x= dataset4[ , envios],
       y= dataset4[ , gan_sum ],
       col= "purple" )

#Modelo 5
dataset5  <- fread("ganancias_20_031.txt")
lines( x= dataset5[ , envios],
       y= dataset5[ , gan_sum ],
       col= "orange" )

#Modelo 6
dataset6  <- fread("ganancias_50_015.txt")
lines( x= dataset6[ , envios],
       y= dataset6[ , gan_sum ],
       col= "brown" )



legend("bottomright", legend = c("Modelo 1", "Modelo 2", "Modelo 5", "Modelo 10", "Modelo 20", "Modelo 50"),
       lwd = 3, col = c("blue","gray", "green","purple", "orange","brown"))
