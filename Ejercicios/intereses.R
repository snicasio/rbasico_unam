    #   EJERCICIO: TASAS DE INTERES

        ##  Certificado de inversion garantizada

tasa_menos <- 0.04  #   Tasa anual de interes (4%) en terminos de tres o menos anios
tasa_mas <- 0.05  #   Tasa anual de interes (5%) en terminos mayores a tres anios

inv_ini <- 1000 #   Inversion inicial

int_gen <- inv_ini*((1+tasa_menos)^3-1) #   Intereses generados


            ### Ahora calculemos los intereses generados para inversiones iniciales desde $500 hasta $20000 a un anio

tab_int <- data.frame(inv_ini = seq(500,20000,500), int_gen = rep(NA,40));tab_int #   Tabla de intereses generados
tab_int$int_gen <- tab_int$inv_ini*((1+tasa_menos)^3-1)
tab_int

plot(tab_int, pch = 16, type = "b")


            ### Ahora calculemos los intereses generados de uno a tres anios

anios <- matrix(rep(NA,120),ncol = 3, nrow = 40)
    colnames(anios) <- c("uno","dos","tres")
    anios <- as.data.frame(anios)

tab_int <- cbind(inv_ini = seq(500,20000,500), anios);tab_int
    for(i in 1:3){
        tab_int[,-1][,i] <- tab_int$inv_ini*((1+tasa_menos)^i-1)
    }
tab_int

plot(tab_int)

par(mfrow = c(1,3))
    plot(uno~inv_ini, data = tab_int)
    plot(dos~inv_ini, data = tab_int)
    plot(tres~inv_ini, data = tab_int)


par(mfrow = c(1,3))
    for(i in c("uno","dos","tres")){
        plot(tab_int[,c("inv_ini",i)])
    }


plot(tab_int[,c("inv_ini","tres")], type = "n")
    points(tab_int[,c("inv_ini","tres")], pch = 16, type = "b", col = "red", bg = "red")
    points(tab_int[,c("inv_ini","dos")], pch = 16, type = "b", col = "darkgreen", bg = "darkgreen")
    points(tab_int[,c("inv_ini","uno")], pch = 16, type = "b", col = "blue", bg = "blue")


plot(tab_int[,c("inv_ini","tres")], type = "n")
    abline(lm(uno~inv_ini, data = tab_int), lwd = 2, col = "blue")
    abline(lm(dos~inv_ini, data = tab_int), lwd = 2, col = "darkgreen")
    abline(lm(tres~inv_ini, data = tab_int), lwd = 2, col = "red")
legend("topleft", legend = c("Una","Dos","Tres"), lwd = 2, col = c("blue","darkgreen","red"), bty = "n")


            ### Ahora elaboren los intereses generados a 5, 10, 15 Y 20 anios



    #   EJERCICIO: FUNCION DE TASAS DE INTERES

        ##  Ahora vamos a elaborar nuestra primer funcion. Esta funcion podra elaborar el calculo a cualquier anualidad e inversion inicial

ig <- function(inversion, years){
    if(years <= 3){
        varo <- inversion*((1+0.04)^years-1)
    }else{
        varo <- inversion*((1+0.05)^years-1)
    }
    return(varo)
}

ig(inversion = 500,years = 2)
