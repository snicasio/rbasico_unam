#   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)
#Ejercicio Alfredo Luna
#require(tibble)
#require(readr)

FAO_df <- read.csv("FAO.csv") 

sum(FAO_df$Value)

Ejercicio_1 <-FAO_df[(FAO_df$Area=="Belize"|
                       FAO_df$Area=="Costa Rica"|
                       FAO_df$Area=="Panama"|
                       FAO_df$Area=="Honduras"|
                       FAO_df$Area=="El Salvador"|
                       FAO_df$Area=="Nicaragua")&
                       FAO_df$Element=="Net per capita Production Index Number (2004-2006 = 100)"&
                       FAO_df$Item=="Livestock (PIN)"&FAO_df$Year<=2005,]
print(Ejercicio_1)                     

sum(Ejercicio_1$Value)
