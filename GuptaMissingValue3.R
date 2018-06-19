#install package and load library
install.packages("missForest")
library(missForest)
data <- read.csv("FluDataMissingValue.csv")
summary(data)
set.seed(123)
data.imp <- missForest(data, verbose = TRUE, maxiter = 9)
data.imp
summary(data.imp)
data.imp$OOBerror
datanew<-data.imp$ximp
write.table(datanew, "GuptaMissingResult3.txt", sep="\t")
write.csv(datanew, file = "GuptaMissingResult3.csv", row.names = FALSE)
#write.table(data.imp,file='output1.csv')
