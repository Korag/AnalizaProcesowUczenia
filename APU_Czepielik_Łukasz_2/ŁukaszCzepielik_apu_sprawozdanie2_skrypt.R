install.packages("ahp")

library(ahp)
library(data.tree)
setwd("C:/R_Directory/£ukaszCzepielik_apu_sprawozdanie2")
pralkiAHP <- Load("pralki.yml")

print(pralkiAHP, filterFun = isNotLeaf)

Calculate(pralkiAHP)
print(pralkiAHP, priority = function(x) x$parent$priority["Total", x$name])
Visualize(pralkiAHP)
Analyze(pralkiAHP)
AnalyzeTable(pralkiAHP)