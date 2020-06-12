#Freddy Noriega
#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)
require(tibble)
require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble

typeof(FAO_df)
#typeof(FAO_tb)

str(FAO_df)
#str(FAO_tb)


FAO_df$Area
FAO_df$Value

names(FAO_df)

FAO_df[,4]
FAO_df[,12]

FAO_df[4,]
FAO_df[12,]

FAO_df[c(20,5000),c(4,12)]
str(FAO_df[c(20,5000),c(4,12)])

tabla_uno <- FAO_df[c(20,5000),c(4,12)]

tabla_dos <- FAO_df[c(1:20,5000:5020),c(4,12)]

tabla_dos
str(tabla_dos)

tabla_tres = FAO_df[FAO_df$Area == "Mexico",]
tabla_tres

str(tabla_tres)

unique(FAO_df$Area)

tabla_cuatro = FAO_df[FAO_df$Area == "Mexico" | FAO_df$Area == "United States of America" | FAO_df$Area == "Canada", c(4,12)]
tabla_cuatro 
str(tabla_cuatro)

unique(FAO_df$Item) # Ganado
unique(FAO_df$Element) # Net per capita Production Index Number (2004-2006 = 100)
unique(FAO_df$Year) # 2000-2005
unique(FAO_df$Area) # El Salvador, Costa Rica, Belize, Guatemala, Honduras, Nicaragua and Panama.

# Ejercicio: Elaboren una tabla que contenta los indices de producción per capita neta por *ganadería* en Centroamerica
#            entre los periodos 2000-2005, todas las columnas

ejercicio = FAO_df[FAO_df$Element == "Net per capita Production Index Number (2004-2006 = 100)" & FAO_df$Item == "Livestock (PIN)" & FAO_df$Year >=2000 & FAO_df$Year <= 2005 & (FAO_df$Area == "Costa Rica" | FAO_df$Area == "Belize" | FAO_df$Area == "El Salvador" | FAO_df$Area == "Guatemala" | FAO_df$Area == "Honduras" | FAO_df$Area == "Nicaragua" | FAO_df$Area == "Panama"),]
ejercicio
str(ejercicio)

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
