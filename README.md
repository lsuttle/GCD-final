Getting and Cleaning Data: Course Project
========================================================

The script run_analysis.R takes the Human Activity Recognition Using Smartphones Dataset
as input and output a single tidy dataset, detailed below. 

Input
---
In order to use this script, you must first download the zipfile and unpack it. This 
script assumes that you have unpacked the folder "UCI HAR Dataset" into your current working directory. 

Output
---
Output from the script will be saved in your current working directory as `GCD.Final.Means.csv.`

Due to the complexity of the column names, capital letters were used to distinguish the start of each word.

Only variables coding raw data from the accelerometer and gyroscope were included in this final dataset. 

The output will include the following columns:

* **Subject:** factor variable with a unique number for each subject.

* **Activity:** factor variable with a unique descriptor for each activity type.

* **BodyAccelerometerMean:** mean amount of movement in the accelerometer associated with the body movements of each subject for each activity. Three columns total, one for each axis (X, Y, and Z).

* **BodyAccelerometerStd:** mean amount of variation in movement in the accelerometer associated with the body movements of each subject for each activity. Three columns total, one for each axis (X, Y, and Z).

* **GravityAccelerometerMean:** mean amount of movement in the accelerometer associated with gravity for each subject for each activity. Three columns total, one for each axis (X, Y, and Z).

* **GravityAccelerometerStd:** mean amount of variation in movement in the accelerometer associated with gravity for each subject for each activity. Three columns total, one for each axis (X, Y, and Z).

* **BodyGyroscopeMean:** mean amount of movement in the gyroscope associated with the body movements of each subject for each activity. Three columns total, one for each axis (X, Y, and Z).

* **BodyGyroscopeStd:** mean amount of variation in movement in the gyroscope associated with the body movements of each subject for each activity. Three columns total, one for each axis (X, Y, and Z).




