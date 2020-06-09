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


FAO_df

FAO_df$Area
FAO_df$Value

names(FAO_df)

FAO_df[ ,4]
FAO_df[ ,12]


FAO_df[4, ]
FAO_df[12, ]


FAO_df[ ,c(4,12)]
    FAO_df[c(20,5000),c(4,12)]
    str(FAO_df[c(20,5000),c(4,12)])

#[ , ]

tabla_uno <- FAO_df[c(20,5000),c(4,12)]
    tabla_uno

tabla_dos <- FAO_df[c(1:20,5000:5020),c(4,12)]
    tabla_dos
    str(tabla_dos)


tabla_tres <- FAO_df[FAO_df$Area == "Mexico", c(4,12)]
    tabla_tres
    str(tabla_tres)

unique(FAO_df$Area)

# & representa "AND" o "interseccion"
# | representa "OR" o "union
tabla_cuatro <- FAO_df[FAO_df$Area == "Mexico" | FAO_df$Area == "United States of America" | FAO_df$Area == "Canada", c(4,12)]
    tabla_cuatro
    str(tabla_cuatro)


#FAO_df[FAO_df$Area == "Mexico" & FAO_df$Area == "United States of America" & FAO_df$Area == "Canada", c(4,12)]

unique(FAO_df$Item)
unique(FAO_df$Element)
unique(FAO_df$Year)


    #   Ejercicio: Elaboren una tabla que contenga los valores de los indices de produccion per capita neta por
    #               ganaderia en Centroamerica
    #               entre los periodos 2000-2005



