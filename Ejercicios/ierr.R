# Itzia

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

FAO_tb
FAO_df

str(FAO_df)
head(FAO_df)
FAO_df$Area
typeof(FAO_df$Area)


aggregate(FAO_df$Value, list(FAO_df$Area), mean)


FAO_df$

FAO_df$Element



aggregate(FAO_df$Value, list(FAO_df$Area), FAO_df$Element), mean)

aggregate(FAO_df$Value, list(FAO_df$Element),mean)

FAO_df[FAO_df$Area=="Mexico" & FAO_df$Year==2016,]


FAO_df[FAO_df$Area=="Mexico" | FAO_df$Year==2016,]

Sys.time ()


#objeto fecha hora


unclass(Sys.time())


#formato fecha hora

fecha_nac < - as.Date("1985-10-08");fecha_nac
attributes(fecha_nac)




fechas<-FAO_df$Year


fechas<-unique(fechas)


fechas

obj_fechas <- as.Date(fechas)


obj_fechas <- as.Date(fechas)



paste(obj_fechas,"-01-01")






#Coercion


fechas<-FAO_df$Year;fechas
fechas<-unique(fechas);fechas

obj_fechas<-as.character(fechas); obj_fechas

obj_fechas<-paste0(obj_fechas, "-01-01"); obj_fechas


attributes(as.Date(obj_fechas))
