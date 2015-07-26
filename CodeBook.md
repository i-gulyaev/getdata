# Overview
The `tidy_dataset.txt` data set is a result of tranformation series of UCI HAR Dataset.
It contains 180 observations for 68 variables. Each observation indicates an activity preformed by a subject and a vector of features which are means of signals of this activity captured from accelerometer and gyroscope.


# Variables
- *subject* - An identifier of the subject who carried out the experiment (values: 1-30)
- *activity* - An activity label each subject performed (values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Following values are captured from accelerometer and gyroscope, all values are in range [-1,1]:

* *tBodyAcc-mean()-X*, *tBodyAcc-mean()-Y*, *tBodyAcc-mean()-Z* - mean value of 3-axial body acceleration signal
* *tBodyAcc-std()-X*, *tBodyAcc-std()-Y*, *tBodyAcc-std()-Z* - standard deviation of 3-axial body acceleration signal
* *tGravityAcc-mean()-X*, *tGravityAcc-mean()-Y*, *tGravityAcc-mean()-Z* -  mean value of 3-axial gravity acceleration signal
* *tGravityAcc-std()-X*, *tGravityAcc-std()-Y*, *tGravityAcc-std()-Z*  - standard deviation of 3-axial gravity acceleration signal
* *tBodyAccJerk-mean()-X*, *tBodyAccJerk-mean()-Y*, *tBodyAccJerk-mean()-Z* - mean value of the 3-axial body linear acceleration
* *tBodyAccJerk-std()-X*, *tBodyAccJerk-std()-Y*, *tBodyAccJerk-std()-Z* - standard deviation of 3-axial body linear acceleration
* *tBodyGyro-mean()-X*, *tBodyGyro-mean()-Y*, *tBodyGyro-mean()-Z* - mean value of 3-axial gryroscope signal
* *tBodyGyro-std()-X*, *tBodyGyro-std()-Y*, *tBodyGyro-std()-Z* - standard deviation of 3-axial gryroscope signal
* *tBodyGyroJerk-mean()-X*, *tBodyGyroJerk-mean()-Y*, *tBodyGyroJerk-mean()-Z* - mean value of the 3-axial angular velocity
* *tBodyGyroJerk-std()-X*, *tBodyGyroJerk-std()-Y*, *tBodyGyroJerk-std()-Z* - standard deviation of the 3-axial angular velocity
* *tBodyAccMag-mean()* - mean value of magnitude of three-dimensional body acceleration signals
* *tBodyAccMag-std()* - standard deviation of magnitude of three-dimensional body acceleration signals
* *tGravityAccMag-mean()* - mean value of magnitude of three-dimensional gravity acceleration signals
* *tGravityAccMag-std()* - standard deviation of magnitude of three-dimensional gravity acceleration signals
* *tBodyAccJerkMag-mean()* - mean value of the magnitude of three-dimensional body linear acceleration
* *tBodyAccJerkMag-std()* - standard deviation of the magnitude of three-dimensional body linear acceleration
* *tBodyGyroMag-mean()* - mean value of magnitude three-dimensional gryroscope signal
* *tBodyGyroMag-std()* - standard deviation of magnitude three-dimensional gryroscope signal
* *tBodyGyroJerkMag-mean()* - mean value of magnitude of three-dimensional angular velocity
* *tBodyGyroJerkMag-std()* - standard deviation of magnitude of three-dimensional angular velocity

Following variables are produced by applying Fast Fourier Transform to the above:

* *fBodyAcc-mean()-X*, *fBodyAcc-mean()-Y*, *fBodyAcc-mean()-Z*
* *fBodyAcc-std()-X*, *fBodyAcc-std()-Y*, *fBodyAcc-std()-Z*
* *fBodyAccJerk-mean()-X*, *fBodyAccJerk-mean()-Y*, *fBodyAccJerk-mean()-Z*
* *fBodyAccJerk-std()-X*, *fBodyAccJerk-std()-Y*, *fBodyAccJerk-std()-Z*
* *fBodyGyro-mean()-X*, *fBodyGyro-mean()-Y*, *fBodyGyro-mean()-Z*
* *fBodyGyro-std()-X*, *fBodyGyro-std()-Y*, *fBodyGyro-std()-Z*
* *fBodyAccMag-mean()*
* *fBodyAccMag-std()*
* *fBodyBodyAccJerkMag-mean()*
* *fBodyBodyAccJerkMag-std()*
* *fBodyBodyGyroMag-mean()*
* *fBodyBodyGyroMag-std()*
* *fBodyBodyGyroJerkMag-mean()*
* *fBodyBodyGyroJerkMag-std()*


# Original data set transformation
Final tidy data set was produced from the UCI HAR Dataset by applying following transofromations:

1. From `X_test.txt`, which contains records of feature vectors, variables that represent mean and standard deviation of signals were derived
2. Resulting data set from step 1 was modified in order to assign names to variables. Variable names were gotten from `features.txt`
3. Data Set `y_test.txt`, which contains activity identifiers for each observation from  test data set, was joined with `activity_labels.txt` which contains mapping of activity identifier to activity name. 
4. Data Sets produced on *step 2* and *step 3* were combined with data set from `subject_test.txt`
5. Transformation from steps 1 through 4 were applied to train data set
6. Train and test data sets from steps 4 and 5 were combined into one  full data set.
7. From full data set new  tidy data set was produced with the average of each variable for each activity and each subject.

