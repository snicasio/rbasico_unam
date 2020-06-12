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

names(FAO_df) # Consultar las columnas

## Hacer un subset con la información de México
subset_1 = subset(FAO_df, subset = Area == "Mexico", select = c("Area", "Item", "Value"))
subset_1 

subset_2 = FAO_df[FAO_df$Area == "Mexico", c(4,8,12)]
subset_2

subset_3 = subset(FAO_df, 
                  subset = 
                      (Area == "Belize" |
                      Area == "Panama") &
                      Element == "Net per capita Production Index Number (2004-2006 = 100)" &
                      Item == "Livestock (PIN)" &
                      Year >=2000 &
                      Year <= 2005,
                  select = c("Area", "Item", "Value"))
subset_3

## EJERCICIO: Calcular el valor promedio (cada 5 anios)
## de la producción neta por agricultura para Mexico y Colombia
#Paso 1: Seleccionar: Mexico y Colombia
#Paso 2: Seleccionar: [1] "Agriculture (PIN)"
#Paso 3: Seleccionar: [3] "Net Production Index Number (2004-2006 = 100)"
#Paso 4: Seleccionar: Value
#PaSO 5: Calcular el promedio

agri_mc = subset(FAO_df,
                 subset = (Area == "Mexico" | Area == "Colombia") & #Paso 1
                     Item == "Agriculture (PIN)" & #Paso 2
                     Element == "Net Production Index Number (2004-2006 = 100)" & #Paso 3
                     Year >= 2000 & Year <=2005, #Paso 4
                 select = c("Area", "Value")) #Paso 5
agri_mc

write.csv(agri_mc,"agri_2005.csv", row.names = F)

aggregate(agri_mc$Value, by = list(agri_mc$Area), FUN = mean) #Paso 6




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
