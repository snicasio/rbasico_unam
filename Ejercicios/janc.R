#Freddy Noriega
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
FAO_df$Area
levels(FAO_df$Area) #Mostrar Áreas únicas (de un factor)
typeof(FAO_df$Area)
aggregate(FAO_df$Value, list(FAO_df$Area), mean)
levels(FAO_df$Element)
aggregate(FAO_df$Value, list(FAO_df$Element), mean)
FAO_df[FAO_df$Area=="Mexico" & FAO_df$Year==2016,] #Mostrar todas las filas cuya Area==Mexico y Year==2016
str(Sys.time())
typeof(Sys.time())
attributes(Sys.time())
unclass(Sys.time())
fecha_nac <- as.Date("1985-10-08");fecha_nac
attributes(fecha_nac)
typeof(fecha_nac)
unclass(fecha_nac)/365

fechas <- FAO_df$Year
fechas <- unique(FAO_df$Year);fechas
obj_fechas <- as.character(fechas);obj.fechas
obj_fechas <- paste0(obj_fechas, "-01-01")
obj_fechas <- as.Date(obj_fechas)
attributes(obj_fechas)
obj_fechas
