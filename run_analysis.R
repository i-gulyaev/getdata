
library(dplyr)


getFeatures <- function(featurefile) {
    features <- tbl_df(read.table(featurefile, col.names=c("id", "name")))
    features <- filter(features, grepl("(\\-mean\\()|(\\-std\\()", name))
    features
}


getLabels <- function(labelfile, activityfile) {
    labels <- tbl_df(read.table(labelfile, col.names=c("label")))
    activity <- tbl_df(read.table(activityfile, col.names=c("label", "name")))
    left_join(labels, activity)
}

createDataset <- function(datafile, features , subjectfile, labels) {
    
    measurements <- tbl_df(read.table(datafile))

    measurements <- select(measurements, features$id)
    names(measurements) <- features$name

    subject <- tbl_df(read.table(subjectfile, col.names=c("subject")))
    
    dataset <- bind_cols(subject, labels, measurements)


    dataset
    ## set names to dataset from features
    
    ## select apropriate columns with mean in std suffix
    
    ## combine datafile, subjectfile and labels

}


features <- getFeatures("UCI HAR Dataset/features.txt")
labels <- getLabels("UCI HAR Dataset/test/y_test.txt", "UCI HAR Dataset/activity_labels.txt")
ds <- createDataset("UCI HAR Dataset/test/X_test.txt", features, "UCI HAR Dataset/test/subject_test.txt", labels)
