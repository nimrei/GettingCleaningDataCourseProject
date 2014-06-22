#download our file if we don't have it
data.file <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists(data.file)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", data.file)
  unzip(data.file)
}
directory <- "UCI HAR Dataset"

#helper function to read in a raw set of test|training readings
readInRawDataSet <- function(type="test"){
  
  filenames <- c("<directory>//<component>//X_<component>.txt",
                 "<directory>//<component>//subject_<component>.txt",
                 "<directory>//<component>//y_<component>.txt")
  filenames <- gsub("<component>",type,filenames)
  filenames <- gsub("<directory>",directory,filenames)
  
  features <- read.table("UCI HAR Dataset//features.txt", sep=" ",col.names=c("featureId","featureName"))
  
  variableReadings <- read.table(filenames[1], col.names=features$featureName,colClasses="numeric")
  
  subjectIds <- read.table(filenames[2], col.names="subjectId",colClasses="integer")
  
  activtityIds <- read.table(filenames[3], col.names="activityId",colClasses="integer")
  
  #combine all & return
  cbind(variableReadings, subjectIds, activtityIds)  
}

# 1. Merges the training and the test sets to create one data set.
rawTestData <- readInRawDataSet("test")
rawTrainingData <- readInRawDataSet("train")
data <- rbind(rawTrainingData, rawTestData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#filter the set with only the mean & stdev columns & our 2 added ones
columnnamestokeep <- c(names(data)[grep(x=names(data),
                                        pattern="((\\.(mean|std)(\\.){2,}[x-z]?)){1}",
                                        ignore.case=T)],
                       "subjectId","activityId")
data <- data[,columnnamestokeep]

# 3. Uses descriptive activity names to name the activities in the data set
activity.filename <- "<directory>//activity_labels.txt"
activity.filename <- gsub("<directory>",directory,activity.filename)
activities <- read.table(activity.filename, 
                         sep=" ",
                         col.names=c("activityId","activity"))
data <- merge(data, activities,by="activityId")[-1]

# 4. Appropriately labels the data set with descriptive variable names. 
names(data) <- gsub("\\.","", names(data),ignore.case=T)
names(data) <- gsub("mean","Mean", names(data),ignore.case=T)
names(data) <- gsub("std","StDev", names(data),ignore.case=T)
names(data) <- gsub("^(t)","Time", names(data),ignore.case=T)
names(data) <- gsub("^(f)","Freq", names(data),ignore.case=T)
names(data) <- gsub("gravity","Gravity", names(data),ignore.case=T)
names(data) <- gsub("bodybody|body","Body", names(data),ignore.case=T)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidy <- aggregate(. ~ subjectId+activity, data, mean)

write.table(tidy, file = "./tidy_data.txt",row.names=F)