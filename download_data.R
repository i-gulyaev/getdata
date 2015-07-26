# This module downloads and unpacks UCI HAR Dataset to wprking directory

downloadAndUnzip <- function () {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    filename <- "UCI HAR Dataset.zip"
    download.file(url, filename, method="curl")
    unzip(filename)
}

downloadAndUnzip()
