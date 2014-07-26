## Description:
## (full description in README.md)
## The run_analysis() below are used to read the Human Activity Recognition
## Using Smartphones Dataset - UCI HAR Dataset - and create a second,
## independent tidy dataset where:
## 	Columns are the average and standard deviation measure types variables
##              found in primary dataset,
##    Rows for every activity performed by each subject w/ average of each variable,
##    all in one File.
##
## Pre-conditions:
##   To use this script the UCI HAR Dataset file should be downloaded and
##    unzip it in the local filesystem.
##   (https://d396qusza40orc.cloudfront.net/
##                            getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
## Behavior:
##   When you call run_analysis() function, it will read data from the specified
##   input directory, create a tidy dataset, save it to file "average_X.txt" in
##   current directory and return it.

run_analysis <-
      function(inDir="./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"){
       ## Parameter:
       ##  inDir: is a character vector of length 1 containing the  root directory
       ##         structured as published in UCI HAR Dataset. The defaults is the 
       ##         name used in exported zip file.

myDF <- data.frame()

## Check input directory exists
if (!file.exists(inDir))
      stop("The input directory '", inDir,
           "' does not exist or is unreachable at this time.")
        
## Create a filename list for the dataset files to be read from primary dataset.
fileLst <- list (
      activityDF = paste(inDir,"/activity_labels.txt",sep=""),
      featuresDF = paste(inDir,"/features.txt",sep=""),
      subject_testDF = paste(inDir,"/test/subject_test.txt",sep=""),
      X_testDF = paste(inDir,"/test/X_test.txt",sep=""),
      y_testDF = paste(inDir,"/test/y_test.txt",sep=""),       
      subject_trainDF = paste(inDir,"/train/subject_train.txt",sep=""),
      X_trainDF = paste(inDir,"/train/X_train.txt",sep=""),
      y_trainDF = paste(inDir,"/train/y_train.txt",sep="")      
)

## Check if input dataset files exists and read them into the reused List
for ( i in seq_along(fileLst)) {
      if (!file.exists(fileLst[[i]]))
            stop("Missing file '", fileLst[[i]], "' in the input dataset.")
      fileLst[[i]] <- read.table(fileLst[[i]], header = FALSE, sep = "",
                                 stringsAsFactors = FALSE)
}

## Step1: Merges the training and the test sets to create one dataset.
##        row bind of train and test of {column bind of subject,
##                                       activity Id and features}

 myDF <- rbind(cbind(fileLst$subject_trainDF,fileLst$y_trainDF,fileLst$X_trainDF),
              cbind(fileLst$subject_testDF, fileLst$y_testDF, fileLst$X_testDF))

## Step4: Appropriately labels the dataset with descriptive variable names
##        transforming the primary dataset column names by replacing sequences
##        of strings "-"and "()" with a sigle"_"
          
names( myDF) <- c("Subject", "Activity",
                 gsub("_+","_",gsub("\\(\\)|-","_",fileLst$featuresDF[,2])))

##  Step2: Extracts only the measurements on the mean and standard deviation for
##         each measurement, i.e., only measure types variables found in primary
##         dataset (executed after Step4 use proper column names)

 myDF <-  myDF[,sort(grep("Subject|Activity|mean_|std_|meanFreq_",names( myDF)))]

print(names( myDF))

## Step3: Uses descriptive activity names to name the activities in the dataset
##        atribute activity factor to dataset 

 myDF$Activity <- factor( myDF$Activity,levels=fileLst$activityDF[,1],
                        labels=fileLst$activityDF[,2])

## Step5: Creates a second, independent tidy dataset with the average of each
##        variable for each activity and each subject.

meanDF <-aggregate( myDF[,-(1:2)], 
                    by=list( Subject=myDF$Subject, Activity=myDF$Activity),
                    FUN=mean, na.rm=TRUE)

##  store tidy dataset into file

write.table(meanDF, file = "average_X.txt", quote = FALSE, eol = "\n",
            row.names = FALSE)
meanDF
}
