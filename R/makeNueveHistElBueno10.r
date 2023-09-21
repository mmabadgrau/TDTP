

rm(list=ls())

foo <- getOption("X11fonts")
foo[1] <- "-urw-nimbus sans l-%s-%s-*-*-%d-*-*-*-*-*-*-*"
options(X11fonts=foo)

dir<-"../results/simulations/TypeIRec0.5/" 

# Para size = 2

# Leer una Fila de tam + 1 valores, el primero es una cabecera

dataSource1<-"TypeIError_MAF"
dataSource2<-"mixProp"
dataSource3<-"_Size500_AlsoHomo_shuffled_resultsForTestModeTraining_SWOfSize2AndOffsetOf1_mTDTP"

nf <- 9
#tam <- 1000
ficheros <- c(1:nf)

#definir parámetros
MAF <-c("0.1", "0.3", "0.5")
mixProp <-c("0.5", "0.75", "0.833")

# definir intervalos
breaks <- c(0, 0.001, 0.002, 0.003, 0.004, 0.005, 0.006, 0.007, 0.008, 0.009, 0.01)

#obtengo el nombre de cada fichero
c <- 1
for (i in 1:3){
 for (j in 1:3){

  ficheros[c] <- paste(dir, dataSource1, MAF[i], dataSource2, mixProp[j], dataSource3, sep="")
  c <- c+1
}
} 


# para generar 3*3 histogramas
par(mfcol=c(3,3))

h<-1

f <- 1
for (i in 1:3){
 for (j in 1:3){

#leo los valores p y los meto para cada fichero

data=read.table(paste(ficheros[f], ".pVal", sep=""), header=TRUE)
f <- f+1

# Descartar los valores p mayores de 0,01 

tam <- length(data[,1])

valoresPSmall<-c(1:tam)

c <- 1

for (p in 1:tam)
{
  if (data[p,1]<=0.01) {
    valoresPSmall[c]<-data [p,1]
    c <- c+1
  }
}

#Me quedo con un vecor del tamaño que necesito para el subconjunto de valores p que cumplen la condicion

l <- 1
while(valoresPSmall[l]!=l) {l<-l+1}

long <- l-1

valoresP <- c(1:long)

for (p in 1:long) valoresP[p] <- valoresPSmall[p]
 
# Crear el Histograma


# histograma con frecuencias absolutas (para relativa poner freq=FALSE)

hist (valoresP,breaks,freq=TRUE,main=paste("MAF=",MAF[i]," pp=", mixProp[j], sep=""), ylab='sample count', xlab = 'p values', ylim=c(0,30))   
if (h==7) legend("topright", "500 trios, 7537 simulations", bty="n")
h<-h+1
}


}
 
