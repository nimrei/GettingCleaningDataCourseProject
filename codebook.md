Getting and Cleaning Data Course Project CodeBook
==============================================

Author: Nick Imrei

### Description
Cleaning & reshaping of Human Activity Recognition data, captured using Smartphones. 

Experiments were carried out measuring 30 test subjects within an age range of 19-48 years. Whilst wearing a smartphone (Samsung Galaxy S II), each participant performed six activities:

1. LAYING
2. SITTING
3. STANDING
4. WALKING
5. WALKING_DOWNSTAIRS 
6. WALKING_UPSTAIRS

Via the smartphone's embedded accelerometer and gyroscope, triaxial linear acceleration and triaxial angular velocity data was recorded. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Source Data
The original source data used from this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The dataset in this repository includes the following files:

**Training set-specific data:**

- 'train/X_train.txt': Variable readings for training set.
- 'train/y_train.txt': Activity type for each row of training set.
- 'train/subject_train.txt': Each row = subject who performed the activity for each window sample in training set. Range: [1,30]

**Test set-specific data:**

- 'test/X_train.txt': Variable readings for test set.
- 'test/y_train.txt': Activity type for each row of test set.
- 'test/subject_train.txt': Each row = subject who performed the activity for each window sample in test set. Range: [1,30]

The following files are available for the train and test data sets:

- 'README.txt'
- 'activity_labels.txt': Links the activity identifiers (used in y_train.txt files) with their activity names.
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': Links the feature identifiers (used as column indexes in X_train.txt files) with their feature names.

### Feature Selection

Selection was based off assignment requirements "Extracts only the measurements on the mean and standard deviation for each measurement." For completeness, all variables were included from the original dataset including either triaxial or magnitudinal mean or standard deviation information.

In the derived dataset, these signals were used to estimate variables of the feature vector for each pattern:

- `TimeBodyAcc[Mean|StDev][XYZ]`
- `TimeGravityAcc[Mean|StDev][XYZ]`
- `TimeBodyAccJerk[Mean|StDev][XYZ]`
- `TimeBodyGyro[Mean|StDev][XYZ]`
- `TimeBodyGyroJerk[Mean|StDev][XYZ]`
- `TimeBodyAccMag[Mean|StDev]`
- `TimeGravityAccMag[Mean|StDev]`
- `TimeBodyAccJerkMag[Mean|StDev]`
- `TimeBodyGyroMag[Mean|StDev]`
- `TimeBodyGyroJerkMag[Mean|StDev]`
- `FreqBodyAcc[Mean|StDev][XYZ]`
- `FreqBodyAccJerk[Mean|StDev][XYZ]`
- `FreqBodyGyro[Mean|StDev][XYZ]`
- `FreqBodyAccMag[Mean|StDev]`
- `FreqBodyAccJerkMag[Mean|StDev]`
- `FreqBodyGyroMag[Mean|StDev]`
- `FreqBodyGyroJerkMag[Mean|StDev]`

Key: 

- `[Mean|StDev]` : mean or standard deviation signals.
- `[XYZ]` : denotes 3-axial signals in the X, Y and Z direction.

For example, a a feature variable `TimeBodyAcc[Mean|StDev][XYZ]` will appear as the following variables in the derived dataset:

- `TimeBodyAccMeanX`
- `TimeBodyAccMeanY`
- `TimeBodyAccMeanZ`
- `TimeBodyAccStDevX`
- `TimeBodyAccStDevY`
- `TimeBodyAccStDevZ`

Other estimates have been removed for the purpose of this exercise.

Note: feature values are normalized and bounded within the range [-1,1].


### Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How ```run_analysis.R``` implements the above steps:

* Downloads the [data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) file and extracts it.
* Load both test and train data into separate raw datasets.
* Load the features and activity labels.
* Merges training & test data sets.
* Extract the mean and standard deviation column names and data (as well as SubjectId & Activity). 
* Filters & transforms the data.
* Place into it's 'tidy' form.
* Output the tidied dataset into ```tidy_data.txt```