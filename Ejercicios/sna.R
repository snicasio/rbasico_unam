    #   EJERCICIOS DE OPERADORES Y OBJETOS EN R

        ##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

#require(tibble)
#require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
#FAO_tb <- read_csv("FAO.csv")   #   tibble

typeof(FAO_df)
#typeof(FAO_tb)

str(FAO_df)
#str(FAO_tb)
<<<<<<< HEAD
=======


FAO_df

>>>>>>> b9a95bbb4d05ef4d29b87b5316bf68241072cb58
FAO_df$Area
FAO_df$Value

names(FAO_df)

FAO_df[ ,4]
<<<<<<< HEAD

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
=======
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
>>>>>>> b9a95bbb4d05ef4d29b87b5316bf68241072cb58

unique(FAO_df$Item)
unique(FAO_df$Element)
unique(FAO_df$Year)

<<<<<<< HEAD
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
=======

    #   Ejercicio: Elaboren una tabla que contenga los valores de los indices de produccion per capita neta por
    #               ganaderia en Centroamerica
    #               entre los periodos 2000-2005
>>>>>>> b9a95bbb4d05ef4d29b87b5316bf68241072cb58


ejercicio_1 <- FAO_df[(FAO_df$Area == "Belize" |
                          FAO_df$Area == "Costa Rica" |
                          FAO_df$Area == "El Salvador" |
                          FAO_df$Area == "Guatemala" |
                          FAO_df$Area == "Honduras" |
                          FAO_df$Area == "Nicaragua" |
                          FAO_df$Area == "Panama") &
                          FAO_df$Element == "Net per capita Production Index Number (2004-2006 = 100)" &
                          FAO_df$Item == "Livestock (PIN)" &
                          FAO_df$Year >= 2000 & FAO_df$Year < 2006, ]

ejercicio_1


        ##  SELECCION DE VARIABLES CON EL COMANDO "subset"

            ### Hacer un subset con la informacion de Mexico

names(FAO_df)

subset_1 <- subset(FAO_df, subset = Area == "Mexico", select = c("Area","Item","Value"))
    subset_1

subset_2 <- FAO_df[FAO_df$Area == "Mexico", c(4,8,12)]
    subset_2

subset_3 <- subset(FAO_df,
                   subset = 
                       (Area == "Belize" | 
                       Area == "Panama") & 
                       Element == "Net per capita Production Index Number (2004-2006 = 100)" &
                       Item == "Livestock (PIN)" &
                       Year >= 2000 & Year < 2006,
                   select = c("Area","Item","Value"))
subset_3



        ##  EJERCICIO 2: Calculen el valor promedio (cada cinco anios)
        ##  de la produccion neta por agricultura para Mexico y Colombia


# Paso 1) Seleccionar MEX y COL
# Paso 2) Seleccionar el rubro de agricultura
# Paso 3) Seleccionar la produccion neta
# Paso 4) Especificar los rangos de tiempo
# Paso 5) Seleccionar "Value"
# Paso 6) Calcular el promedio

unique(FAO_df$Item)
unique(FAO_df$Element)

agri_mc <- subset(FAO_df,
                  subset = (Area == "Mexico" | Area == "Colombia") & # Paso 1
                      Item == "Agriculture (PIN)" & # Paso 2
                      Element == "Net Production Index Number (2004-2006 = 100)" & # Paso 3
                      Year >= 2001 & Year < 2006, # Paso 4
                  select = c("Area","Value")) # Paso 5
agri_mc

write.csv(agri_mc, "agri_sna.csv", row.names = F)

aggregate(agri_mc$Value, by = list(agri_mc$Area), FUN = mean) # Paso 6





