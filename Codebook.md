---
title: "CodeBook.md"
output: html_document
---

##Data
####The Data files used to create the tidy datset are below:
```
X_train.txt
X_test.txt
y_train.txt
y_test.txt
subject_train.txt
subject_test.txt
features.txt
activity_labels.txt
```
***

##Transformations
####Transformations performed are below:

1. Bind training and test datasets for 3 variables and add labels to get a full merged dataset
   + Bind subject data(subject_train.txt,subject_test.txt)
   + Bind activity data(y_train.txt,y_test.txt)
   + Bind features data(x_train.txt,x_test.txt)
   + Add names to dataset (Subject, Activity, and features labels)
   + Bind subject, activity, and features datasets to single merged dataset

2. Subset merged dataset for variable names with STD or Mean. Included 66 variables plus 2(subject and activity)

3. Take 68th variable (activity variable) and add the factorized labels from the activity_labels.txt file.

4. Clean up data label names for cleaner look.

5. Calculate mean by subject and activity and arrange order accordingly

6. Write table into a clean tidy dataset.

***

##Variables
####Variables of particular note are noted below:


```
Subject
Activity
66 other gyroscope and accelerometer variables
```


