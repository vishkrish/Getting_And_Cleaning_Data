run_analysis<-function(){
  library(plyr)
  library(reshape2)
  X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  X_fulldata<-rbind(X_test,X_train)
  Y_fulldata<-rbind(Y_test,Y_train)
  subject_fulldata<-rbind(subject_test,subject_train)
  
  ColumnNames<-read.table("./UCI HAR Dataset/features.txt")
  colnames(X_fulldata)<-ColumnNames[,2]
  ColumnNeeded<-grepl("mean()",colnames(X_fulldata))
  ColumnNeeded<-ColumnNeeded | grep("std()",colnames(X_fulldata))
  X_mean_std<-X_fulldata[,ColumnNeeded]
  
  ActivityList<-read.table("./UCI HAR Dataset/activity_labels.txt")
  Y_scale<-mapvalues(as.factor(Y_fulldata[,1]),from = as.character(ActivityList[,1]), to = as.character(ActivityList[,2]))
  print(Y_scale)
  
  X_mean_std<-cbind(subject_fulldata,X_mean_std)
  colnames(X_mean_std)[1]<-"subject"
  
  X_mean_std<-cbind(Y_scale,X_mean_std)
  colnames(X_mean_std)[1]<-"activity"
  
  X_tidy<-melt(X_mean_std,id.vars=c("subject","activity"))
  X_tidy<-dcast(X_tidy, subject + activity ~ ..., mean)
  
  write.table(X_tidy,"tidydata.txt")
}