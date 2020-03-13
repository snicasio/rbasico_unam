# jose francisco alvarado navarro

#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

require(tibble)
require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble


    # ejemplo lista

lista_ejemplo <- list()

typeof(lista_ejemplo)
lista_ejemplo

lista_ejemplo[[1]] <- list(1:100)
lista_ejemplo[[2]] <- list(3.16,3e-2)
lista_ejemplo[[3]] <- list("checa", "este", "texto")
lista_ejemplo

    # Lista anidada

lista_anidada_1 <- list(rep(list(list)))


str(FAO_df)
head(FAO_df)
FAO_df$Area
levels(FAO_df$Area)
typeof(FAO_df$Area)

    # Objeto Nivel

levels(FAO_df$Element)
aggregate(FAO_df$Value, list(FAO_df$Area,FAO_df$Element),mean)

FAO_df[FAO_df$Area=="Mexico" & FAO_df$Year == 2016,]
FAO_df[FAO_df$Area=="Mexico" | FAO_df$Year == 2016,]

FAO_tb

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)

    # Format fecha/hora

unclass(Sys.time())

    # Objeto fecha

fecha_nac <- as.Date("1973-01-21");fecha_nac
attributes(fecha_nac)
typeof(fecha_nac)
unclass(fecha_nac)

    # Coercion

fechas <- FAO_df$Year
fechas <- unique(fechas)
fechas

obj_fechas <- as.character(Fechas)



FAO_df$Year <- paste0(as.character(FAO_df$Year),"-01-01")

paste0(obj_fechas,"-01-01")


