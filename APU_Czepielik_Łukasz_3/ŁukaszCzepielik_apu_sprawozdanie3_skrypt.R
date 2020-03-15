#£ukasz Czepielik 051392
#APU Laboratorium 3
#Wariant: 6

#Zadanie1
install.packages("neuralnet")
library("neuralnet")

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

argument <-as.data.frame(runif(100, min = 1, max = 3))
wynik_funkcji <- cos(argument^2)

argument
wynik_funkcji

zeskalowane.argument <- as.data.frame(lapply(argument, normalize))
zeskalowane.argument

dane_treningowe <- cbind(zeskalowane.argument, wynik_funkcji)
colnames(dane_treningowe) <- c("Argument", "Wynik_funkcji")

net.price <- neuralnet(Wynik_funkcji~Argument, dane_treningowe, hidden = c(3, 2), threshold = 0.01)

plot(net.price)

#Zadanie2
setwd("C:/R_Directory/£ukaszCzepielik_apu_sprawozdanie3/")
pralki <- read.csv("£ukaszCzepielik_apu_sprawozdanie3_csv.csv")

cena <- normalize(pralki$cena)
cena

pralki <- pralki[,-5]
pralki <- pralki[,-1]
pralki

pralki[,2:5] <- as.data.frame(lapply(pralki[,2:5], normalize))

pralki <- cbind(pralki, cena)
pralki

net.price <- neuralnet(cena~pojemno¶æ+prêdko¶æ_wirowania+liczba_opini+oceny_klientów,
                       pralki, hidden = c(5,3,3), threshold = 0.01)

plot(net.price)
