# getdata

This repository contains scripts for downloading and cleanin data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Script `download_data.R` downloads data archive and unpacks it to working directory.

Script `run_analisys.R` combines train and test datasets of UCI HAR Dataset to on dataset which contains records of activity type and measurements for each subject.
Resulting dataset is written to `tidy_dataset.txt` file in the working directory.

## Requirements
- `run_analistys.R` script uses `dplyr` library v0.4. Make sure it is installed.
- `run_analistys.R` script assumes the dataset is in *UCI HAR Dataset* directory in working directory. So, data shall be downloaded and unpacked before script run using `download_data.R`.

## Examples
Download script:

`R < download_data.R --no-save`

Convert downloaded data to a tidy dataset:

`R < run_analisys.R --no-save`


Tidy dataset then can be loaded to R interpreter using following command:

`td <- read.table("tidy_dataset.txt")`
