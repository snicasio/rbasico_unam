#jaze

#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

require(tibble)
require(readr)

library(tibble)
library(readr)


FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble

FAO_df
str(FAO_df)
head(FAO_df)

#Objeto nivel
FAO_df$Area
levels(FAO_df$Area)
typeof(FAO_df$Area)
aggregate(FAO_df$Value, list(FAO_df$Area),mean)
FAO_df$Element
levels(FAO_df$Element)
aggregate(FAO_df$Value, list(FAO_df$Area,FAO_df$Element),mean)
aggregate(FAO_df$Value, list(FAO_df$Element),mean)

FAO_df[FAO_df$Area=="Mexico" & FAO_df$Year == 2016,]
#Operador AND

FAO_df[FAO_df$Area=="Mexico" | FAO_df$Year == 2016,]
#Operador OR

#Objeto fecha hora
attributes(Sys.time())
typeof(Sys.time())
unclass(Sys.time())

#Objeto fecha
fecha_nac <- as.Date("1985-10-08");fecha_nac
attributes(fecha_nac)
typeof(fecha_nac)
unclass(fecha_nac)
#unclass refiere todo con relacion a 1970 lanzamiento linux


#Coercion
fechas <- FAO_df$Year
fechas <- unique(fechas)
fechas 
obj_fechas <- as.character(fechas)
paste0(obj_fechas," 01-01")
#FAO_df$Year <- paste0(as.character(FAO_df$Year)," 01-01") trabaja sobre el vector
#Modifica los datos originales 


#Ejemplo lista
lista_ejemplo <- list()
lista_ejemplo[[1]] <- list(1:100)
lista_ejemplo[[2]] <- list(3.16,3e-2)
lista_ejemplo[[3]] <- list("checa", "este", "texto")
lista_ejemplo
#Lista anidada
lista_anidada_1 <- list(rep(list(list()),5))
lista_anidada_1

lista_anidada_2 <- rep(list(rep(list(list()),5)),3)
lista_anidada_2



typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)