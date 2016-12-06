# Data_Cleaning
Project for the Coursera Course Getting and Cleaning Data

This repository contains the following
* [**UCI HAR Dataset**](https://github.com/mathloe/Data_Cleaning/tree/master/UCI%20HAR%20Dataset): a dataset on human activity recognition using smartphones, downloaded from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [**run_analysis.R**](https://github.com/mathloe/Data_Cleaning/blob/master/run_analysis.R): A script to analyse the UCI HAR Dataset, described in detail below
* [**codebook.md**](https://github.com/mathloe/Data_Cleaning/blob/master/codebook.md): a markdown file describing the output of the analysis

## The analysis script (run_analysis.R)
This script combines the test and train data from the UCI HAR Dataset, formats it, shortens it to include only mean and standard deviation values, and finally creates a summary of the data. The output are two datasets: the entire output data ("data") and the summary ("summary")

The steps executed in this script are as follows:

1. Read all necessary files from the UCI HAR Dataset and store them with descriptive variable names. The read datasets are:
	* **activity_labels**: this contains information how to code the numeric activity IDs to the respective descriptions
	* **test_subject/train_subject**: a list giving the subject of each single test respectively train observation
	* **test_y/train_y**: a list with the numeric IDs for each test/train observation
	* **test_x/train_x**: the main test/train data; it includes various variables calculated for each observation
	* **features**: a table describing each of the variables in test_x/train_x

2. Combine the three train and test datasets to one dataset each, using cbind. Next the two train and test datsets are combined into one complete dataset called "data" using rbind. This is possible, since both the train and test datset have the same variables (columns).

3. The naming of the columns in "data": the first two columns are called "subject" and activity as they consist of the data from "test_subject"/"train_subject" and "test_y"/"train_y". the following columns, made up of the data from "test_x"/"train_x" are named according to the information stored in "features".

4. The "data" dataset is limited to the desired columns using the select() function. Only the first two columns (subject and activity), as well as those columns containing either mean or standard deviation variables are kept.

5. The numeric values in the "data$activity" column are replaced with the respective descriptive character strings as defined in "activity_labels".

6. For the summary, the dataframe should contain the mean values of all variables for each subject-activity combination. Therefore the "data" dataframe is grouped by the two columns subject and activity. Then a new dataframe "summary" is created, giving the desired means for all variables.

Within this script functions from the libraries "plyr" and "dplyr" are used. For further details to the implementation, see the [run_analysis.R](https://github.com/mathloe/Data_Cleaning/blob/master/run_analysis.R) script and the comments there.