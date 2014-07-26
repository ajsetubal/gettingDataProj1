 README.md: 
==========
(explains how the script work and the files it uses.)

Script description:
=================
The run_analysis() script is used to read the  Human Activity Recognition Using Smartphones Dataset **-
UCI HAR Dataset -** and create a second, independent tidy data set where:
* Columns are the average and standard deviation measure types variables found in primary dataset;
* Rows for every activity performed by each subject w/ average of each variable;
* all in a single File.

Pre-conditions:
=============
To use this script, the UCI HAR Dataset file should be downloaded and unzipped in the local filesystem.
Using of local files was intended to improve script reliability facing web connection failures.
 (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Behavior:
========
When you call run_analysis() function, it will read data from the specified input directory, create a tidy  dataset, save it to file **"average_X.txt"** in current directory and return it.

Script Parameter:
===============
* inDir: is a character vector of length 1 containing the  root directory structured as published in UCI HAR Dataset. The default is the same name used in exported zip file.

Input Dataset:
============
The input dataset includes the following files:
(original zip file rows cardinality, in comments below, intended to clarify files relationships)

**./UCI HAR Dataset/**
*  .**x**   /activity_labels.txt          :List of 6 activity# and labels.
*  .**x**   /features.txt                 :List of 561 feature(col#) and labels.
*  .     /features_info.txt            :Information about the calculations.
*  .     /README.txt                   :Roadmap to the primary dataset.
*  .     /test/                        :Test observations partion.
*  .**x**       /subject_test.txt         :7352 subject# for each observ window.
*  .**x**       /X_test.txt               :7352 array w/ 561 features calculated
*  .                                    for each observation window readings.
*  .**x**       /y_test.txt               :7352 activity# for each obs window.
*  .         /Inertial Signals/        :7352 observ windows, each 128 readings.
*  .             /body_acc_x_test.txt  :Triaxial accelerat from accelerometer
*  .             /body_acc_y_test.txt  :(estimated body acceleration in 'Gs').
*  .             /body_acc_z_test.txt  :  " "
*  .             /body_gyro_x_test.txt :Triaxial Angular velocity from the
*  .             /body_gyro_y_test.txt :gyroscope (in 'radians/second').
*  .             /body_gyro_z_test.txt :  " "
*  .             /total_acc_x_test.txt :Triaxial accelerat from accelerometer
*  .             /total_acc_y_test.txt :(total acceleration 'Gs').
*  .             /total_acc_z_test.txt :  " "
*  .     /train/                       :Training observations partion
*  .**x**       /subject_train.txt        :2947 subject# for each observ window.
*  .**x**       /X_train.txt              :2947 array w/ 561 features calculated
*  .                                   for each observation window readings.
*  .**x**       /y_train.txt              :2947 activity# for each obs window.
*  .         /Inertial Signals/        :2947 observ windows, each 128 readings.
*  .             /body_acc_x_train.txt :Triaxial accelerat from accelerometer
*  .             /body_acc_y_train.txt :(estimated body acceleration in 'Gs').
*  .             /body_acc_z_train.txt :  " "
*  .             /body_gyro_x_train.txt:Triaxial Angular velocity from the
*  .             /body_gyro_y_train.txt:gyroscope (in 'radians/second').
*  .             /body_gyro_z_train.txt:  " "
*  .           /total_acc_x_train.txt:Triaxial accelerat from accelerometer
*  .             /total_acc_y_train.txt:(total acceleration 'Gs').
*  .             /total_acc_z_train.txt:  " "
*  .**(x)** files required to produce output dataset


Output File:
===========
The output file is a tidy data set with the following structure:
(full description in CodeBook.md)
X_1.csv	               :array for subject 1 w/ 80 features found
                        in primary data set features that are
                        46 mean value types variables,
                        33 standard deviation types variables
                        AND 1 activity label.
 
Other Document Files:
===========
CodeBook.md: describes the variables, the data, and transformations/work performed.
README.md  : explains how the script work and the files it uses.

Script Processing:
==============
Step 1:
--------
Merges the training and the test sets to create one data set.
  row bind of train and test of {column bind of subject, activity and features}
  (total 10299 observations)

Step 2:
--------
Extracts only the measurements on the mean(46) and standard deviation for each measurement(33), i.e., only measure types variables found in primary dataset. 
   (total + Suject + Activity label + 71 variables)

The selected variable labels can be summarized by the following RegExp:

 * t.*mean()    :Mean value
 * f.*mean()    :Average of the frequency components
 * f.*meanFreq():Weighted average of the frequency components (energy) to obtain a mean frequency
 * .*std()      :Standard deviation

Step 3:
--------
Uses "factor" for descriptive activity names to name the activities in the dataset atribute activity factor to dataset.

Step 4:
--------
Appropriately labels the column dataset with descriptive variable names transforming the primary dataset column names by "gsub"-replacing sequences of strings "-"and "()" with a sigle"_"
 
  Step 5:
--------
Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.


