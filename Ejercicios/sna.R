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