***

## Human Activity Recognition Using Smartphones Data Set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

You can access the original data set at this url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

***

### data set: q1q4dataset/dataset1.txt

Access the data set by loading the 'dataSubmission.Rdata' file and pointing to the q1q4dataset data frame/data table object. You can also access the data directly from the dataset1.txt file in this git repository.

This data set is the combined data from testing and training data sets for an experiment to recognize human activity using smartphone data. This data set is filtered to only contain measurements related to mean() and std().

Please see below for a description of contents for this table. A list of possible values for non-numeric columns will be provided following the table description

| Column Name  | Column Description | Data Type | Source File(s) |
| ------------- | ------------- | ------------- | ------------- |
| subject | ID corresponding to the experiment's subject  | Factor | subject_train.txt; subject_test.txt |
| activity_label  | Text description corresponding to the measured activity  | Factor  | activity_labels.txt  |
| variable  | Text name corresponding to the type of measurement captured during the experiment -- the 'X', 'Y', and 'Z' indicate the axis direction of the measured activity  | Factor  | features.txt  |
| signal  | These signals were used to estimate variables of the measurement for each pattern | Factor  | features.txt |
| variable_type  | Extracted text description of the transformation used on the data used to estimate each signal | Factor | features.txt  |
| value  | Numeric value corresponding to the signal's estimate  | Numeric  | X_train.txt; X_test.txt |

***

#### A glimpse into the q1q4dataset

Please review the content below to understand possible values for non-numeric columns in q1q4dataset.

***

**subject**

One of the integer values 1-30 stored as a factor.

***

**activity_label**

One of the following text values stored as a factor:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

***

**variable**

One of the following 66 text values stored as a factor:

* tBodyAcc-mean()-X
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAcc-mean()-Y
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* tBodyAcc-mean()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* tBodyAcc-std()-X
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAcc-std()-Y
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* tBodyAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z

***

**signal**

One of the following 17 text values stored as a factor:

* tBodyAcc
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag     
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc
* fBodyAccJerk
* tGravityAcc
* fBodyGyro           
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag
* tBodyAccJerk 

***

**variable_type**

One of the following two text values stored as a factor:

* mean()
* std()

***

### data set: q5datasetmean/dataset2.txt

Access the data set by loading the 'dataSubmission.Rdata' file and pointing to the q5datasetmean data frame/data table object. You can also access the data directly from the dataset2.txt file in this git repository.

This table is derived from the above data set q1q4dataset and provides the average value for the measurements taken during the experiment by subject and activity for each variable.

Please see below for a description of contents for this table. A list of possible values for non-numeric columns will be provided following the table description

| Column Name  | Column Description | Data Type | Source File(s) |
  | ------------- | ------------- | ------------- | ------------- |
  | subject | ID corresponding to the experiment's subject  | Factor | subject_train.txt; subject_test.txt |
| activity  | Text description corresponding to the measured activity  | Factor  | activity_labels.txt  |
| variable  | ext name corresponding to the type of measurement captured during the experiment -- the 'X', 'Y', and 'Z' indicate the axis direction of the measured activity | Factor | features.txt  |
| average_value  | Numeric value corresponding to the average measurement value from the experiment  | Numeric  | X_train.txt; X_test.txt |

***

#### A glimpse into the q5datasetmean

Please review the content below to understand possible values for non-numeric columns in q5datasetmean.

***

**subject**

One of the integer values 1-30 stored as a factor.

***

**activity_label**

One of the following text values stored as a factor:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

***

**variable**

One of the following 66 text values stored as a factor:

* tBodyAcc-mean()-X
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAcc-mean()-Y
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* tBodyAcc-mean()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* tBodyAcc-std()-X
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAcc-std()-Y
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* tBodyAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z

***
