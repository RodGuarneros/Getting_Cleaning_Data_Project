# Getting and Cleaning Data Project

The end of this repo is showing my skills to collect, clean and work with data bases as part of my formation in this subject.
The goal is to prepare tidy data that can be used for later analysis.

The data we're going to use are taken from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In regard to this source, I should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.

    In this step, I read the url file and create a zip file named "wearable.zip".
    Then I unzip this file and analyze the structure of every data file.
    Finally, I remove the original data file "weareable.zip" in order to optimize the space in the computer.

3. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Let's describe how all of every script work and how they are connected here:
