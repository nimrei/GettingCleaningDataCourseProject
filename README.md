Getting and Cleaning Data Course Project
=====================================

Author: Nick Imrei

### Overview

**Cleaning & reshaping of Human Activity Recognition data, captured using Smartphones.** 

Original dataset description can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Source data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

**Task**: Create one R script called ```run_analysis.R``` that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to run

1. Set the working directory to where `run_analysis.R` is located on your local machine. e.g. `setwd("C:/<my_directory>/")`

2. Run ```source("run_analysis.R")```, it will:
	- Download the source data into a folder on your local drive & extract it. 
	- Run the analysis and generate a new file ```tiny_data.txt``` in your working directory.

### Dependencies

None.

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file. 