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
names(FAO_df)
FAO_df[,4]
FAO_df[4,12]
FAO_df[,c(4,12)]
tabla_uno<-FAO_df[c(20,5000),c(4,12)];tabla_uno

tabla_dos<-FAO_df[c(1:20,5000:5200),c(4,12)];tabla_uno
str(tabla_dos)

tabla_tres<-FAO_df[FAO_df$Area=="Mexico",];tabla_tres

unique(FAO_df$Area)

tabla_tresb<-FAO_df[FAO_df$Area=="Canada",];tabla_tresb



tabla_cuatro<-FAO_df[FAO_df$Area=="Mexico"| FAO_df$Area=="Canada",c(4,12)]; tabla_cuatro

unique(FAO_df$Item)
unique(FAO_df$Element)
unique(FAO_df$Year)

#Elaborar tabla que contenga indices de produccion percapita neta por ganaderia 
#entre los paises en centroamerica 
#2000 a 2005

Ganado<-FAO_df[FAO_df$Item=="Livestock (PIN)"& 
                 FAO_df$Element.Code=="438"&
                 FAO_df$Year<=2005&
                 FAO_df$Area%in%c("Nicaragua","Panama","Honduras","Belize","Costa Rica","El Salvador")
               ,]
sum(Ganado$Value)               


