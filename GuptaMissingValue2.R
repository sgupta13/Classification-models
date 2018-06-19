#install package and load library
install.packages("Hmisc")
library(Hmisc)
data <- read.csv("MissingData2.csv")
summary(data)
#using argImpute
#the below values in aregImpute should be updated with column names in the missing values input
#file
impute_arg <- aregImpute(~ a1 + ~ b1 + ~ c1 + ~ d1 +
                         ~ e1 + ~ f1 + ~ g1 + ~ h1 + ~ i1 + ~ j1 +
                         ~ k1 + ~ l1 + ~ m1 + ~ n1 + ~ o1 + ~ p1 +
                         ~ q1 + ~ r1 + ~ s1 + ~ t1 + ~ u1 + ~ v1 +
                         ~ w1 + ~ x1 + ~ y1 + ~ z1 + ~ a2 + ~ b2 +
                         ~ c2 + ~ d2 + ~ e2 + ~ f2 + ~ g2 + ~ h2 +
                         ~ i2 + ~ j2 + ~ k2 + ~ l2 + ~ m2 + ~ n2 +
                         ~ o2 + ~ p2 + ~ q2 + ~ r2 + ~ s2 + ~ t2 +
                         ~ u2 + ~ v2 + ~ w2 + ~ x2, x=TRUE, data = data)
impute_arg
datanew<-impute_arg$x
write.table(datanew, "GuptaMissingResult2.txt", sep="\t")
write.csv(datanew, file = "GuptaMissingResult2.csv", row.names = FALSE)
