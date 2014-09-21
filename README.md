#Getting and Cleaning Data Course Projcect
(Coursera getdata-007)

The object of this analysis is to create a tidy data set from Samsung Galaxy S smartphone accelerometer data which was gathered from 30 subjects across 6 activities.

The data can be found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Refer to the codebook in this repository for the mapping from the original variables to the tidy data set summary variables.

##Procedure
1.	Download and unpack the files into a directory.  The zip file unpacks into "./UCI HAR Dataset".
2.	Place the R script run_analysis.R in the same directory and run it.
3.	The run_analysis.R will create the file tidyMotionSummaryData.txt which presents the averages of the averages and standard deviations for the trials across activities for each subject.

##Method in run_analysis.R

1.	Load the lists of the 6 activities and all 561 "features" which are the measurements available from the original data.
2.	Create a vector to indicate which of the 561 features we want to keep: anything with "mean" or "std" in the name.
3.	Read the training and test data using a function that captures only the columns identified in step 2.
4.	Merge the training and test data into a single data table. (Also remove the temporary training and test data from memory as we won't need them again.)
5.	"Melt" the wide data table into a tall, narrow data table by separating and stacking the mean and std observations.
6.	The original feature names contain the variable name and the type of measure (mean or standard deviation).  Pull that information out into two separate columns, then move the name information back into the original feature variable name. Then reorder the dataset by subject, activity, variable, and measure. For example...
	1.	The feature (stored in the column "variable") is 1 "tBodyAcc-mean()-X".
	2.	Parse that into var = tBodyAcc_X and measure = mean
	3.	Then replace the original value in variable with var so "tBodyAcc-mean()-X" becomes "tBodyAcc_X".
7.	Summarize the data by taking the average of each feature type across subject and activity.
8.	Write the text file
