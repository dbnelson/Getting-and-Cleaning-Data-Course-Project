##You should create one R script called run_analysis.R that does the following.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("C:/Users/i63321/Downloads/UCI HAR Dataset")

#Step 1 - merge the training and test sets to create one data set
#load train data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#load test data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#create data sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

#Step 2 - extract only mean and standard deviation
features <- read.table("features.txt")
headers <- features[,2]

mean_and_std <- grepl("mean\\(\\)|std\\(\\)", headers)
mean_and_std[1:2] <- TRUE
x_data <- x_data[, mean_and_std]
names(x_data) <- features[mean_and_std, 2]


#Step 3 - name activities with descriptive names
activities <- read.table("activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"


#Step 4 - label the data set with descriptive variable names
names(subject_data) <- "subject"
combined <- cbind(x_data, y_data, subject_data)

#Step 5 - create tidy data set with the average of each variable for each activity and each subject
averages_data <- ddply(combined, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)
