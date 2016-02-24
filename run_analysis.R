##Set working directory
setwd("C:/Users/Vivek/Desktop/DataScience/Getting&CleaningData/GCD Course Project")

##FEATURES variable values
xtrain<-read.table("./train/X_train.txt")
xtest<-read.table("./test/X_test.txt")

##Activity variable values
ytrain<-read.table("./train/y_train.txt")
ytest<-read.table("./test/y_test.txt")

##Subject variable values
subjecttrain<-read.table("./train/subject_train.txt")
subjecttest<-read.table("./test/subject_test.txt")

##FEATURES variable labels (in 2nd variable)
featuresDF<-read.table("features.txt",header=FALSE)

##Bind the test and traning data for the three variables
dataSubject<-rbind(subjecttest,subjecttrain)
dataActivity<-rbind(ytrain,ytest)
dataFeatures<-rbind(xtrain,xtest)

##Assign column names to the 3 now combined datasets
names(dataSubject)<-c("Subject")
names(dataActivity)<-c("Activity")
names(dataFeatures)<-featuresDF$V2

##Each of the activity,subject,features tables has 10299 obs. Can use cbind since column vals are same
subjectActivityCombo<-cbind(dataSubject,dataActivity)
FullMergedSet<-cbind(subjectActivityCombo,dataFeatures)

##Subset by searching for all variable names with mean or std included (66)
SubsetMeanOrFeatures<-featuresDF$V2[grep("-(mean|std)\\(\\)",featuresDF[,2])]
length(SubsetMeanOrFeatures)

##Activity Names
ActivityNames<-read.table("activity_labels.txt")
##Add back the subject and activity labels to the 66 selected via searching for mean or std
NamesNeeded<-c(as.character(SubsetMeanOrFeatures),"Subject","Activity")

##Subset original merged set to only selected names
FullMergedSetRevised<-FullMergedSet[,NamesNeeded]

##Create Temp Copy of Dataset then take 68th column(Activity variable) and use factorized labels to replace numeric vals
FullMergedSetRevised2<-FullMergedSetRevised
FullMergedSetRevised2[,68]<-ActivityNames[FullMergedSetRevised2[,68],2]

##Clean up Data Label Names
names(FullMergedSetRevised2)<-gsub("^t","Time",names(FullMergedSetRevised2))
names(FullMergedSetRevised2)<-gsub("^f","Frequency",names(FullMergedSetRevised2))
names(FullMergedSetRevised2)<-gsub("Gyro","Gyroscope",names(FullMergedSetRevised2))
names(FullMergedSetRevised2)<-gsub("Acc","Accelerometer",names(FullMergedSetRevised2))
names(FullMergedSetRevised2)<-gsub("Mag","Magnitude",names(FullMergedSetRevised2))

##Calculate mean by subject and activity and order accordingly. Write into new tidy dataset file
TidySet<-aggregate(. ~Subject+Activity,FullMergedSetRevised2,mean)
TidySet<-TidySet[order(TidySet$Subject,TidySet$Activity),]
write.table(TidySet,"tidyData.txt",row.names = FALSE)

##Check File to see if indeed Tidy
TidyDataCheck<-read.table("tidyData.txt",header = TRUE)
str(TidyDataCheck)