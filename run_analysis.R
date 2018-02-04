##### Justin Owens
##### Getting and Cleaning Data
##### Peer Graded Assignment 2/4/2018

library(data.table)
library(reshape2)
require(dplyr)
require(tidyr)

# If the data doesn't exist, download it
if(!dir.exists('./UCI HAR Dataset')){
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', './UCI HAR Dataset.zip')
} else {
  print('UCI Hard Dataset already exists.')
  setwd('./UCI HAR Dataset/')
}

# Read in activity labels
activity_labels = fread('./activity_labels.txt', sep = ' ')
names(activity_labels) = c("activity_index", "activity_description")
print('Finished sourcing activity labels.')

# Read in feature descriptions
features = fread('./features.txt', sep = ' ')
names(features) = c("feature_index", "feature_description")
features$feature_index = paste0('V',features$feature_index)
print('Finished sourcing feature descriptions.')

# Read in the test data
x_test = fread('./test/X_test.txt', sep = ' ')
#names(x_test) = features$feature_index
print('Finished sourcing X test data.')

y_test = fread('./test/y_test.txt', sep = ' ')
names(y_test) = c('activity_label')
print('Finished sourcing y test data.')

subject_test = fread('./test/subject_test.txt', sep = ' ')
names(subject_test) = c('subject')
print('Finished sourcing subject test data.')

# Read in the training data
x_train = fread('./train/X_train.txt', sep = ' ')
#names(x_train) = features$feature_index
print('Finished sourcing X train data.')

y_train = fread('./train/y_train.txt', sep = ' ')
names(y_train) = c('activity_label')
print('Finished sourcing y train data.')

subject_train = fread('./train/subject_train.txt', sep = ' ')
names(subject_train) = c('subject')
print('Finished sourcing subject train data.')

# Merge the training and test data sets to create a single data set
merged_test = cbind(subject_test, y_test, x_test)
merged_train = cbind(subject_train, y_train, x_train)
merged_all = rbind(merged_test, merged_train)
merged_all$activity_label = sapply(merged_all$activity_label, function(x) {activity_labels[which(activity_labels$activity_index == x),]$activity_description})
merged_all$subject = as.character(merged_all$subject)
merged_all$activity_label = as.character(merged_all$activity_label)
print('Finished merging all data sets.')

# Create long dataset and source measurement names
merged_all_long = melt(merged_all, id.vars=c("subject", "activity_label"), measure.vars = 3:ncol(merged_all))
names(merged_all_long) = c('subject', 'activity_label', 'measurement_name', 'value')
merged_all_long$measurement_name = as.character(merged_all_long$measurement_name)
merged_all_long = merge(merged_all_long, features, by.x = 'measurement_name', by.y = 'feature_index', all.x = TRUE)
merged_all_long$measurement_name = merged_all_long$feature_description
merged_all_long$feature_description = NULL

# Extract some text data from measurement name for ease of use and cleanliness
merged_all_long$strsplit = strsplit(x = as.character(merged_all_long$measurement_name), split = '-')
merged_all_long$variable = sapply(merged_all_long$strsplit, function(x) {gsub('[0-9]+', '', x[2])})
merged_all_long$variable[which(is.na(merged_all_long$variable))] = 'angle()'

merged_all_long$signal = sapply(merged_all_long$strsplit, function(x) {x[1]})
merged_all_long$signal[which(grepl('angle', merged_all_long$signal))] = NA

merged_all_long$strsplit = NULL

# subset necessary data for assignment and convert to correct data types
q1q4dataset = merged_all_long[which(merged_all_long$variable %in% c("mean()", "std()")),]
q1q4dataset = q1q4dataset[,c(2,3,1,6,5,4)]
q1q4dataset$subject = as.factor(q1q4dataset$subject)
q1q4dataset$activity_label = as.factor(q1q4dataset$activity_label)
q1q4dataset$measurement_name = as.factor(q1q4dataset$measurement_name)
q1q4dataset$signal = as.factor(q1q4dataset$signal)
q1q4dataset$variable = as.factor(q1q4dataset$variable)
q1q4dataset$value = as.numeric(q1q4dataset$value)

names(q1q4dataset) = c('subject', 'activity_label', 'variable', 'signal', 'variable_type', 'value')

#From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.

q5datasetmean = aggregate(q1q4dataset$value, by = list(q1q4dataset$subject, q1q4dataset$activity_label, q1q4dataset$variable), FUN = mean)
names(q5datasetmean) = c('subject', 'activity_label', 'variable', 'average_value')

setwd('../')
write.table(q1q4dataset, file = './dataset1.txt', row.names = FALSE)
write.table(q5datasetmean, file = './dataset2.txt', row.names = FALSE)
