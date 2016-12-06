# Codebook for the Getting and Cleaning Data assignment
The script produces two main dataframes: "data" and "summary". Both dataframes use the same variable names (column names) as explained below. The difference in the two dataframes is, that "data" contains the raw data while "summary" contains the mean of the variables for each subject-activity combination.

## Column Names
**subject**: a numeric ID for each test participant, ranging from 1 to 30
**activity**:	a descriptive character string describing the 6 different activities (STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

The remaining columns are named based on the information available [here](https://github.com/mathloe/Data_Cleaning/blob/master/UCI%20HAR%20Dataset/features_info.txt). They are variables describing the raw data collected by UCI. For additional details see the above linked file.
Each name consists of several parts:
* a prefix **t** or **f**, where **t** denotes signals time domain signals and **f** frequency domain signals
* A main descriptor **BodyAcc**, **BodyGyro** or **GravityGyro** which describe the source as either linear body acceleration, angular body acceleration or gravity acceleration respectively
* If the main descriptor is followed by **Jerk**, the respective variable is a jerk signal
* The letters **x**, **y** and **z** describe the three dimensions
* If the descriptor includes **Mag**, this denotes that the variable is the magnitude of the three-dimensional signal, calculated using the euclidean norm
* **mean** and **std** describe if the variable gives the mean or the standard deviation of the described signal
* variables starting with **angle** were obtained by averaging the respective signals in a signal window sample

Examplary, the variable **tGravityAcc.mean.x** means:
This variable is the mean (**mean**) of the gravitational acceleration (**GravityAcc**) in x-direction (**x**) and in the time-domain (**t**)