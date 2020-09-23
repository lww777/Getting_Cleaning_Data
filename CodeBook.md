# Description

The data set represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
It relates to the wearable computing.
It is in a zip archive and stored in ".txt"" files.

This script performs operations as follows:
1. Downloading all of the needed libraries;
2. Downloading and unzipping the file;
3. Reading data from ".txt" files and processing it;
4. Creating data set by merging the others;
5. Creating new data set with the averages.

Variables:
* "url" variable contains files URL;
* "X_train", "X_test", "y_train", "y_test", "subjet_test", "subject_train" contain files from downloaded data;
* "features" variable contains features data;
* "label" variable contains activity_labels data;
* "X" variable contains all data related to X;
* "y" variable contains all data related to y;
* "subject" variable contains all data related to subject;
* "needed_features" variable contains variabels related only to mean or standard deviation;
* "data" variable contains all merged data;
* "tidy" variable contains data set with the average of each variable for each activity and each subject.
