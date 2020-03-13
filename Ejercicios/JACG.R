#Jose Alfredo Cervantes Guzman

#No Problema
#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

require(tibble)
require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)
head(FAO_df)
FAO_df$Area

levels(FAO_df$Area)
typeof(FAO_df$Area)

levels(FAO_df$Element)

aggregate(FAO_df$Value,list(FAO_df$Area,FAO_df$Element),mean)

aggregate(FAO_df$Value,list(FAO_df$Element),mean)

FAO_df[1,2]

FAO_df[FAO_df$Area == "Mexico",]


FAO_df[FAO_df$Area == "Mexico" & FAO_df$Year == 2016,]

FAO_df[FAO_df$Area == "Mexico" | FAO_df$Year == 2016,]

FAO_df

#FECHA-HORA
nacimiento <- as.Date("1987-10-07")
Sys.time()
unclass(Sys.time())


# Objeto fecha

fecha_nac <- as.Date("1987-10-07"); fecha.nac
attributes(fecha_nac)
typeof(fecha_nac)


##Coercion

fechas <- FAO_df$Year
fechas
fechas <- unique(fechas)
fechas

obj_fechas <- as.character(fechas)
obj_fechas

obj_fechas <- paste0(obj_fechas,"-01-01")

obj_fechas <- as.Date(obj_fechas)
obj_fechas

attributes(obj_fechas)

#Lista ejemplo
lista <- list()
typeof(lista)
lista
lista[[1]] <- c(1:100)
lista[[2]] <- c("No","Surprises")
lista[[3]] <- c(3.19,320)
lista

lista <- list()
typeof(lista)
lista
lista[[1]] <- list(1:100)
lista[[2]] <- list("No","Surprises","Loco")
lista[[3]] <- list(3.19,320)
lista

#Lista anidada

lista_anidada <- list(rep(list(list()),times=5))
lista_anidada

lista_anidada2 <- rep(list(rep(list(list()),times=5)),3)
lista_anidada2
