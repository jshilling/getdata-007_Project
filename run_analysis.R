##  run_analysis.R
##  

## Must be run from one directory above /UCI HAR Dataset.
## Go to top level directory
#setwd("C:/Users/Jeff/Dropbox/R Projects/DataCleaningProject/UCI HAR Dataset")
setwd("C:/Users/IBM_ADMIN/Dropbox/R Projects/DataCleaningProject/UCI HAR Dataset")


library(reshape2)
library(plyr)
library(dplyr)
library(data.table)

createFrame <- function(label, good) {
    ## function to read the known files
    ## pass in the directory name
    ## return the datafrome with the correct variables
    
    ## use the label to create a path
    path <- paste("./", label, "/", sep="")
    
    ## build the name of each target file and read it with 
    ## the right column names
    ##
    ## get the subject identifiers
    f <- paste(path, "subject_",label,".txt", sep="")
    subject <- read.table(f, col.names = c("subject"))
    
    ## get all the readings (x values) and label them with the features labels
    f <- paste(path, "x_",label,".txt", sep="")
    x <- read.table(f, col.names = features$variable)
    x <- x[,good]
    ## get order in which the activities were performed (y)
    f <- paste(path, "y_",label,".txt", sep="")
    y <- read.table(f, col.names = c("activity"))
    
    # turn y column into factors of activity labels
    y[,1] <- factor(y$activity, labels = act_lab$activity)
    # bind subject column and activity labels to features
    return(cbind(subject, y, x))
}

## grab the descriptive info

act_lab <- read.table("activity_labels.txt", col.names = c("i","activity"))
features <- read.table("features.txt", col.names = c("i", "variable"))
## identify the columns we want to end up with 
## which are the ones for mean and standard deviation
## then apply them (along with the subject and activity columns)
good <- grep("mean()|std()", features[,2])

## read the test and train data into data frames
test <- createFrame("test", good)
train <- createFrame("train", good)
## merge the two data sets
activityData <- data.table(rbind(test,train))
rm(test,train)  # free up some RAM

## identify which are the mean and std variables
## then melt the table using those variables
meancols <- grep("mean", colnames(activityData))
stdcols <- grep("std", colnames(activityData))
activityMelt <- melt(activityData,id.vars = c(1, 2), measure.vars = c(meancols, stdcols), variable.factors=FALSE)
setkey(activityMelt, subject, activity)
rm(activityData)

## split the freature content into the varialbe measured
## and the type of measurement (mean or std).
activityMelt[,measure := lapply(activityMelt$variable, function (x) {
    l <- strsplit(as.character(x), "\\.")
    l[[1]][2]
})]
activityMelt$measure <- as.character(activityMelt$measure)
activityMelt[,var := lapply(activityMelt$variable, function (x) {
  l <- strsplit(as.character(x), "\\.")
  p <- paste(l[[1]][1], "_", l[[1]][length(l[[1]])], sep = "")
})]
activityMelt$variable <- as.character(activityMelt$variable)
activityMelt$var <- as.character(activityMelt$var)
activityMelt$variable <- activityMelt$var
activityMelt[,var:=NULL]
setcolorder(activityMelt,c("subject", "activity", "variable", "measure", "value"))

## creat and write the tidy summary data set

actSummary <- activityMelt[,mean(value), by = list(subject, activity, variable, measure)]
setnames(actSummary, "V1", "value")
setkey(actSummary, subject, activity, variable, measure)


## write a tidy summary data set
outfile = "tidyMotionSummaryData.txt"
write.table(actSummary, outfile, row.names = FALSE)
