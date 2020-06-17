

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
                     Year >= 2001 & Year <=2005, #Paso 4
                 select = c("Area", "Value")) #Paso 5
agri_mc

write.csv(agri_mc,"agri_2005.csv", row.names = F)

aggregate(agri_mc$Value, by = list(agri_mc$Area), FUN = mean) #Paso 6

## OPERACIONES BÁSICAS

numeros = agri_mc$Value
numeros
str(numeros)

sum(numeros)
1+2
1+numeros # Suma de valor unico y vector numerico

num_secuencia = 1:10
num_secuencia

numeros = num_secuencia + numeros
numeros

# Restas

1-2 # Suma de valores unicos
1-numeros #Suma de valor unico y vector numerico
numeros -1
num_secuencia = 1:10

resta_vectores = num_secuencia-numeros #Suma de vectores
resta_vectores

num_secuencia= num_secuencia-numeros
num_secuencia

num_secuencia[3]
num_secuencia[c(3,7,10)]
num_secuencia[c(10,3,7)]

#Multiplicaciones y divisiones
1*2
1/2

3*numeros
1/numeros
num_secuencia = 1:10
num_secuencia*numeros
num_secuencia/numeros

num_secuencia


# Otros comandos de operaciones

numeros = agri_mc$Value
numeros

mean(numeros) #Media
median(numeros) #Mediana
quantile(numeros) #Cuartiles
range(numeros) #Rango
var(numeros)#Varianza
sd(numeros) #Desviación estandar

#EJERCICIO 3: Calcular los valores estandarizados de los siguientes
# 1) Produccion neta agricola de Mexico (todos los anios)
# 2) Produccion neta pecuaria de Mexico (todos los anios)

#Paso 1: Extraer la información de los indices de productividad para Mexico
#Paso 2: Extraer la infn. para los rubros de agricultura y ganaderia
#Paso 3: Calcular los valores estandarizados
#Paso 4: Representarlos en un histograma

# names(FAO_df)
#names(FAO_df)[c(6,8)] 
# names(FAO_df)[c(6,8)] = c("Indicador", "Rubro")

FAO_df <- read.csv("FAO.csv")   #   data.frame

agrigan_m = subset(FAO_df,
                 subset = Area == "Mexico" & #Paso 1
                     (Item == "Livestock (PIN)" | Item == "Agriculture (PIN)") & #Paso 2
                     Element == "Net Production Index Number (2004-2006 = 100)", #Paso 3
                 select = c("Item", "Value")) #Paso 4
agrigan_m
str(agrigan_m)

agri_mx = subset(agrigan_m, subset = Item == "Agriculture (PIN)", select = c("Value"))
gan_mx = subset(agrigan_m, subset = Item == "Livestock (PIN)", select = c("Value"))

str(agri_mx)
agri_mx = agri_mx$Value
gan_mx = gan_mx$Value
mean(agri_mx)
sd(agri_mx)

z_agri = (agri_mx - mean(agri_mx)) / sd(agri_mx)
z_gan = (gan_mx - mean(gan_mx)) / sd(gan_mx)
z_agri
hist(z_agri)
hist(z_gan, main = "Producción neta ganadera")
