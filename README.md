# Introduction
Copied from course page. The purpose of this project is to demonstrate your ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that can be used for later 
analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github 
repository with your script for performing the analysis, and 3) a code book that describes the 
variables, the data, and any transformations or work that you performed to clean up the data called 
CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains 
how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for 
example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
advanced algorithms to attract new users. The data linked to from the course website represent data 
collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is 
available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and 
each subject. 
Good luck!

## About script
In script we use absolute path to access the data.
 
### Train data
Firstly we read train data. 

### Test data
Then we repeat the same thing on test data.

### Merging
Then we merge data. We create one dataset including both train and test data. We also create a vector 
of column names.

### Naming columns
Here we naming columns. At the beginning we read data about variable names. Data are 
stored in variable column_names_vector. At the beginning of that vector we append
two names subject and activity, so that that we get column names for whole dataset.
Than we transform all column names into lower cases and remove commas from names.
Than we set up column names in dataset.
Then we extract those measurments which have '-mean()' and '-std()' phrase in their names
Then we sort them from lower to highest and subset from original dataset.

### Naming activities
In this section we import descriptive activity names.

### Tidy dataset
Here we create a tidy dataset. We create it with aggregate function, where we calculate 
mean of every used wariable based on activity and subject. Then we set up column names
and create a txt file of tidy dataset in our computer.
