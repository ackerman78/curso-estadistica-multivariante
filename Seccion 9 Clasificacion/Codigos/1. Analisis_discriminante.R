##################################################################################################################
##################################################################################################################
# An�lisis discriminante lineal LDA
##################################################################################################################
##################################################################################################################
##################################################################################################################
# Cargar librer�a MASS
##################################################################################################################

library(MASS)

##################################################################################################################
# Cargar los datos Iris
##################################################################################################################

Z <- as.data.frame(iris)
Z

##################################################################################################################
# Definir la matriz de datos y la variable respuesta con las clasificaciones 
##################################################################################################################

X <- Z[,1:4]
X

y <- Z[,5]
y

##################################################################################################################
# Definir como n y p el n�mero de flores y el n�mero de variables
##################################################################################################################

n <- nrow(X)
n
p <- ncol(X)
p



# LDA leave-one-out cross validation

lda.iris <- lda(y ~ .,data=X,CV=TRUE)

# lda.iris$class contiene las clasificaciones hechas por CV usando LDA 

lda.iris$class

# Tabla con clasificaciones buenas y malas

table.lda <- table(y,lda.iris$class)
table.lda

# Proporci�n de errores

mis.lda <- n - sum(y==lda.iris$class)
mis.lda/n

# Buenas clasificaciones en rojo, malas en negro 

col.lda.iris <- c("black","indianred1")[1*(y==lda.iris$class)+1]
pairs(X,main="Good (in red) and bad (in black) classifications for the Iris data set with LDA",pch=19,col=col.lda.iris)

# lda.iris$posterior son las probabilidades de pertenencia a uno de los tres grupos

lda.iris$posterior

# Gr�fico de probabilidades

plot(1:n,lda.iris$posterior[,1],main="Posterior probabilities (blue, group 1, green, group 2 and orange, group 3)",pch=20,col="blue",
     xlab="Observation number",ylab="Probabilities")
points(1:n,lda.iris$posterior[,2],pch=20,col="green")
points(1:n,lda.iris$posterior[,3],pch=20,col="orange")



##################################################################################################################
##################################################################################################################
# An�lisis discriminante cuadr�tico QDA
##################################################################################################################
##################################################################################################################

# QDA con leave-one-out cross validation

qda.iris <- qda(y ~ .,data=X,CV=TRUE)

# qda.iris$class contiene las clasificaciones hechas por CV usando QDA

qda.iris$class

# Tabla con clasificaciones buenas y malas

table.qda <- table(y,qda.iris$class)
table.qda

# Proporci�n de errores

mis.qda <- n - sum(y==qda.iris$class)
mis.qda/n

# Buenas clasificaciones en rojo, malas en negro 

col.qda.iris <- c("black","indianred1")[1*(y==qda.iris$class)+1]
pairs(X,main="Good (in red) and bad (in black) classifications for the Iris data set with QDC",pch=19,col=col.qda.iris)

# qda.iris$posterior son las probabilidades de pertenencia a uno de los tres grupos

qda.iris$posterior

# Gr�fico de probabilidades

plot(1:n,qda.iris$posterior[,1],main="Posterior probabilities (blue, group 1, green, group 2 and orange, group 3)",pch=20,col="blue",
     xlab="Observation number",ylab="Probabilities")
points(1:n,qda.iris$posterior[,2],pch=20,col="green")
points(1:n,qda.iris$posterior[,3],pch=20,col="orange")


