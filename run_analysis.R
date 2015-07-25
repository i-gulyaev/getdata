## This mofule contains a set of ruoutinse to transform createTidyDataset
## to one tidy dataset which contains records of activity and activity
## measurements for each subject

library(dplyr)

## Function loads feature names from given file and
## selects only those features wich correspnds to
## mean and standard deviation of measurement.
## Return value: dataframe with feature id and feature name columns
getFeatureNames <- function(filename) {
    features <- tbl_df(read.table(filename, col.names=c("id", "name")))
    features <- filter(features, grepl("(\\-mean\\()|(\\-std\\()", name))
    features
}

## Function loads activity labels from given file.
## Return value: dataframe with label_id and activity columns
getActivityNames <- function(filename) {
    activity <- tbl_df(read.table(filename,
                                  col.names=c("label_id", "activity")))
    activity
}

## Function loads loabels from given file and assigns
## each label_id the activity name provided via activity dataframe
## returned by getActivityName function.
## Return value: dataframe with label_id and activity columns
getLabels <- function(filename, activity) {
    labels <- tbl_df(read.table(filename, col.names=c("label_id")))
    left_join(labels, activity)
}

## Function loads measurements from given file,  filters out
## those values which do not correspond to desired features
## provided as second parameter, assigns descriptive names
## to each feature.
## Return value: dataframe with columns correspond to features$name vector
getMeasurements <- function(filename, features) {
    measurements <- tbl_df(read.table(filename))
    measurements <- select(measurements, features$id)
    names(measurements) <- features$name
    measurements
}

## Function loads subject identifiers from given file
## Reutrn value: dataframe with subject column
getSubjects <- function(filename) {
    subjects <- tbl_df(read.table(filename, col.names=c("subject")))
    subjects
}


## Function creates dataset of subjects, labels and measurements from given files
## Return value: dataframe combined from results of getSubjects(), getLabels()
## and getMeasurements(). It contains records of activity type and measurements
## for each subject 
loadDataset <- function(m_file, l_file, s_file, features, activity) {
    labels <- getLabels(l_file, activity)
    measurements <- getMeasurements(m_file, features)
    subjects <- getSubjects(s_file)
    dataset <- bind_cols(subjects, labels, measurements)
    dataset
}

## Function creates tidy dataset by combining train and test data of
## UCI HAR Dataset files and writes the result to file tidy_dataset.txt
createTidyDataset <- function() {
    features <- getFeatureNames("UCI HAR Dataset/features.txt")
    activity <- getActivityNames("UCI HAR Dataset/activity_labels.txt")

    testSet <- loadDataset("UCI HAR Dataset/test/X_test.txt",
                           "UCI HAR Dataset/test/y_test.txt",
                           "UCI HAR Dataset/test/subject_test.txt",
                           features,
                           activity)

    trainSet  <- loadDataset("UCI HAR Dataset/train/X_train.txt",
                             "UCI HAR Dataset/train/y_train.txt",
                             "UCI HAR Dataset/train/subject_train.txt",
                             features,
                             activity)

    fullSet <- bind_rows(testSet, trainSet)
    tidyDataset <- fullSet %>%
        select(-label_id) %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

    write.table(tidyDataset, file="tidy_dataset.txt", row.names=FALSE)
}

createTidyDataset()
