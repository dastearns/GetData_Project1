#Getting and Cleaning Data
<B>Project 1 - Standard Derivation and Mean bu Subect and Activity of Smartphones Data</B><BR>
<B>Daniel A Stearns</B><BR>
<B>September 24, 2015</B><P>

## Introduction

This assignment uses data from
the <a href="https://archive.ics.uci.edu/ml/datasets.html">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Human Activity Recognition Using Smartphones Data Set" which is available  o on the course web site: The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: 

<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

<b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ">Human Activity Recognition Using Smartphones Data Set</a> [61Mb]

<b>Description</b>: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

<b>Attributes:</b> The following descriptions of the variables in the dataset are taken
from
the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UCI
web site</a>:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


#Objectives
##Objective 1. Merges the training and the test sets to create one data set.
After configuring the environment, read the data into tables from the following files:

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt
Assign readable column names and combine into a single data set.

##Objective 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
"activity_id" 
"activity_dsc" 
"subject_id" 
"time_body_acceleration_magnitude_mean" 
"time_body_acceleration_magnitude_stddev" 
"time_gravity_acceleration_magnitude_mean" 
"time_gravity_acceleration_magnitude_stddev" 
"time_body_acceleration_jerk_magnitude_mean" 
"time_body_acceleration_jerk_magnitude_stddev" 
"time_body_gyro_magnitude_mean" 
"time_body_gyro_magnitude_stddev" 
"time_body_gyro_jerk_magnitude_mean" 
"time_body_gyro_jerk_magnitude_stddev" 
"fft_body_acceleration_magnitude_mean" 
"fft_body_acceleration_magnitude_stddev" 
"fft_body_acceleration_jerk_magnitude_mean" 
"fft_body_acceleration_jerk_magnitude_stddev" 
"fft_body_gyro_magnitude_mean" 
"fft_body_gyro_magnitude_stddev" 
"fft_body_gyro_jerk_magnitude_mean" 
"fft_body_gyro_jerk_magnitude_stddev"
XX

##Objective 3: Uses descriptive activity names to name the activities in the data set

XXX

##Objective 4: Appropriately labels the data set with descriptive variable names. 

XX

##Objective 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

XX
