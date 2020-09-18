
    #   EJERCICIO DE INTRODUCCION: OBJETOS, VECTORES Y TABLAS

        #   OBJETOS

a <- 1  #   Esto genera un objeto que contiene el numero uno
b <- 2  #   Esto genera un objeto que contiene el numero dos
c <- 3  #   Esto genera un objeto que contiene el numero tres
d <- 4  #   Esto genera un objeto que contiene el numero cuatro


            #   Vamos a desplegar sus valores
a
b
c
d


            #   Los objetos numericos pueden estar sujetos a operaciones. Elaboremos un objeto que contenga el producto de los objetos "c" y "d"

Objeto.1 <- c*d
c*d


        #   VECTORES

            #   Podemos elaborar vectores de una dimension con el comando concatenar "c()"

Vec <- c(1,2,3,4)


            #   Estos vectores tambien estan sujetos a las operaciones con otros objetos, por ejemplo una multiplicacion

Vec*d


            #   A estas alturas ya generamos muchos objetos y a veces podemos olvidar cuantos llevamos. Podemos invocar una lista de los objetos generados con el comando "ls()"

ls()    #   Esto ayuda mucho cuando ya llevas un rato elaborando objetos :)


        #   OPERACIONES

            #   Esta seccion es para que recuerden que R se rige bajo la jerarquia de las operaciones

Vec2 <- Vec*b+c; Vec2   #  Primero multiplica y luego suma
Vec3 <- Vec+b*c; Vec3   #  Primero multiplica y luego suma. Los resultados son diferentes por el cambio de signo. Recuerden esto para futuras operaciones

            #   Nota: El punto y coma (;) tiene la funcion de terminar una linea de instrucciones y comenzar otra. Es como si pusieran un punto y aparte


        #   TABLAS

            #   Ya sabemos que es un objeto y un vector de una dimension. Ahora vamos a elaborar un objeto de dos dimensiones, lo que vienen siendo una tabla o "data.frame()"

Tab1 <- data.frame(Vec); Tab1   #  ?Ven como cambio el arreglo de los numeros?, vamos a ver cuantas dimensiones tiene este vector con el comando "str()"
    str(Tab1)   #   Segun los resultados de este comando, el objeto es un data frame con cuatro observaciones (filas) y una variable (columnas)
    str(Vec)    #   En contraste, la estructura de un vector con una dimension solo consta de sus valores


            #  Elaboremos una tabla con mas columnas    

Tab2 <- data.frame(Vec, Vec2, Vec3); Tab2
    str(Tab2)   #   Si exploramos su estructura, vamos a notar que el numero de variables aumento


            #   Cuando elaboramos un data frame con un objeto que contiene un solo valor, este se repetira de acuerdo al numero de elementos que tenga el vector con el cual se va a vincular

Tab3 <- data.frame(Vec, a)
    Tab3    #   ?Ven a lo que me refiero?


        #   LISTAS
    
            #   Una lista es una cajonera donde podemos almacenar objetos de dinstinta indole en cada cajon

Lista1 <- list(a, b, c ,d, Vec, Vec2, Vec3, Tab1, Tab2, Tab3); Lista1   #   Al explorar esta lista, podemos observar que cada seccion contiene almacenada la informacion de cada objeto


    #   EJERCICIO DE LECTURA Y MANEJO DE INFORMACION EXTERNA

        #   PRIMER PASO: ESTABLECIMIENTO DE DIRECTORIO DE TRABAJO Y LECTURA DE ARCHIVOS

            #   Para no complicarnos la vida, recuerden guardar su script y archivos a trabajar en una misma carpeta. Cuando abran este archivo, solo tienen que ir al menu "Session>Set working directory>To source file location" para que establezcan el directorio de trabajo donde tienen guardados todos sus archivos. Esto les ahorrara muchas horas de frustracion

            #   Una vez establecido el directorio de trabajo, revisen su contenido con el comando "dir()"

dir()   #   Observaran los archivo que contiene su carpeta de trabajo


            #   Ahora carguemos el archivo que deje en la carpeta de Drive y lo guardaremos en el objeto "Nut" (con letra "t" por favor)

Nut <- read.csv("nndb_flat.csv", header = TRUE) #   El nombre del archivo (con todo y terminacion) siempre ira entre comillas. El argumento "header" es para indicar si la primer fila corresponde a los encabezados de cada columna (solo hay dos alternativas: TRUE o FALSE)
    str(Nut)    #   Vean su estructura, esta enorme y es dificil de leer
    
    
        #   SEGUNDO PASO: VISUALIZACION DE TABLA Y NOMBRES DE COLUMNAS

            #   Vamos a visualizar solo una parte de la tabla con los comandos "head()" y "tail()". Tambien podemos ver los nombres (y la posicion) de cada columna con el comando "names()"
    
head(Nut)   #   Observo las primeras seis filas
tail(Nut)   #   Observo las ultimas seis filas
names(Nut)  #   Esto me muestra los nombres de cada columna
    

        #   TERCER PASO: SELECCION DE FILAS/COLUMNAS

            #   Podemos seleccionar secciones de la tabla de dos formas:

Nut$FoodGroup   #  Lo llamo por su nombre
Nut[ ,2]    #  Lo llamo por su ubicacion


            #   La ubicacion esta dada por el numero de fila/columna que quiero observar dentro de estos corchetes [ , ] Los valores antes de la coma corresponden al valor de la fila y despues de la coma a los de la columna. Si no se anota ningun numero, se seleccionan todas las filas/columnas

Nut[50, ]   #   Observo los valores de la fila 50
Nut[ ,10]   #   Observo los valores de la columna 10


            #   Tambien puedo seleccionar multiples filas/columnas con el comando "c()"

Nut[c(50,1000,2500), ]   #   Observo los valores de las fila 50, 1000 y 2500
Nut[c(50,1000,2500), c(2,10,20)]   #   Observo los valores de las fila 50, 1000 y 2500 y las columnas 2, 10 y 20


            #   Esto me permite crear objetos nuevos con la seleccion de observaciones y variables de mi interes

Nt1 <- Nut[c(50,1000,2500), c(2,10,20)]; Nt1    #   El ojeto "Nt1" contiene solamente tres filas y tres columnas, podemos verificarlo al revisar su estructura:
    str(Nt1)    #   Esto les permitira manejar bases muy grandes con mayor facilidad


        #   CUARTO PASO: SELECCIONAR FILAS/COLUMNAS CON ARGUMENTOS ESPECIFICOS

            #   ?Como puedo seleccionar los alimentos que contienen menos de 5 gramos de azucar por porcion?
    
Light.sugar <- Nut[Nut$Sugar_g < 5, ]
    head(Light.sugar)
    Light.sugar$Sugar_g
    min(Light.sugar$Sugar_g)
    max(Light.sugar$Sugar_g)
    str(Light.sugar)
    nrow(Light.sugar)

    
    
            #   ?Como puedo seleccionar los alimentos que contienen menos de 5 gramos de grasa por porcion?
    
Light.fat <- Nut[Nut$Fat_g < 5, ]
    Light.fat


            #   Ahora veamos una tabla con alimentos bajos en azucares, carbohidratos y grasas:

Light.food <- Nut[Nut$Carb_g < 5 & Nut$Fat_g < 5 & Nut$Sugar_g < 5, ]
    Light.food
    nrow(Light.food)


            #   Ahora veamos una tabla con alimentos bajos en lo anterior y con mucha proteina:

Muscle.food <- Nut[Nut$Carb_g < 5 & Nut$Fat_g < 5 & Nut$Sugar_g < 5 & Nut$Protein_g >= 10, ]
    Muscle.food
    nrow(Muscle.food)
    
Quesos <- as.character(Muscle.food$Descrip[1:5])
    grep("lowfat", Quesos)
    Quesos[grep("lowfat", Quesos)]

    grep("Legumes", as.character(Muscle.food$FoodGroup))

Muscle.food[grep("Legumes & Egg", as.character(Muscle.food$FoodGroup)), ]

            #   Esto lo exploraremos con mas calma el viernes...

grep("Products", as.character(Muscle.food$FoodGroup))




Muscle.food[grep("Game|Products", as.character(Muscle.food$FoodGroup)), c(1:2)]




Carne <- Nut[grep("Beef|Lamb|Pork", as.character(Nut$FoodGroup)), ]
    Carne <- Carne[Carne$Protein_g > 5 & Carne$Protein_g <= 7, ]
    nrow(Carne)
    Carne[ ,c(1:3)]
    summary(Carne)
    summary(Nut)


    
    
    
nrow(Nut[Nut$Protein_g > 5 | Nut$Protein_g <= 7, ])
nrow(Nut[Nut$Protein_g > 5 & Nut$Protein_g <= 7, ])


    #   EJERCICIO PARA ENTREGAR: A partir de lo repasado en estos ejercicios, utiliza la base "Nut" para elaborar una dieta baja en azucares y grasas que no sea mayor a las 1850 kilocalorias por dia. El menu debe contemplar desayuno, comida y cena.
    #   Guarden sus resultados en un objeto nuevo y exporten como archivo *.csv
    #   EL nombre del archivo sera "menu_" y sus iniciales (en minusculas, por favor). Ejemplo: "menu_sna.csv" (mis iniciales) y lo enviaran a mi correo
    #   Ejemplo de como exportar un resultado:

menu_1 <- Nut[Nut$Fat_g < 5 & Nut$Sugar_g < 5 & Nut$Energy_kcal >= 15, ]
unique(menu_1$FoodGroup)
    menu_1[ ,c("Descrip","Energy_kcal")]

holi <- subset(menu_1,
               FoodGroup=="Dairy and Egg Products" |
                   FoodGroup=="Breakfast Cereals" |
                   FoodGroup=="Fruits and Fruit Juices" |
                   FoodGroup=="Vegetables and Vegetable Products" |
                   FoodGroup=="Spices and Herbs" |
                   FoodGroup=="Nopales, cooked, without salt" |
                   FoodGroup=="Nut and Seed Products",
               select = c("Descrip","Energy_kcal"))

unique(holi$Descrip)
good = subset(holi,
              Descrip=="Milk, dry, nonfat, calcium reduced" |
                  Descrip=="Seeds, lotus seeds, dried" |
                  Descrip=="Egg, white, dried, powder, stabilized, glucose reduced" |
                  Descrip=="Raisins, seeded" |
                  Descrip=="Fish, cod, Atlantic, dried and salted" |
                  Descrip=="Fireweed, leaves, raw" |
                  Descrip=="Nopales, cooked, without salt" |
                  Descrip=="Nuts, chestnuts, european, dried, unpeeled")

sum(good[,2])   #   Son las 1850 Kcal

good # Este es el resultado que deben obtener.


        #   Ahora si, vamos a exportar el resultado:

write.csv(good, "menu_janc.csv", row.names = F)



