#Netza Chavez
#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)
require(tibble)
library(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble


# Ejemplo lista

lista_ejemplo <- list()

typeof(lista_ejemplo)
lista_ejemplo

lista_ejemplo[[1]] <- list(1:100)
lista_ejemplo[[2]] <- list(3.16,3e-2)
lista_ejemplo[[3]] <- list("Checa", "este", "texto")

lista_ejemplo

# Lista anidada

lista_anidada_1 <- list(rep(list(list()),5))
lista_anidada_1

lista_anidada_2 <- rep(list(rep(list(list()),5)),3)
lista_anidada_2



FAO_df
FAO_tb

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)
require(tibble)
require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)
lista_ejemplo<- list()

lista_ejemplo[[1]] <- c(1:100)
lista_ejemplo[[2]] <- c(3.16,3e-2)
lista_ejemplo[[3]] <- c("checa","este","texto")

 # lista anidada

lista_anidada_1 <- list()
require(tibble)
library(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble


# Ejemplo lista

lista_ejemplo <- list()

typeof(lista_ejemplo)
lista_ejemplo

lista_ejemplo[[1]] <- list(1:100)
lista_ejemplo[[2]] <- list(3.16,3e-2)
lista_ejemplo[[3]] <- list("Checa", "este", "texto")

lista_ejemplo

# Lista anidada

lista_anidada_1 <- list(rep(list(list()),5))
lista_anidada_1

lista_anidada_2 <- rep(list(rep(list(list()),5)),3)
lista_anidada_2



FAO_df
FAO_tb

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)

str(FAO_df)
head(FAO_df)
FAO_df$Area
levels(FAO_df$Area)
typeoflFAO_df$Areaevels(FAO_df$element)()
typeof(FAO_df$Area)
FAO_df$Element
aggregate(FAO_df$Value, list(FAO_df$element),mean)
FAO_df[FAO_df$Area=="Mexico" & FAO_dfyear == 2016,]
FAO_df[1,6]
FAO_df[FAO_df$Area=="Mexico",]
FAO_df[FAO_df$Area=="Mexico" & FAO_df$year == 2016,]
# Objeto fecha hora
obj_fechas <- as.character(fechas)
fecha_nac <- as.Date("1971-04-30");fecha_nac
unclass(fecha_nac)
fechas <- FAO_df$Year
paste0("01-01-",obj_fechas)
