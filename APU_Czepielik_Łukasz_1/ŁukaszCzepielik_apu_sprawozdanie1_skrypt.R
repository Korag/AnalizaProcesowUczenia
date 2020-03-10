#Łukasz Czepielik 051392
#APU Laboratorium 1
#Wariant: 6

#zad.a)
a <- 20*log10(100)
b <- a*a*a

a
b

min(a,b)

#zad.b)
help("sqrt")

#zad.c)
vector <- 80:105
vector

suma <- sum(vector^2)
suma

#zad.d)
apropos("round", mode = "function")

#zad.e)
setwd("C:/R_Directory")

var <- "pralka"
save(var, file = "ŁukaszCzepielik_apu_sprawozdanie1_plik.txt")

remove(var)
var

load("ŁukaszCzepielik_apu_sprawozdanie1_plik.txt")
var

#zad.f)
install.packages("gridExtra")
library("gridExtra")

help(package = "gridExtra")
grid.table(head(trees, n = 10))

#zad.g)
vector2 <- seq(1400, 1200, -5)
vector2

#zad.h)
vector3 <- 15:3
vector4 <- 24:53

vector43 <- c(vector4, vector3)
vector43

#zad.i)
nazwa <- c("Whirlpool FWG71283BV PL", "Electrolux EW6S326SPI PerfectCare", "Bosch WAN2826EPL Serie 4 VarioPerfect",
           "Samsung AddWash WW80K5210UW", "Beko EWTV6636XAW", "Bosch WAE2026EPL Serie 2 VarioPerfect",
           "Bosch WLT24460PL Serie 6 VarioPerfect", "Samsung AddWash Slim WW60K42109W", "Bosch WAN2406EPL Serie 4 VarioPerfect",
           "Samsung WF60F4EFW2W", "Beko WRE5511BWW", "Electrolux EW7F348SP PerfectCare",
           "Samsung WW70J5446FW","Indesit IWSC 51052 C ECO PL", "Bosch WAB20264PL Serie 2 VarioPerfect")
pojemność <- c(7, 6, 8, 8, 
               6, 7, 6.5, 6, 
               7, 6, 5, 8,
               7, 5, 6)
prędkość_wirowania <- c(1200, 1200, 1400, 1200, 
                        1200, 1000, 1200, 1200, 
                        1200, 1200, 1000, 1400, 
                        1400, 1000, 100)
cena <- c(1399, 1549, 1499, 2099,
          1299, 999, 1699, 1799,
          1349, 1349, 899, 2099,
          1599, 799, 1149)
liczba_opini <- c(24, 98, 223, 78,
                  18, 238, 633, 138,
                  153, 283, 17, 59, 
                  296, 647, 305)

pralki <- data.frame(nazwa, pojemność, prędkość_wirowania, cena, liczba_opini, stringsAsFactors = FALSE)
pralki

mean(pralki$cena)

#zad.j)

nowa_pralka <- data.frame(nazwa = "Sharp ES-HFA6103W3", pojemność = 6, prędkość_wirowania = 1000, 
                          cena = 799, liczba_opini = 117)
nowa_pralka

pralki <- rbind(pralki, nowa_pralka)
pralki

mean(pralki$cena)

#zad.k)
oceny_klientów <- factor(c(5, 5, 5, 5,
                          4.5, 5, 5, 5,
                          5, 5, 4.5, 5,
                          5, 5, 5, 5))
oceny_klientów

pralki <- cbind(pralki, oceny_klientów)
pralki

tapply(pralki$cena, pralki$oceny_klientów, mean)

#zad.l)
nowe_nazwy <- c("Amica DAW 6103 LSW", "Whirlpool EFWSG71283BVPL",
                "Bosch WAB24264PL Serie 2 VarioPerfect", "Indesit BWSA 61253 W EU")
nowe_pojemności <- c(6, 7, 6, 6)
nowe_prędkości_wirowania <- c(1000, 1200, 1200, 1200)
nowe_ceny <- c(1099, 1449, 1149, 949)
nowe_liczby_opini <- c(180, 57, 268, 107) 
nowe_oceny_klientów <- factor(c(5, 5, 5, 5))

nowe_pralki <- data.frame(nazwa = nowe_nazwy, pojemność = nowe_pojemności,
                          prędkość_wirowania = nowe_prędkości_wirowania, cena = nowe_ceny,
                          liczba_opini = nowe_liczby_opini, oceny_klientów = nowe_oceny_klientów)

pralki <- rbind(pralki, nowe_pralki)
pralki

statystyki_ocen <- table(pralki$oceny_klientów)
statystyki_ocen

barplot(statystyki_ocen)

#zad.m)
tabela_ocen <- table(pralki$oceny_klientów)
wskaźnik_procentowy <- tabela_ocen / sum(tabela_ocen)

tabela_ocen 
wskaźnik_procentowy

pie(wskaźnik_procentowy)

install.packages("plotrix")
library(plotrix)

fan.plot(tabela_ocen, labels = names(tabela_ocen))

#zad.n)
pralki$status_opinii[pralki$liczba_opini > 100] <- "więcej 100 opinii"
pralki$status_opinii[pralki$liczba_opini > 50 & pralki$liczba_opini < 100] <- "50-100 opinii"
pralki$status_opinii[pralki$liczba_opini < 50] <- "mniej 50 opinii"
pralki$status_opinii[pralki$liczba_opini == 0] <- "nie ma"

pralki

pralki$status_opinii <- factor(pralki$status_opinii)
pie(table(pralki$status_opinii))

#zad.o)
paste(pralki$nazwa, " ma ocenę klientów ", pralki$oceny_klientów, " bo ma liczbę opinii ", pralki$liczba_opini)

#zad.p)
write.csv(pralki,'ŁukaszCzepielik_apu_sprawozdanie1_csv.csv')

readFromCSV <- read.csv("ŁukaszCzepielik_apu_sprawozdanie1_csv.csv")
readFromCSV