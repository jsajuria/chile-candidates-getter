library(jsonlite)
library(dplyr)
setwd("")

#Distritos
D01 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6001.json"
D02 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6002.json"
D03 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6003.json"
D04 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6004.json"
D05 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6005.json"
D06 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6006.json"
D07 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6007.json"
D08 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6008.json"
D09 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6009.json"
D10 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6010.json"
D11 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6011.json"
D12 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6012.json"
D13 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6013.json"
D14 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6014.json"
D15 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6015.json"
D16 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6016.json"
D17 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6017.json"
D18 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6018.json"
D19 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6019.json"
D20 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6020.json"
D21 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6021.json"
D22 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6022.json"
D23 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6023.json"
D24 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6024.json"
D25 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6025.json"
D26 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6026.json"
D27 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6027.json"
D28 <- "http://servelelecciones.cl/data/elecciones_diputados/computo/distritos/6028.json"

#Circunscripciones
C01 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5001.json"
C02 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5002.json"
C04 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5004.json"
C06 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5006.json"
C09 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5009.json"
C11 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5011.json"
C14 <- "http://servelelecciones.cl/data/elecciones_senadores/computo/circ_senatorial/5014.json"

#Presidencial
P01 <- "http://servelelecciones.cl/data/elecciones_presidente/computo/global/19001.json"
path_diputados=c(D01,D02,D03,D04,D05,D06,D07,D08,D09,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,
	D21,D22,D23,D24,D25,D26,D27,D28)

data_distritos <-list()
for (g in 1:28){
	data_distritos[[g]]<- fromJSON(path_diputados[g])
}


#sd1;	(1) Independientes
#		(2) es Frente Amplio
#		(3) es Fuerza de la Mayoría
#		(4) es Convergencia Democrática
#		(5) es Chile Vamos
#sd2; 	Partidos dentro de pactos.

lista <- list()
k <- 1
for (f in 1:28){
	larguito=nrow(data_distritos[[f]]$data)
	for (j in 1:larguito) {
		largo=nrow(data_distritos[[f]]$data$sd[[j]])
		for (i in 1:largo) {

			 lista[[k]]<-(data_distritos[[f]]$data$sd[[j]]$sd[[i]])
			 k<-k+1
		}
	}
}
lista_desarmada <- plyr::ldply(lista, data.frame)##Desarmar la lista

write.csv(lista_desarmada,"prueba.csv")
