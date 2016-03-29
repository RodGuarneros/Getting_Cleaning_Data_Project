# Downloading and Unziping the data base (Human Activity Recognition 
# Using Smartphones Data Set).
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "wearable.zip", method = "curl")
unzip("./wearable.zip")
rm("./wearable.zip")
# It loads the train and test data sets and appends the two datasets into one data frame. 
TestX <- read.table("X_test.txt")
TrainX <- read.table("X_train.txt")
TestY <- read.table("y_test.txt")
TrainY <- read.table("y_train.txt")
subTrain <- read.table("subject_train.txt")
subTest <- read.table("subject_test.txt")
MergeX <- rbind(TrainX, TestX)
MergeY <- rbind(TrainY, TestY)
MergeSub <- rbind(subTrain,subTest)
# It extracts just the mean and standard deviation from the features data set. 
features <- read.table("features.txt")
meansd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
meansdX <- MergeX[, meansd]
# After cleaning the column names
names(meansdX) <- features[meansd, 2]
names(meansdX) <- tolower(names(meansdX))
names(meansdX) <- gsub("\\(|\\)", "", names(meansdX)) # in order to get better names
# Looking for the name of every activity and tolower().
Activities <- read.table("activity_labels.txt")
Activities <- tolower(as.character(Activities[,2]))
MergeY =  Activities[MergeY[,1]]
# The mean of activities and subjects are created into a separate tidy data set which is 
# exported into the Project folder as txt file; this is named average.txt.
MergeMaster <- cbind(MergeSub, meansdX, MergeY)
rename(MergerMaster, MergeY= activity)
str(MergeMaster)
write.table(MergeMaster, file = "dataf.txt", row.names = F)
#  Finally, creating a new tidy data set:
average <- aggregate(x=MergeMaster, by=list(activities=MergeMaster$MergeY, subj=MergeMaster$subject), FUN=mean)
average <- average[, !(colnames(average) %in% c("subj", "activity"))]
str(average)
write.table(average, "average.txt", row.names = F)