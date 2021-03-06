#Łukasz Czepielik 051392
#APU Laboratorium 4
#Wariant: 6

install.packages("C50")
library("C50")

setwd("C:/R_Directory/ŁukaszCzepielik_apu_sprawozdanie4/")

pralki <- read.csv("ŁukaszCzepielik_apu_sprawozdanie4_csv.csv")
summary(pralki)

pralki$oceny_klientów <- factor(pralki$oceny_klientów)
pralki

drzewo <- C5.0.default(x=pralki[,-7], y=pralki$oceny_klientów)

summary(drzewo)
drzewo
plot(drzewo)

