install.packages("randomForest")
install.packages("caret")
library(randomForest)
library(caret)
#Data import statements
train1<-read.csv('TrainData4.csv',header = T)
test1<-read.csv('TestData4.csv',header = T)
str(train1) #structure of our data frame
anyNA(train1)
train1[is.na(train1)] <- 0
anyNA(test1)
test1[is.na(test1)] <- 0
#Data partitioning
set.seed(3033)
intrain <- createDataPartition(y = train1$Label, p= 0.7, list = FALSE)
training <- train1[intrain,]
testing <- train1[-intrain,]
#check dimensions of train & test set
dim(training); dim(testing); 
summary(train1) #summary stats of our data
training[["Label"]] = factor(training[["Label"]]) #conversion of V1 integer variable to factor variable
#Training & Preprocessing 
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
model1 <- randomForest(Label ~ ., data=training)
print(model1)
test_pred <- predict(model1,test1)
test_pred
write.table(test_pred, "GuptaClassification4.txt")
write.csv(test_pred, file = "GuptaClassification4.csv", row.names = FALSE)
############################################################################################
#UNCOMMENT THE BELOW LINES TO RUN THE MODEL TEST                                           #
############################################################################################
#x1 <- subset(testing, select=-Label)
#test_pred <- predict(iris.rf, newdata = x1)
#test_pred