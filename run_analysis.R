# Getting and Cleaning Data Project 1
#
# You should create one R script called run_analysis.R that does the following. 
#    Merges the training and the test sets to create one data set.
#    Extracts only the measurements on the mean and standard deviation for each measurement. 
#    Uses descriptive activity names to name the activities in the data set
#    Appropriately labels the data set with descriptive variable names. 
#    From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

#setup
dir <- "UCI HAR Dataset";
dir_train <- "train";
dir_test <- "test";

#read files
features <- read.table(paste(dir, 'features.txt', sep="/"), header=FALSE);
activity <- read.table(paste(dir, 'activity_labels.txt', sep="/"), header=FALSE);

#read files - training dataset
subject_train <- read.table(paste(dir, dir_train, 'subject_train.txt', sep="/"), header=FALSE);
x_train <- read.table(paste(dir, dir_train, 'x_train.txt', sep="/"), header=FALSE);
y_train <- read.table(paste(dir, dir_train, 'y_train.txt', sep="/"), header=FALSE); 

#read files - test dataset
subject_test <- read.table(paste(dir, dir_test, 'subject_test.txt', sep="/"), header=FALSE);
x_test <- read.table(paste(dir, dir_test, 'x_test.txt', sep="/"), header=FALSE);
y_test <- read.table(paste(dir, dir_test, 'y_test.txt', sep="/"), header=FALSE); 

#set column names
colnames(features) <- c('feature_id','feature_dsc');
colnames(activity) <- c('activity_id','activity_dsc');
colnames(subject_train) <- "subject_id"
colnames(x_train) <- features[, 2]; 
colnames(y_train) <- "activity_id";
colnames(subject_test) <- "subject_id"
colnames(x_test) <- features[, 2]; 
colnames(y_test) <- "activity_id";

#combine data
train_dataset <- cbind(subject_train, x_train, y_train);
test_dataset <- cbind(subject_test, x_test, y_test);
dataset <- rbind(train_dataset, test_dataset);

#limit the data set to only the mean and standard deviation columns
col_names <- colnames(dataset); 
req_col_names <- (
                      grepl("activity..", col_names) | 
                      grepl("subject..", col_names) | 
                      (
                        grepl("-mean..", col_names) & 
                        !grepl("-meanFreq..", col_names) & 
                        !grepl("mean..-", col_names)
                      ) | 
                      (
                        grepl("-std..", col_names) & 
                        !grepl("-std()..-", col_names)
                      )
                   );

dataset <- dataset[req_col_names==TRUE];
dataset <- merge(dataset, activity, by='activity_id', all.x=TRUE);

#cleanup columns
dataset <- cbind(activity_id2 = dataset$activity_id, dataset);
dataset$activity_id <- dataset$activity_dsc;
dataset$activity_dsc <- NULL;
colnames(dataset)[2] <- "activity_dsc";
colnames(dataset)[1] <- "activity_id";

#update column names to user friendly names
col_names <- colnames(dataset);
col_names <- lapply(col_names, tolower);
col_names <- lapply(col_names, FUN = function(x) gsub("\\()", "", x));
col_names <- lapply(col_names, FUN = function(x) gsub("tbody", "time_body_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("fbody", "fft_body_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("tgravity", "time_gravity_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("acc", "acceleration_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("mag", "magnitude_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("gyro", "gyro_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("jerk", "jerk_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("body_body", "body_", x));
col_names <- lapply(col_names, FUN = function(x) gsub("-", "", x));
col_names <- lapply(col_names, FUN = function(x) gsub("_std", "_stddev", x));
colnames(dataset) <- col_names;

datasetA <-dataset;


#find average by activity and subjects
dataset$activity_dsc <- NULL;
dataset <- aggregate(dataset, by=list(activity_id2=dataset$activity_id, subject_id2=dataset$subject_id), mean);
dataset <- merge(dataset, activity, by='activity_id', all.x=TRUE);

#cleanup columns
dataset$subject_id2 <- dataset$activity_dsc;
dataset$activity_dsc <- NULL;
dataset$activity_id2 <- NULL;
colnames(dataset)[2] <- "activity_dsc";
datasetB <- dataset;


#output data
write.table(datasetB, 'tidyData.txt', row.names=FALSE);




