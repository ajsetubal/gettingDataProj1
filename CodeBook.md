CodeBook.md: describes the variables, the data, and transformations/work
             performed to produce this dataset.
==================================================================
Cousera Course - Johns Hopkins University
Getting and Cleaning Data Course Project
Course Project
July/2014
Version 1.0
==================================================================
Antonio Joaquim
==================================================================

Input Dataset Observations:
========================
The input data represent data collected  by:
	Human Activity Recognition Using Smartphones Dataset,
	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments that produced the primary (input Dataset) observations have been carried out
with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data and 30% the test data.

Transformation to new Tidy Dataset:
==============================
The transformation performed in this work to create the new Dataset can be summarized in 5 steps
  Step 1: merges the training and the test sets to create one data set.

  Step 2: extracts only the measurements on the mean and standard deviation for each measurement, i.e., only measure types variables found in primary dataset.

  Step 3: uses descriptive activity names to name the activities in the dataset atribute activity factor to dataset.

  Step 4: apropriately labels the column dataset with descriptive variable names.

  Step 5:
  Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.


Input Dataset:
============
URL to the input data zip file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Input Dataset Files:
=================
The input dataset includes the following files:

   ./UCI HAR Dataset/
  *   /activity_labels.txt          :Links the class labels with their activity name.
  *   /features.txt                 :List of all features.
       /features_info.txt            :Shows information about the variables used on the feature vector.
       /README.txt                   :Roadmap to the primary dataset.
       /test/                        :Test observation set partition
  *       /subject_test.txt         :7352 subject# for each observ window.
  *       /X_test.txt               :7352 array w/ 561 features calculated
                                      for each observation window readings.
  *       /y_test.txt               :7352 activity# for each obs window.
           /Inertial Signals/        :7352 observ windows, each 128 readings.
               /body_acc_x_test.txt  :Triaxial accelerat from accelerometer
               /body_acc_y_test.txt  :(estimated body acceleration in 'Gs').
               /body_acc_z_test.txt  :  " "
               /body_gyro_x_test.txt :Triaxial Angular velocity from the
               /body_gyro_y_test.txt :gyroscope (in 'radians/second').
               /body_gyro_z_test.txt :  " "
               /total_acc_x_test.txt :Triaxial accelerat from accelerometer
               /total_acc_y_test.txt :(total acceleration 'Gs').
               /total_acc_z_test.txt :  " "
       /train/                       :Training observation set partition
  *       /subject_train.txt        :2947 subject# for each observ window.
  *       /X_train.txt              :2947 array w/ 561 features calculated
                                     for each observation window readings.
  *       /y_train.txt              :2947 activity# for each obs window.
           /Inertial Signals/        :2947 observ windows, each 128 readings.
               /body_acc_x_train.txt :Triaxial accelerat from accelerometer
               /body_acc_y_train.txt :(estimated body acceleration in 'Gs').
               /body_acc_z_train.txt :  " "
               /body_gyro_x_train.txt:Triaxial Angular velocity from the
               /body_gyro_y_train.txt:gyroscope (in 'radians/second').
               /body_gyro_z_train.txt:  " "
               /total_acc_x_train.txt:Triaxial accelerat from accelerometer
               /total_acc_y_train.txt:(total acceleration 'Gs').
               /total_acc_z_train.txt:  " "

  (*) files required to produce output dataset

Input Dataset Variables:
=====================
Only the measurements on the means(46) and standard deviations(33) measure type variable are required to create this new tidy dataset. Those input variables detailed description is available in "features_info.txt" file in the primary Dataset zip file. All those variables data are stored in X_test.txt and X_train.txt files in the primary Dataset. Below is a list of column number and label for all required variables grouped per measure type:

 Mean value input measure:
                1 tBodyAcc-mean()-X                        121 tBodyGyro-mean()-X
                2 tBodyAcc-mean()-Y                        122 tBodyGyro-mean()-Y
                3 tBodyAcc-mean()-Z                        123 tBodyGyro-mean()-Z
                41 tGravityAcc-mean()-X                    161 tBodyGyroJerk-mean()-X
                42 tGravityAcc-mean()-Y                    162 tBodyGyroJerk-mean()-Y
                43 tGravityAcc-mean()-Z                    163 tBodyGyroJerk-mean()-Z
                81 tBodyAccJerk-mean()-X                   201 tBodyAccMag-mean()
                82 tBodyAccJerk-mean()-Y                   214 tGravityAccMag-mean()
                83 tBodyAccJerk-mean()-Z                   227 tBodyAccJerkMag-mean()
                                                           240 tBodyGyroMag-mean()
                                                           253 tBodyGyroJerkMag-mean()

 Average of the frequency components:
                266 fBodyAcc-mean()-X                      424 fBodyGyro-mean()-X
                267 fBodyAcc-mean()-Y                      425 fBodyGyro-mean()-Y
                268 fBodyAcc-mean()-Z                      426 fBodyGyro-mean()-Z
                345 fBodyAccJerk-mean()-X                  503 fBodyAccMag-mean()
                346 fBodyAccJerk-mean()-Y                  516 fBodyBodyAccJerkMag-mean()
                347 fBodyAccJerk-mean()-Z                  529 fBodyBodyGyroMag-mean()
                                                           542 fBodyBodyGyroJerkMag-mean()

 Weighted average of the frequency components (energy) to obtain a mean frequency:
                294 fBodyAcc-meanFreq()-X                  452 fBodyGyro-meanFreq()-X
                295 fBodyAcc-meanFreq()-Y                  453 fBodyGyro-meanFreq()-Y
                296 fBodyAcc-meanFreq()-Z                  454 fBodyGyro-meanFreq()-Z
                373 fBodyAccJerk-meanFreq()-X              513 fBodyAccMag-meanFreq()
                374 fBodyAccJerk-meanFreq()-Y              526 fBodyBodyAccJerkMag-meanFreq()
                375 fBodyAccJerk-meanFreq()-Z              539 fBodyBodyGyroMag-meanFreq()
                                                           552 fBodyBodyGyroJerkMag-meanFreq()

 Standard deviation measure:
                4 tBodyAcc-std()-X                         202 tBodyAccMag-std()
                5 tBodyAcc-std()-Y                         215 tGravityAccMag-std()
                6 tBodyAcc-std()-Z                         228 tBodyAccJerkMag-std()
                44 tGravityAcc-std()-X                     241 tBodyGyroMag-std()
                45 tGravityAcc-std()-Y                     254 tBodyGyroJerkMag-std()
                46 tGravityAcc-std()-Z                     269 fBodyAcc-std()-X
                84 tBodyAccJerk-std()-X                    270 fBodyAcc-std()-Y
                85 tBodyAccJerk-std()-Y                    271 fBodyAcc-std()-Z
                86 tBodyAccJerk-std()-Z                    348 fBodyAccJerk-std()-X
                124 tBodyGyro-std()-X                      349 fBodyAccJerk-std()-Y
                125 tBodyGyro-std()-Y                      350 fBodyAccJerk-std()-Z
                126 tBodyGyro-std()-Z                      427 fBodyGyro-std()-X
                164 tBodyGyroJerk-std()-X                  428 fBodyGyro-std()-Y
                165 tBodyGyroJerk-std()-Y                  429 fBodyGyro-std()-Z
                166 tBodyGyroJerk-std()-Z                  504 fBodyAccMag-std()
                                                           517 fBodyBodyAccJerkMag-std()
                                                           530 fBodyBodyGyroMag-std()
                                                           543 fBodyBodyGyroJerkMag-std()

Additional Input Dataset information:
================================
The 'activity_labels.txt' file contains a list of activity labels.
The  'test/y_test.txt' and 'train/y_train.txt' file contains activity indices to the label list that identify the activity performed by subject.
The  'test/subject_test.txt' and 'train/subject_train.txt' contains  an id that identify the subject who performed the correponding activity.

Tidy Dataset Variables:
==========================
The 'average_X.txt' file contains the new tidy Dataset with the following column variables variables:
Subject			:contains an integer form 1 to 30 that is the subject who performed the activity.
Activity		:contains a string that identify the performed activity:
                         WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
tBodyAcc_mean_X		:average of column 1 tBodyAcc-mean()-X
tBodyAcc_mean_Y		:average of column 2 tBodyAcc-mean()-Y
tBodyAcc_mean_Z		:average of column 3 tBodyAcc-mean()-Z
tBodyAcc_std_X		:average of column 4 tBodyAcc-std()-X
tBodyAcc_std_Y		:average of column 5 tBodyAcc-std()-Y
tBodyAcc_std_Z		:average of column 6 tBodyAcc-std()-Z
tGravityAcc_mean_X	:average of column 41 tGravityAcc-mean()-X
tGravityAcc_mean_Y	:average of column 42 tGravityAcc-mean()-Y
tGravityAcc_mean_Z	:average of column 43 tGravityAcc-mean()-Z
tGravityAcc_std_X	:average of column 44 tGravityAcc-std()-X
tGravityAcc_std_Y	:average of column 45 tGravityAcc-std()-Y
tGravityAcc_std_Z	:average of column 46 tGravityAcc-std()-Z
tBodyAccJerk_mean_X	:average of column 81 tBodyAccJerk-mean()-X
tBodyAccJerk_mean_Y	:average of column 82 tBodyAccJerk-mean()-Y
tBodyAccJerk_mean_Z	:average of column 83 tBodyAccJerk-mean()-Z
tBodyAccJerk_std_X	:average of column 84 tBodyAccJerk-std()-X
tBodyAccJerk_std_Y	:average of column 85 tBodyAccJerk-std()-Y
tBodyAccJerk_std_Z	:average of column 86 tBodyAccJerk-std()-Z
tBodyGyro_mean_X	:average of column 121 tBodyGyro-mean()-X
tBodyGyro_mean_Y	:average of column 122 tBodyGyro-mean()-Y
tBodyGyro_mean_Z	:average of column 123 tBodyGyro-mean()-Z
tBodyGyro_std_X		:average of column 124 tBodyGyro-std()-X
tBodyGyro_std_Y		:average of column 125 tBodyGyro-std()-Y
tBodyGyro_std_Z		:average of column 126 tBodyGyro-std()-Z
tBodyGyroJerk_mean_X	:average of column 161 tBodyGyroJerk-mean()-X
tBodyGyroJerk_mean_Y	:average of column 162 tBodyGyroJerk-mean()-Y
tBodyGyroJerk_mean_Z	:average of column 163 tBodyGyroJerk-mean()-Z
tBodyGyroJerk_std_X	:average of column 164 tBodyGyroJerk-std()-X
tBodyGyroJerk_std_Y	:average of column 165 tBodyGyroJerk-std()-Y
tBodyGyroJerk_std_Z	:average of column 166 tBodyGyroJerk-std()-Z
tBodyAccMag_mean_	:average of column 201 tBodyAccMag-mean()
tBodyAccMag_std_	:average of column 202 tBodyAccMag-std()
tGravityAccMag_mean_	:average of column 214 tGravityAccMag-mean()
tGravityAccMag_std_	:average of column 215 tGravityAccMag-std()
tBodyAccJerkMag_mean_	:average of column 227 tBodyAccJerkMag-mean()
tBodyAccJerkMag_std_	:average of column 228 tBodyAccJerkMag-std()
tBodyGyroMag_mean_	:average of column 240 tBodyGyroMag-mean()
tBodyGyroMag_std_	:average of column 241 tBodyGyroMag-std()
tBodyGyroJerkMag_mean_	:average of column 253 tBodyGyroJerkMag-mean()
tBodyGyroJerkMag_std_	:average of column 254 tBodyGyroJerkMag-std()
fBodyAcc_mean_X		:average of column 266 fBodyAcc-mean()-X
fBodyAcc_mean_Y		:average of column 267 fBodyAcc-mean()-Y
fBodyAcc_mean_Z		:average of column 268 fBodyAcc-mean()-Z
fBodyAcc_std_X		:average of column 269 fBodyAcc-std()-X
fBodyAcc_std_Y		:average of column 270 fBodyAcc-std()-Y
fBodyAcc_std_Z		:average of column 271 fBodyAcc-std()-Z
fBodyAcc_meanFreq_X	:average of column 294 fBodyAcc-meanFreq()-X
fBodyAcc_meanFreq_Y	:average of column 295 fBodyAcc-meanFreq()-Y
fBodyAcc_meanFreq_Z	:average of column 296 fBodyAcc-meanFreq()-Z
fBodyAccJerk_mean_X	:average of column 345 fBodyAccJerk-mean()-X
fBodyAccJerk_mean_Y	:average of column 346 fBodyAccJerk-mean()-Y
fBodyAccJerk_mean_Z	:average of column 347 fBodyAccJerk-mean()-Z
fBodyAccJerk_std_X	:average of column 348 fBodyAccJerk-std()-X
fBodyAccJerk_std_Y	:average of column 349 fBodyAccJerk-std()-Y
fBodyAccJerk_std_Z	:average of column 350 fBodyAccJerk-std()-Z
fBodyAccJerk_meanFreq_X	:average of column 373 fBodyAccJerk-meanFreq()-X
fBodyAccJerk_meanFreq_Y	:average of column 374 fBodyAccJerk-meanFreq()-Y
fBodyAccJerk_meanFreq_Z	:average of column 375 fBodyAccJerk-meanFreq()-Z
fBodyGyro_mean_X	:average of column 424 fBodyGyro-mean()-X
fBodyGyro_mean_Y	:average of column 425 fBodyGyro-mean()-Y
fBodyGyro_mean_Z	:average of column 426 fBodyGyro-mean()-Z
fBodyGyro_std_X		:average of column 427 fBodyGyro-std()-X
fBodyGyro_std_Y		:average of column 428 fBodyGyro-std()-Y
fBodyGyro_std_Z		:average of column 429 fBodyGyro-std()-Z
fBodyGyro_meanFreq_X	:average of column 452 fBodyGyro-meanFreq()-X
fBodyGyro_meanFreq_Y	:average of column 453 fBodyGyro-meanFreq()-Y
fBodyGyro_meanFreq_Z	:average of column 454 fBodyGyro-meanFreq()-Z
fBodyAccMag_mean_	:average of column 503 fBodyAccMag-mean()
fBodyAccMag_std_	:average of column 504 fBodyAccMag-std()
fBodyAccMag_meanFreq_	:average of column 513 fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag_mean_	:average of column 516 fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag_std_	:average of column 517 fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag_meanFreq_	:average of column 526 fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag_mean_		:average of column 529 fBodyBodyGyroMag-mean()
fBodyBodyGyroMag_std_		:average of column 530 fBodyBodyGyroMag-std()
fBodyBodyGyroMag_meanFreq_	:average of column 539 fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag_mean_	:average of column 542 fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag_std_	:average of column 543 fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag_meanFreq_	:average of column 552 fBodyBodyGyroJerkMag-meanFreq()



