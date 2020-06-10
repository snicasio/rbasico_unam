#ALfredo Luna Bonilla
#ALfredo Luna Bonilla    #   EJERCICIOS DE OPERADORES Y OBJETOS EN R

##  Los datos empleados proceden de la pagina de FAOSTATS (http://www.fao.org/faostat/en/#data/QI/metadata)

require(tibble)
require(readr)

FAO_df <- read.csv("FAO.csv")   #   data.frame
FAO_tb <- read_csv("FAO.csv")   #   tibble

typeof(FAO_df)
typeof(FAO_tb)

str(FAO_df)
str(FAO_tb)

typeof(FAO_tb$Area)
aggregate(FAO_df$Value,list(FAO_df$Area),mean)
aggregate(FAO_df$Value,list(FAO_df$Element),mean)


MX1<-FAO_df[FAO_df$Area=="Mexico"&FAO_df$Year==2016,]
MX2<-FAO_df[FAO_df$Area=="Mexico"|FAO_df$Year==2016,] ;MX2
sum(MX1$Value)

#formato fecha hora
str(Sys.time())
unclass(Sys.time())
levels(FAO_df$Element)
fecha_nac<-as.Date("1977-07-09");fecha_nac
attributes(fecha_nac)
attributes(FAO_df$Area)

fechas<-FAO_df$Year;fechas
fechas<-unique(fechas);fechas
