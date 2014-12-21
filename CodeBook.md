#Code Book

This code book covers details about source data used for this exercise, operations that are performed on that data and information about the results.

##Details
The source data was obtained from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This data contains measurements of certain parameters recorded over regular time intervals on 30 subjects who perform different activities like Walking, Sitting etc
The source data was downloaded from the link mentioned above. The source data comes segregated into test and training data which need to be merged subject-wise and activity-wise. In the summary, the mean and standard deviation values are only needed for the assignment.

##Operations
1.Set the working directory to the folder where the data is downloaded.
2.The data that is downloaded is loaded into variables as test, train.
3.Combine test and training data sets into one
4.Include only mean and standard deviation values alone from the combined data set variable
5.Combine data set from subject, measurements and activities into one data set and have appropriate activity labels
6.This will be summary data for every subject for every activity

##Results
The resultant data obtained by performing the above mentioned operations will have the mean and standard deviation values for the parameters recorded in X, Y, Z planes summarized subject-wise and  activity-wise. 


