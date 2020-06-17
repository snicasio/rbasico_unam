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


#subset con la información de México

names(FAO_df)

Subset_1<-subset(FAO_df,subset=Area=="Mexico",select=c("Area","Item","Value"))
sum(Subset_1$Value)

Subset_2<-FAO_df[FAO_df$Area=="Mexico",c(4,8,12)]
sum(Subset_2$Value)

Subset_3<-subset(FAO_df,subset=(Area=="Belize"|Area=="Panama")&
                   Element=="Net per capita Production Index Number (2004-2006 = 100)"&
                   Item=="Livestock (PIN)"&
                   Year>=2000 &Year<2006,
                 select=c("Area","Item","Value"))

sum(Subset_3$Value)

#Calcular valor promedio cada 5 años de producción neta 
#por agricultura
#para mexico y colombia
#Paso 1 Seleccionar Mex y Col
#Paso 2 Agricultura
#Paso 3 Producción neta
#Paso 4 Rangos de tiempo
#Paso 5 Seleccionar Paìs Value
#Paso 6 Calcular promedio


Agr2005<-subset(FAO_df,subset=(Area=="Mexico"|Area=="Colombia")& #Paso 1
                   Element=="Net Production Index Number (2004-2006 = 100)"& #Paso 3
                   Item=="Agriculture (PIN)"& #Paso 2
                   Year<=2005, #Paso 4
                 select=c("Area","Value")) #Paso 5
Agr2005
sum(Agr2005$Value)

Agr2010<-subset(FAO_df,subset=(Area=="Mexico"|Area=="Colombia")& #Paso 1
                  Element=="Net Production Index Number (2004-2006 = 100)"& #Paso 3
                  Item=="Agriculture (PIN)"& #Paso 2
                  Year>=2006&Year<=2010, #Paso 4
                select=c("Area","Value")) #Paso 5
Agr2010
sum(Agr2010$Value)

Agr2015<-subset(FAO_df,subset=(Area=="Mexico"|Area=="Colombia")& #Paso 1
                  Element=="Net Production Index Number (2004-2006 = 100)"& #Paso 3
                  Item=="Agriculture (PIN)"& #Paso 2
                  Year>=2011&Year<=2015, #Paso 4
                select=c("Area","Value")) #Paso 5
Agr2015
sum(Agr2015$Value)

aggregate(Agr2005$Value,by=list(Agr2005$Area),FUN=mean) #Paso 6 
aggregate(Agr2010$Value,by=list(Agr2010$Area),FUN=mean) #Paso 6 
aggregate(Agr2015$Value,by=list(Agr2015$Area),FUN=mean) #Paso 6 

write.csv(Agr,"ALB_Agr_2005.csv",row.names=F)

