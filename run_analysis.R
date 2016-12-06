library(plyr)
library(dplyr)

# Reading and storing all necessary source files
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              stringsAsFactors = FALSE)
features <- read.table("UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)

test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")

train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")

# The various test and train datasets are bound by columns to one test and one
# train dataset.
test <- cbind(test_subject, test_y, test_x)
train <- cbind(train_subject, train_y, train_x)

# The test and train dataset are bound by row to one main dataset.
data <- rbind(test,train)

# Naming the columns of the dataset: the first two columns are subject and
# activity, the remaining columns are named according to the features dataset.
# As some names occur multiple times in features, the make.names() function is
# used to make the features into usable column names.
# gsub() function is called to remove unnecessary "." characters in the names.
features$V2 <- make.names(features$V2, unique = TRUE)
features$V2 <- gsub("\\.\\.\\.",".",features$V2)
features$V2 <- gsub("\\.\\.",".",features$V2)
features$V2 <- gsub("\\.$","",features$V2)
colnames(data) <- c("subject", "activity", features$V2)

# Limiting the data to only the variables for mean and standard deviation of
# each measurement. The subject and activity columns are kept. Mean frequency
# columns are ommited.
data <- select(data,subject,activity,contains("mean"),contains("std"),
               -contains("meanFreq"))

# The activity values are replaced with the descriptive names defined in
# activity_labels.
data$activity <- mapvalues(data$activity,activity_labels$V1,activity_labels$V2)

# For the final summary, the data is grouped by subject and activity. Afterwards
# the summarize_all function is used to calculate the mean of each variable

data <- group_by(data, subject, activity)
summary <- summarize_all(data, funs(mean))

# Clean up the workspace by removing all created datasets, except for the
# desired output (data and summary)
remove(activity_labels, features, test_subject, test_x, test_y, train_subject,
       train_x, train_y, test, train)
