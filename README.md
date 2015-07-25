# getdata

This repository contains script *run_analisys.R* which combines training
and test sets of UCI HAR Dataset (*https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*)
to one dataset which contains records of activity type and measurements for each subject.
Resulting dataset is written to *tidy_dataset.txt* file in the working directory.


## Requirements
- script uses dplyr library v0.4. Make sure it is installed
- script assumes the dataset is in *UCI HAR Dataset* directory in working directory. So, data shall be downloaded and unpacked before script run

## Examples
*R < download_dataset.R*
*R < run_analisys.R --save*
