# Getting and Cleaning Data Project

The end of this repo is showing my skills to collect, clean and work with data bases as part of my formation in this subject.
The goal is to prepare tidy data that can be used for later analysis.

The data we're going to use are taken from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In regard to this source, I should create one R script called run_analysis.R that does the following steps. Let's describe how all of every script work and how they are connected here:

1. Getting and merging the training and the test sets to create one data set.

    In this step, I read the url file and create a zip file named "wearable.zip".
    Then I unzip this file and analyze the structure of every data file in the directory named "UCI HAR Dataset".
    Finally, I remove the original data file "weareable.zip" in order to optimize the space in the computer.
    
    Having in mind that we have two sorts of tests and train (X, Y and Subjects), we need to create four objects before to       merge all in a data base with rbind() function.
    >- TestX <- read.table("X_test.txt")
    >- TrainX <- read.table("X_train.txt")
    >- TestY <- read.table("y_test.txt")
    >- TrainY <- read.table("y_train.txt")
    >- subTrain <- read.table("subject_train.txt")
    >- MergeX <- rbind(TrainX, TestX)
    >- MergeY <- rbind(TrainY, TestY)
    >- MergeSub <- rbind(subTrain,subTest)

2. Extracts only the measurements on the mean and standard deviation for each measurement.
    
    Before getting measures such as mean and standard deviation we need to consider the features described by the file           "features.txt" using the grep () function
    
    >- features <- read.table("features.txt")
    >- meansd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
    >- meansdX <- MergeX[, meansd]

3. Cleaning the column names, these are applied to the x data frame.

    >- names(meansdX) <- features[meansd, 2]
    >- names(meansdX) <- tolower(names(meansdX))
    >- names(meansdX) <- gsub("\\(|\\)", "", names(meansdX)) # in order to get better names

4.  Looking for the name of every activity and tolower() those names.

    >- Activities <- read.table("activity_labels.txt")
    >- Activities <- tolower(as.character(Activities[,2]))
    >- MergeY =  Activities[MergeY[,1]]

5. The three data sets, MergeY, MergeMaster and MergeSub, are merged. Then, it is exported as a txt file into the Project folder in the same working directory, named merged.txt. The mean of activities and subjects are created into a separate tidy data set which is exported into the Project folder as txt file; this is named average.txt.

    >- MergeMaster <- cbind(MergeSub, meansdX, MergeY)
    >- rename(MergerMaster, MergeY= activity)
    >- str(MergeMaster)
    >- write.table(MergeMaster, file = "dataf.txt", row.names = F)

6. Finally, creating a new tidy data set:

    >- average <- aggregate(x=MergeMaster, by=list(activities=MergeMaster$MergeY, subj=MergeMaster$subject), FUN=mean)
    >- average <- average[, !(colnames(average) %in% c("subj", "activity"))]
    >- str(average)
    >- write.table(average, "average.txt", row.names = F)
