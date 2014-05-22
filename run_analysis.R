# Source https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Comment about following Google R standard

# Import relevant packages
library(plyr)
library(reshape2)

# Read in activity and feature name keys
actKey <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("Num", "Name"))
featKey <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, col.names = c("Num", "Name"))

# Clean up activity names to be more human readable 
actKey$Name <- tolower(actKey$Name)
actKey$Name <- sub("[\\_\\.]", "", actKey$Name) # remove punctuation
actKey$Name <- sub("up", "Up", actKey$Name)
actKey$Name <- sub("down", "Down", actKey$Name)

# Clean up feature names to be more human readable
featKey$Name <- sub("^[tf]", "", featKey$Name) # remove time and fourier tokens from start
featKey$Name <- gsub("[\\(\\)\\-\\.\\,]", "", featKey$Name) # remove parentheses
featKey$Name <- gsub("[\\-]", "", featKey$Name) #remove dashes
featKey$Name <- gsub("[\\.\\,]", "", featKey$Name) #remove periods and commas
featKey$Name <- sub("Acc", "Accelerometer", featKey$Name) # spell out accel to accelerometer
featKey$Name <- sub("Gyro", "Gyroscope", featKey$Name) # spell out gyro to gyroscope
featKey$Name <- sub("Mag", "Magnitude", featKey$Name) # spell out mag to magnitude

# Capitalizing words in features one by one
# This could be replaced by reg expressions if I knew that voodoo better
featKey$Name <- sub("mean", "Mean", featKey$Name) 
featKey$Name <- sub("std", "Std", featKey$Name) 
featKey$Name <- sub("min", "Min", featKey$Name) 
featKey$Name <- sub("max", "Max", featKey$Name) 
featKey$Name <- sub("sma", "SMA", featKey$Name) 
featKey$Name <- sub("ent", "Ent", featKey$Name) 
featKey$Name <- sub("mad", "Mad", featKey$Name) 
featKey$Name <- sub("energy", "Energy", featKey$Name) 
featKey$Name <- sub("iqr", "IQR", featKey$Name) 
featKey$Name <- sub("ar", "AR", featKey$Name) 
featKey$Name <- sub("corr", "Corr", featKey$Name) 

# Read in data files
sTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "Subject")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = featKey$Name)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "Activity")

# Substitute in activity names
yTest$Activity <- mapvalues(yTest$Activity, from = 1:6, to = actKey$Name)

# Combine Subjects, Activities, and Data into one table
fullData <- cbind(sTest,yTest,xTest)

# Removing all columns that aren't means or st. devs
subData <- fullData[,grep("AccelerometerMean|AccelerometerStd|GyroscopeMean|GyroscopeStd|Sub|Act", names(fullData))]
# Subset columns to only get the raw data 
subDataRaw <- subData[,1:20]

# Melt subsetted data based on Subject and Activity columns
meltedData <- melt(subDataRaw, id.vars = c("Subject", "Activity"))
# Reshape into table by getting mean for each unique Subject/Activity pair
meansData <- dcast(meltedData, Subject+ Activity ~ variable, mean)

# Write final means table to comma-separated text file 
# (Due to issues with uploading csv files on Coursera)
write.table(file="GCD.Final.Means.txt", meansData, sep = ",")