
# coding: utf-8

# In[1]:

import pandas as pd
from skmultilearn.problem_transform import BinaryRelevance
from sklearn.naive_bayes import GaussianNB
from sklearn.multiclass import OneVsRestClassifier
from sklearn.svm import SVC
import sklearn.metrics


# In[5]:

TrainData = pd.read_csv("C:\\MachineLearning\\MultLabelTrainData.txt",sep="\t",header=None)
TrainLabels = pd.read_csv("C:\\Users\\saurabhgupta\\Desktop\\Big Data Project\\Now\\Ganga\\Machine Learning\\project\\problem3\\MultLabelTrainLabel.txt", sep="\t",header=None)
TrainData_TrainSplit = TrainData.iloc[0:350]
TrainData_TestSplit = TrainData.iloc[350:]


# In[6]:

TrainLabels_TrainSplit = TrainLabels.iloc[0:350].as_matrix()
TrainLabels_TestSplit = TrainLabels.iloc[350:].as_matrix()


# In[7]:

classifier = OneVsRestClassifier(SVC(kernel='linear'))


# In[9]:

#train
classifier.fit(TrainData_TrainSplit, TrainLabels_TrainSplit)


# In[10]:

# predict
predictions = classifier.predict(TrainData_TestSplit)


# In[11]:

# measure
print(1-sklearn.metrics.hamming_loss(TrainLabels_TestSplit, predictions))


# In[12]:

TestData = pd.read_csv("C:\\MachineLearning\\MultLabelTestData.txt",sep="\t",header=None)


# In[14]:

#main predictions
mainPredictions = classifier.predict(TestData)
type(mainPredictions)


# In[16]:

df = pd.DataFrame(data=mainPredictions)
df.to_csv("C:\\MachineLearning\\GuptaMultClassification.txt", sep="\t",header=None, index=False)


# In[ ]:



