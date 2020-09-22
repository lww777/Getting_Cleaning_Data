# This is a data processing script

# First, downloading all needed packages

install.packages(c("zip", "dplyr"))
library(zip)
library(dplyr)

# Second, downloading zip archive and unpacking it

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./archive_file.zip")
unzip("./archive_file.zip")

# Reading train data

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Reading test data

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Reading features and labels of activities

features <- read.table("./UCI HAR Dataset/features.txt")[2]
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[2]

# Creating X, renaming and subsetting its columns

X <- rbind(X_train, X_test)
colnames(X) <- features[,1]
needed_features <- features[grep("*mean*|*std*", features[, 1]), ]
X <- X[, needed_features]

# Creating y and labeling its values with activities

y <- rbind(y_train, y_test)
y <- factor(y[, 1], labels = labels[, 1])

# Creating subject

subject <- rbind(subject_train, subject_test)

# Merging all data and renaming columns

data <- cbind(X, y, subject)
data <- rename(data, activities = y, subject = V1)
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("tBody", "TimeBody", names(data))

# Creating a new data set with averages

tidy <- summarize_all(group_by(data, subject, activities), mean)
write.table(tidy, "./tidy_data.txt", row.name = FALSE )