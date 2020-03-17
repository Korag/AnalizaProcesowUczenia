#£ukasz Czepielik 051392
#APU Laboratorium 5
#Wariant: 6

#Zadanie2
install.packages("mlr")
install.packages("rFerns")
install.packages("randomForestSRC")
library("mlr")
library("rFerns")
library("randomForestSRC")

setwd("C:/R_Directory/£ukaszCzepielik_apu_sprawozdanie5/")
pralki <- read.csv("£ukaszCzepielik_apu_sprawozdanie5.2_csv.csv")

pralki$oceny_klientów <- factor(pralki$oceny_klientów)

zadanie =
  makeClassifTask(id = deparse(substitute(pralki)), pralki, "oceny_klientów",
                  weights = NULL, blocking = NULL, coordinates = NULL,
                  positive = NA_character_, fixup.data = "warn", check.data = TRUE)

ponowne_probkowanie = makeResampleDesc(method = "CV", iters = 2, stratify = TRUE)

metody_uczenia <- makeLearners(c("rpart", "C50","rFerns",
                                 "randomForestSRC", "lda"), type = "classif")

porownanie_metod_uczenia <- benchmark(learners = metody_uczenia,
                                      tasks = zadanie,
                                      resampling = ponowne_probkowanie)
