---
title: "Getting and Cleaning Data Course Project 2"
output: html_document
---

##Getting and Cleaning Data README
This deliverable concentrates on taking a dataset from the UCI publicly available repository which tracks wearable devices and accelerometer data. The steps undertook to complete the activity in the **run_analysis.R** are outlined below:

1. Download the dataset and read the training and test datasets for the 3 variables: Features, Activity, Subject.

2. Bind the test and training dataset for the aformentioned 3 variables.

3. Combine the subject and activity table since they have the same dimensions using a cbind function. Afterwards add on the features Column to complete the data frame.

4. Subset the full data frame by searching only for mean and st dev related metrics.

5. Use labels from Activity Names text and replace numeric values with the factorized label names.

6. Clean up label names with abbreviations to make dataset easier to understand.

7. Calculate mean by subject and activity and arrange dataset by those indicators

8. Write dataset into tidy file.


