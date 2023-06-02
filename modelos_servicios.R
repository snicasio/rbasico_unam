library(MuMIn)
library(ggplot2)
library(rpart)
library(rpart.plot)
library(raster)
library(rgdal)
library(rgeos)
library(ggfortify)
library(dplyr)

base <- read.csv("Div__Varia_Comp_Coord.csv")
#base <- base %>% filter(Cober!="PA") %>% filter(Cober!="VSH")
#hist(base$q0)
str(base)

base.q0 <- base[,c("q0",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]
#base.q0 <- base.q0[,-2:-5]
#cor(base[,c(-1:-14,-74,-79:-80)])


#cor(base[,grep("bio",names(base))])
#cor(base[,paste0("bio",1:19)][,-c(2:4,5,6,8,9,10,11,13:16,18,19)])
#cor(base[,paste0("prec",1:12)][,-c(1:3,5:8,10:12)])

mod.q0 <- glm(q0 ~ ., data=base.q0,na.action = "na.fail",family = "poisson")
drd.q0 <- dredge(mod.q0,beta="sd")

model.sel(get.models(drd.q0,subset = delta < 2),beta="sd")

tab.q0 <- coefTable(model.avg(get.models(drd.q0,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
tab.q0 <- data.frame(Var=rownames(tab.q0),tab.q0)
tab.q0 <- tab.q0[-1,-4]


ggplot(data = tab.q0, aes(x = Var, y = Estimate)) +
    expand_limits(y = c(-1,1)) +
    geom_bar(stat = "identity",
             color = "white",
             position = position_dodge()) +
    geom_hline(yintercept = 0) +
    geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                  width = 0.3,
                  position = position_dodge(0.9)) +
    labs(x = "Variables",
         y = "Coefficient") +
    theme_set(theme_classic()) +
    coord_flip()


    #   ARBOL DE REGRESION

base.q0 <- base[,c("q0",paste0("bio",c(1,17)),names(base[,c(71:73,77,78,80,81)]))]
    levels(base.q0$Cober) <- c(1,5,2,4,3)
    levels(base.q0$UGEO) <- 1:6
#    base.q0$Cober <- as.numeric(base.q0$Cober)


modtree.q0 <- glm(q0 ~ ., data=base.q0,na.action = "na.fail",family = "poisson")
summary(modtree.q0)
 
rpart(q0 ~ ., data=base.q0,minsplit=5,minbucket=3)
rpart.plot(rpart(q0 ~ ., data=base.q0,minsplit=5,minbucket=3))

final.q0 <- glm(q0 ~ ., base.q0[,c("q0","bio1","bio17","PEN","NDII","Cober")],na.action = "na.fail",family = "poisson")
summary(final.q0)
predict.glm(final.q0)

        #   MAPA

molde <- readOGR("Ext_capas.shp")
soil_vector <- readOGR("MDC_Soil_quality_and_30cm_properties.shp")



#UGEO <- soil_vector[,3]
#UGEO <- UGEO[UGEO$Unidades_G!="Karst depressions" & UGEO$Unidades_G!="Karst Lowhills of Sandstone-Claystone",]
#writeOGR(UGEO,dsn="UGEO.shp",layer="Unidades_G",driver="ESRI Shapefile")

#UGEO <- crop(readOGR("UGEO.shp"),molde)
#    levels(UGEO$Unidades_G) <- 1:6

#Cober <- crop(readOGR("Vegetacion_Uso_2017_5clases.shp"),molde)
#    Cober <- Cober[,2]
#    levels(Cober$clase) <- c(5,1,5,2,3,4)

#ELE <- mask(crop(raster("CEM_MdC_Montes.tif"),molde),molde)
#bio1 <- resample(mask(crop(raster("_bio1.tif"),molde),molde),ELE)
#bio7 <- resample(mask(crop(raster("_bio7.tif"),molde),molde),ELE)
#bio12 <- resample(mask(crop(raster("_bio12.tif"),molde),molde),ELE)
#bio17 <- resample(mask(crop(raster("_bio17.tif"),molde),molde),ELE)
#NDII <- resample(mask(crop(raster("NDII.tif"),molde),molde),ELE)
#PEN <- resample(mask(crop(raster("pendiente_MdC_Montes.tif"),molde),molde),ELE)
#NIP <- rasterize(crop(soil_vector[,13],molde),ELE)
#CC <- rasterize(crop(soil_vector[,"CC"],molde),ELE)

UGEO <- raster("UGEO.tif")
Cober <- raster("Coberturas.tif")
ELE <- raster("ELE.tif")
bio1 <- raster("bio1.tif")
bio7 <- raster("bio7.tif")
bio12 <- raster("bio12.tif")
bio17 <- raster("bio17.tif")
NDII <- raster("NDII_modelo.tif")
PEN <- raster("PEN.tif")
NIP <- raster("NIP.tif")
CC <- raster("CC.tif")

#UGEO <- rasterize(UGEO,ELE)
#Cober <- rasterize(Cober,ELE)

#writeRaster(ELE,"ELE.tif",format="GTiff",overwrite=T)
#writeRaster(UGEO,"UGEO.tif",format="GTiff",overwrite=T)
#writeRaster(PEN,"PEN.tif",format="GTiff",overwrite=T)
#writeRaster(NDII,"NDII_modelo.tif",format="GTiff",overwrite=T)
#writeRaster(NIP,"NIP.tif",format="GTiff",overwrite=T)
#writeRaster(CC,"CC.tif",format="GTiff",overwrite=T)
#writeRaster(bio1,"bio1.tif",format="GTiff",overwrite=T)
#writeRaster(bio7,"bio7.tif",format="GTiff",overwrite=T)
#writeRaster(bio12,"bio12.tif",format="GTiff",overwrite=T)
#writeRaster(bio17,"bio17.tif",format="GTiff",overwrite=T)

Col.mio <- colorRampPalette(c("blue", "yellow", "red"))

Capas.q0 <- stack(bio1,bio17,PEN,NDII,Cober)
    names(Capas.q0) <- c("bio1","bio17","PEN","NDII","Cober")

mapa.q0 <- predict(Capas.q0,final.q0,na.rm=T, progress='text')
plot(mapa.q0)


100*(1-(deviance(final.q0)/deviance(glm(q0 ~ 1, base.q0,na.action = "na.fail",family = "poisson"))))


mapa.puntos <- SpatialPointsDataFrame(coords=base[,c("X","Y")],data=data.frame(ID=base[,c("X","Y")]),proj4string = CRS(as.character(crs(mapa.q0))))


tab.val <- data.frame(Obs=as.numeric(base$q0),Cal=as.array(as.numeric(predict.glm(final.q0))))
plot(tab.val)



    #   q1

base.q1 <- base[,c("q1",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]

mod.q1 <- glm(q1 ~ ., data=base.q1,na.action = "na.fail",family = "gaussian")
drd.q1 <- dredge(mod.q1,beta="sd")

model.sel(get.models(drd.q1,subset = delta < 2),beta="sd")

tab.q1 <- coefTable(model.avg(get.models(drd.q1,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
tab.q1 <- data.frame(Var=rownames(tab.q1),tab.q1)
tab.q1 <- tab.q1[-1,-4]

ggplot(data = tab.q1, aes(x = Var, y = Estimate)) +
    expand_limits(y = c(-1,1)) +
    geom_bar(stat = "identity",
             color = "white",
             position = position_dodge()) +
    geom_hline(yintercept = 0) +
    geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                  width = 0.3,
                  position = position_dodge(0.9)) +
    labs(x = "Variables",
         y = "Coefficient") +
    theme_set(theme_classic()) +
    coord_flip()

base.q1 <- data.frame(base[,c("q1","bio1","bio7","bio17","ELE","PEN","NDII","NIP")],base[,80:81])
    levels(base.q1$Cober) <- c(1,5,2,4,3)
    levels(base.q1$UGEO) <- 1:6

modtree.q1 <- glm(q1 ~ ., data=base.q1,na.action = "na.fail",family = "poisson")
summary(modtree.q1)

rpart(q1 ~ ., data=base.q1,minsplit=5,minbucket=3)
rpart.plot(rpart(q1 ~ ., data=base.q1,minsplit=5,minbucket=3))

final.q1 <- glm(q1 ~ ., base.q1[,c("q1","NDII","Cober")],na.action = "na.fail",family = "gaussian")
    summary(final.q1)

Capas.q1 <- stack(NDII,Cober)
    names(Capas.q1) <- c("NDII","Cober")

mapa.q1 <- predict(Capas.q1,final.q1); plot(mapa.q1)
values(mapa.q1) <- ifelse(values(mapa.q1) <= 0,0,values(mapa.q1))

100*(1-(deviance(final.q1)/deviance(glm(q1 ~ 1, base.q1,na.action = "na.fail",family = "gaussian"))))


    #   q2

base.q2 <- base[,c("q2",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]

mod.q2 <- glm(q2 ~ ., data=base.q2,na.action = "na.fail",family = "gaussian")
drd.q2 <- dredge(mod.q2,beta="sd")

model.sel(get.models(drd.q2,subset = delta < 2),beta="sd")

tab.q2 <- coefTable(model.avg(get.models(drd.q2,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
tab.q2 <- data.frame(Var=rownames(tab.q2),tab.q2)
tab.q2 <- tab.q2[-1,-4]

ggplot(data = tab.q2, aes(x = Var, y = Estimate)) +
    expand_limits(y = c(-1,1)) +
    geom_bar(stat = "identity",
             color = "white",
             position = position_dodge()) +
    geom_hline(yintercept = 0) +
    geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                  width = 0.3,
                  position = position_dodge(0.9)) +
    labs(x = "Variables",
         y = "Coefficient") +
    theme_set(theme_classic()) +
    coord_flip()

base.q2 <- data.frame(base[,c("q2","bio1","bio7","bio17","ELE","PEN","NDII","NIP")],base[,80:81])
    levels(base.q2$Cober) <- c(1,5,2,4,3)
    levels(base.q2$UGEO) <- 1:6

modtree.q2 <- glm(q2 ~ ., data=base.q2,na.action = "na.fail",family = "poisson")
    summary(modtree.q2)

rpart(q2 ~ ., data=base.q2,minsplit=5,minbucket=3)
rpart.plot(rpart(q2 ~ ., data=base.q2,minsplit=5,minbucket=3))

final.q2 <- glm(q2 ~ ., base.q2[,c("q2","NDII","Cober")],na.action = "na.fail",family = "gaussian")
    summary(final.q2)

Capas.q2 <- stack(NDII,Cober)
    names(Capas.q2) <- c("NDII","Cober")

mapa.q2 <- predict(Capas.q2,final.q2); plot(mapa.q2)
values(mapa.q2) <- ifelse(values(mapa.q2) <= 0,0,values(mapa.q2))

100*(1-(deviance(final.q2)/deviance(glm(q2 ~ 1, base.q2,na.action = "na.fail",family = "gaussian"))))


    #   Shannon

base.H <- base[,c("H",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]
    
mod.H <- glm(H ~ ., data=base.H,na.action = "na.fail",family = "gaussian")
    drd.H <- dredge(mod.H,beta="sd")
    model.sel(get.models(drd.H,subset = delta < 2),beta="sd")
    
tab.H <- coefTable(model.avg(get.models(drd.H,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
    tab.H <- data.frame(Var=rownames(tab.H),tab.H)
    tab.H <- tab.H[-1,-4]
    
    ggplot(data = tab.H, aes(x = Var, y = Estimate)) +
        expand_limits(y = c(-1,1)) +
        geom_bar(stat = "identity",
                 color = "white",
                 position = position_dodge()) +
        geom_hline(yintercept = 0) +
        geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                      width = 0.3,
                      position = position_dodge(0.9)) +
        labs(x = "Variables",
             y = "Coefficient") +
        theme_set(theme_classic()) +
        coord_flip()
    
base.H <- data.frame(base[,c("H","bio1","bio7","bio17","ELE","PEN","NDII","NIP")],base[,80:81])
    levels(base.H$Cober) <- c(1,5,2,4,3)
    levels(base.H$UGEO) <- 1:6
    
modtree.H <- glm(H ~ ., data=base.H,na.action = "na.fail",family = "poisson")
    summary(modtree.H)
    
rpart(H ~ ., data=base.H,minsplit=5,minbucket=3)
    rpart.plot(rpart(H ~ ., data=base.H,minsplit=5,minbucket=3))

final.H <- glm(H ~ ., base.H[,c("H","NDII","Cober")],na.action = "na.fail",family = "gaussian")
    summary(final.H)
    
Capas.H <- stack(NDII,Cober)
    names(Capas.H) <- c("NDII","Cober")
    
mapa.H <- predict(Capas.H,final.H); plot(mapa.H, col = Col.mio(50))
values(mapa.H) <- ifelse(values(mapa.H) <= 0,0,values(mapa.H))
summary(values(mapa.H))
100*(1-(deviance(final.H)/deviance(glm(H ~ 1, base.H,na.action = "na.fail",family = "gaussian"))))


    #   Simpson
    
base.D <- base[,c("D",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]
    
mod.D <- glm(D ~ ., data=base.D,na.action = "na.fail",family = "gaussian")
    drd.D <- dredge(mod.D,beta="sd")
    model.sel(get.models(drd.D,subset = delta < 2),beta="sd")
    
tab.D <- coefTable(model.avg(get.models(drd.D,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
    tab.D <- data.frame(Var=rownames(tab.D),tab.D)
    tab.D <- tab.D[-1,-4]
    
    ggplot(data = tab.D, aes(x = Var, y = Estimate)) +
        expand_limits(y = c(-1,1)) +
        geom_bar(stat = "identity",
                 color = "white",
                 position = position_dodge()) +
        geom_hline(yintercept = 0) +
        geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                      width = 0.3,
                      position = position_dodge(0.9)) +
        labs(x = "Variables",
             y = "Coefficient") +
        theme_set(theme_classic()) +
        coord_flip()
    
base.D <- data.frame(base[,c("D","NDII","NIP")],base[,80:81])
    levels(base.D$Cober) <- c(1,5,2,4,3)
    levels(base.D$UGEO) <- 1:6
    
modtree.D <- glm(D ~ ., data=base.D,na.action = "na.fail",family = "poisson")
    summary(modtree.D)
    
rpart(D ~ ., data=base.D,minsplit=5,minbucket=3)
    rpart.plot(rpart(D ~ ., data=base.D,minsplit=5,minbucket=3))
    
final.D <- glm(D ~ ., base.D[,c("D","bio1","NDII","Cober")],na.action = "na.fail",family = "gaussian")
    summary(final.D)
    
Capas.D <- stack(bio1,NDII,Cober)
    names(Capas.D) <- c("bio1","NDII","Cober")
    
mapa.D <- predict(Capas.D,final.D); plot(mapa.D, col = Col.mio(50))
100*(1-(deviance(final.D)/deviance(glm(D ~ 1, base.D,na.action = "na.fail",family = "gaussian"))))


par(mfrow=c(2,2))
    plot(mapa.q1,main="q1", col = Col.mio(50))
    plot(mapa.q2,main="q2", col = Col.mio(50))
    plot(mapa.H,main="Shannon", col = Col.mio(50))
    plot(mapa.D,main="Simpson", col = Col.mio(50))




    #   ROC

library(pROC)
library(modEvA)

plotGLM(final.q0)

tab.valq1 <- round(data.frame(Obs=as.numeric(base$q1),Cal=as.array(as.numeric(predict.glm(final.q1)))))
plot(tab.valq1)
rocq1<-roc(tab.valq1$Obs, tab.valq1$Cal, smooth=TRUE)
plot(rocq1)
auc(rocq1)
coords(rocq1,tranpose=TRUE)
coords(rocq1,tranpose=FALSE)
rocq1<-plot.roc(tab.valq1$Obs, tab.valq1$Cal, main="q1", percent=TRUE, ci=TRUE, print.auc=TRUE)



    #   Shannon

base.H <- base[,c("H",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]

mod.H <- glm(H ~ ., data=base.H,na.action = "na.fail",family = "gaussian")
drd.H <- dredge(mod.H,beta="sd")
model.sel(get.models(drd.H,subset = delta < 2),beta="sd")

tab.H <- coefTable(model.avg(get.models(drd.H,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
tab.H <- data.frame(Var=rownames(tab.H),tab.H)
tab.H <- tab.H[-1,-4]

ggplot(data = tab.H, aes(x = Var, y = Estimate)) +
    expand_limits(y = c(-1,1)) +
    geom_bar(stat = "identity",
             color = "white",
             position = position_dodge()) +
    geom_hline(yintercept = 0) +
    geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                  width = 0.3,
                  position = position_dodge(0.9)) +
    labs(x = "Variables",
         y = "Coefficient") +
    theme_set(theme_classic()) +
    coord_flip()

base.H <- data.frame(base[,c("H","bio1","bio7","bio17","ELE","PEN","NDII","NIP")],base[,80:81])
levels(base.H$Cober) <- c(1,5,2,4,3)
levels(base.H$UGEO) <- 1:6

modtree.H <- glm(H ~ ., data=base.H,na.action = "na.fail",family = "poisson")
summary(modtree.H)

rpart(H ~ ., data=base.H,minsplit=5,minbucket=3)
rpart.plot(rpart(H ~ ., data=base.H,minsplit=5,minbucket=3))

final.H <- glm(H ~ ., base.H[,c("H","NDII","Cober")],na.action = "na.fail",family = "gaussian")
summary(final.H)

Capas.H <- stack(NDII,Cober)
names(Capas.H) <- c("NDII","Cober")

mapa.H <- predict(Capas.H,final.H); plot(mapa.H, col = Col.mio(50))
values(mapa.H) <- ifelse(values(mapa.H) <= 0,0,values(mapa.H))
summary(values(mapa.H))
100*(1-(deviance(final.H)/deviance(glm(H ~ 1, base.H,na.action = "na.fail",family = "gaussian"))))


#   Simpson

base.D <- base[,c("D",paste0("bio",c(1,7,12,17)),names(base[,c(71:73,76:79)]))]

mod.D <- glm(D ~ ., data=base.D,na.action = "na.fail",family = "gaussian")
drd.D <- dredge(mod.D,beta="sd")
model.sel(get.models(drd.D,subset = delta < 2),beta="sd")

tab.D <- coefTable(model.avg(get.models(drd.D,subset = cumsum(weight)<=0.95),beta = "sd",revised.var = T,adjusted = T))
tab.D <- data.frame(Var=rownames(tab.D),tab.D)
tab.D <- tab.D[-1,-4]

ggplot(data = tab.D, aes(x = Var, y = Estimate)) +
    expand_limits(y = c(-1,1)) +
    geom_bar(stat = "identity",
             color = "white",
             position = position_dodge()) +
    geom_hline(yintercept = 0) +
    geom_errorbar(aes(ymin = Estimate-Std..Error, ymax = Estimate+Std..Error),
                  width = 0.3,
                  position = position_dodge(0.9)) +
    labs(x = "Variables",
         y = "Coefficient") +
    theme_set(theme_classic()) +
    coord_flip()

base.D <- data.frame(base[,c("D","NDII","NIP")],base[,80:81])
levels(base.D$Cober) <- c(1,5,2,4,3)
levels(base.D$UGEO) <- 1:6

modtree.D <- glm(D ~ ., data=base.D,na.action = "na.fail",family = "poisson")
summary(modtree.D)

rpart(D ~ ., data=base.D,minsplit=5,minbucket=3)
rpart.plot(rpart(D ~ ., data=base.D,minsplit=5,minbucket=3))

final.D <- glm(D ~ ., base.D[,c("D","bio1","NDII","Cober")],na.action = "na.fail",family = "gaussian")
summary(final.D)

Capas.D <- stack(bio1,NDII,Cober)
names(Capas.D) <- c("bio1","NDII","Cober")

mapa.D <- predict(Capas.D,final.D); plot(mapa.D, col = Col.mio(50))
100*(1-(deviance(final.D)/deviance(glm(D ~ 1, base.D,na.action = "na.fail",family = "gaussian"))))
