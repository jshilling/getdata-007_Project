#Code Book for run_analysis.R

tidyActivitySummaryData.txt presents the mean and standard deviations across observations of subjects performing a variety of activities.

##Source
The source data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract the zip file and open the directory "UCI HAR Dataset".


- The file README.txt explains the data collection and measurements called "features".
- The file features_info.txt provides the details about each feature, how it was measured, the units of measure, and subsequent calculations.
- The files ./test/subject_test.txt and ./train/subject_train.txt contain the aggragation of the sensor sample windows from raw signals found in ./test/Inertial Signals and ./train/Inertial Signals, respectively
- From the 561 features in each vector, we are only insterest in the mean and the standard deviation of the signal data along each dimension
- The dimensions are described in the table below.

Units

acceleration units are standard gravity units (g) corrected by subtracting normal gravity from the actual measure to indicate acceleration due to movement associated with the activity.

rotation is in radians/second

##Variable Naming Convention


- The first letter, t or f, indicates the measure is take from the time or frequency domain.
- "Body" or "Gravity" indicates the observation pertains to the body in motion or natural gravity
- "Acc" or "Gyro" indicates linear acceleration or angular velocity
- "Jerk" indicates spikes deviating from the average rate of motion
- "X", "Y", or "Z" indicate the axis of the motion vector
- "Mag" indicates the magnitude of the sum of the axis vectors
- positive or negative values indicate direction of motion with respect to gravity


## List of variables

| Variable Name | Unit | Explanation | 
| :-----------: | :--: | -------- |
| fBodyAcc_X | g | linear acceleration along the x-axis |
| fBodyAcc_Y | g | linear acceleration along the y-axis |
| fBodyAcc_Z | g | linear acceleration along the z-axis |
| fBodyAccJerk_X | g | sudden linear acceleration along the x-axis |
| fBodyAccJerk_Y | g | sudden linear acceleration along the y-axis |
| fBodyAccJerk_Z | g | sudden linear acceleration along the z-axis |
| fBodyAccMag_ | g | effective linear acceleration |
| fBodyAccJerkMag_ | g | force of sudden linear acceleration |
| fBodyGyroJerkMag_ | g | force of sudden angular acceleration |
| fBodyGyroMag_ | g | effective rotation |
| fBodyGyro_X | rad/sec | rotation around the x-axis |
| fBodyGyro_Y | rad/sec | rotation around the y-axis |
| fBodyGyro_Z | rad/sec | rotation around the z-axis |
| tBodyAcc_X | g | linear acceleration along the x-axis |
| tBodyAcc_Y | g | linear acceleration along the y-axis |
| tBodyAcc_Z | g | linear acceleration along the z-axis |
| tBodyAccJerk_X | sudden linear acceleration along the y-axis |
| tBodyAccJerk_Y | sudden linear acceleration along the z-axis |
| tBodyAccJerk_Z | sudden linear acceleration along the x-axis |
| tBodyAccJerkMag_ | g | force of sudden linear acceleration |
| tBodyAccMag_ | g | effective linear acceleration |
| tBodyGyro_X | rad/sec | rotation around the x-axis |
| tBodyGyro_Y | rad/sec | rotation around the y-axis |
| tBodyGyro_Z | rad/sec | rotation around the z-axis |
| tBodyGyroJerk_X | rad/sec | sudden angular acceleration along the x-axis |
| tBodyGyroJerk_Y | rad/sec | sudden angular acceleration along the y-axis |
| tBodyGyroJerk_Z | rad/sec | sudden angular acceleration along the z-axis |
| tBodyGyroJerkMag_ | rad/sec | force of sudden angular acceleration |
| tBodyGyroMag_ | rad/sec | effective rotation |
| tGravityAcc_X | g | linear acceleration along the x-axis due to gravity |
| tGravityAcc_Y | g | linear acceleration along the y-axis due to gravity |
| tGravityAcc_Z | g | linear acceleration along the z-axis due to gravity |
| tGravityAccMag_ | g | effective acceleration due to gravity |

