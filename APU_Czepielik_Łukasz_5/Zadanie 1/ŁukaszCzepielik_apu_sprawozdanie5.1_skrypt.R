#£ukasz Czepielik 051392
#APU Laboratorium 5
#Wariant: 6

#Zadanie1
install.packages("C50")
install.packages("MASS")
library("C50")
library("MASS")

data(biopsy)
head(biopsy)

drzewoDecyzyjne <- C5.0(x=biopsy[,-11], y=biopsy$class)

summary(drzewoDecyzyjne)
drzewoDecyzyjne
plot(drzewoDecyzyjne)
