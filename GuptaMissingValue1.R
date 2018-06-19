#install package and load library
install.packages("Hmisc")
library(Hmisc)
data <- read.csv("MissingData1.csv")
summary(data)
#using argImpute
#the below values in aregImpute should be updated with column names in the missing values input
#file
impute_arg <- aregImpute(~ a1 + ~ b1 + ~ c1 + ~ d1 +
                         ~ e1 + ~ f1 + ~ g1 + ~ h1 + ~ i1 + ~ j1 +
                         ~ k1 + ~ l1 + ~ m1 + ~ n1, x=TRUE, data = data)
impute_arg
datanew<-impute_arg$x
write.table(datanew, "GuptaMissingResult1.txt", sep="\t")
write.csv(datanew, file = "GuptaMissingResult1.csv", row.names = FALSE)
