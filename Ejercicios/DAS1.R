    #   EJERCICIOS DE OPERADORES Y OBJETOS EN R

        ##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

require(tibble)
require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
#FAO_tb <- read_csv("FAO.csv")   #   tibble

typeof(FAO_df)
#typeof(FAO_tb)

str(FAO_df)
#str(FAO_tb)
FAO_df$Area
FAO_df$Value

names(FAO_df)

FAO_df[ ,4]

FAO_df[ ,12]

FAO_df[4, ]
FAO_df[12,]

c(1,3,5,17)
FAO_df[ ,c(4,12)]
FAO_df[c(20,5000) ,c(4,12)]

str(FAO_df[c(20,5000) ,c(4,12)])
tabla_uno <- FAO_df[c(20,5000) ,c(4,12)]
tabla_uno

tabla_dos <- FAO_df[c(1:20,5000:5020),c(4,12)]
tabla_dos
str(tabla_dos)

tabla_tres<-FAO_df[FAO_df$Area=="Mexico",c(4,12)]
tabla_tres
str(tabla_tres)

unique(FAO_df$Area)
# & representa and
# | representa or
tabla_cuatro <- FAO_df[FAO_df$Area=="Mexico"|FAO_df$Area=="United States of America"|FAO_df$Area=="Canada",c(4,12)]
tabla_cuatro
str(tabla_cuatro)

unique(FAO_df$Item)
unique(FAO_df$Element)
unique(FAO_df$Year)

tabla_cuatro

#Ejercicio: elaboren una tabla que contenga los índices 
#de producción percápita neta por ganadería en Centro 
#América entre los periodos 2000-2005

unique(FAO_df$Area)

tabla_ejercicio <- FAO_df[FAO_df$Area=="Belize"| FAO_df$Area=="Guatemala"|
                    FAO_df$Area=="Honduras"& FAO_df$Item=="Agriculture"& 
                    FAO_df$Element=="Net per capita Production Index Number (2004-2006 = 100)"& 
                    FAO_df$Item=="Livestock (PIN)"&
                    FAO_df$Year>=2000&FAO_df$Year<=2005,c(4,6,10) ]
tabla_ejercicio



