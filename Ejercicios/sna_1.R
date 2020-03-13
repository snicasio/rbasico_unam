#Sergio Nicasio

#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

require(tibble)
library(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble


    # Ejemplo lista

lista_ejemplo <- list()

typeof(lista_ejemplo)
lista_ejemplo

lista_ejemplo[[1]] <- list(1:100)
lista_ejemplo[[2]] <- list(3.16,3e-2)
lista_ejemplo[[3]] <- list("Checa", "este", "texto")

lista_ejemplo

    # Lista anidada

lista_anidada_1 <- list(rep(list(list()),5))
lista_anidada_1

lista_anidada_2 <- rep(list(rep(list(list()),5)),3)
lista_anidada_2



FAO_df
FAO_tb

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)