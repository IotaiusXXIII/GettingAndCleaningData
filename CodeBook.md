# Code Book
This is a code book for run_analysis.R script. For more 
information read README file

## Train data
In this subsection we have three variables
* train_data - in this variable we read train data 
* train_act - in this variable we read activities in 
train data
* subject_train - in this variable we read subjects in
train data

## Test data
In this subsection we have three variables
* test_data - in this variable we read test data 
* test_act - in this variable we read activities in 
test data
* subject_test - in this variable we read subjects in
test data

## Merging
In this section we merge data, so that we get complete
train and test data. On the end we merge both of the and
create one dataset. In this section we have three 
variables
* train - where we bind subjects used in train data, 
their activities and data. We produce dataset based on
train data
* test - where we bind subjects used in test data, 
their activities and data. We produce dataset based on
test data
* dataset - where we merge both train and test datasets
into one

## Naming columns
In this subsection we have six variables
* column_name_table - where we read names of variables.
* column_name_vector - where we binded two names subject
and activity in front of variable names. We converted 
names into characters. Then we change all names into
lower cases and remove commas from names.

Then we naming columns in dataset variable.

Then we extract variables with -mean() and -std() from
column_name_vector. For this we used two variables
* mea - where we store indexes of column names in dataset 
which have word -mean() in it
* std - where we store indexes of column names in dataset 
which have word -mstd() in it

Then we combine those two variables into one named
mean_plus_std and sort it.
Then we extract those columns from varaible dataset and
store them into new varable named dataset_mean_std

## Naming activities
In this subsection we have two variables
* descriptive_activity_names_table - where we read 
activity names 
* descriptive_activity_names_vector - where we extract
names from table and converted them into character vector

Because activity was type integer we have to converted it
into factor variable. Then we rename it from numbers into
labels from descriptive_activity_names_vector

## Tidy dataset
In this subsection we create a tidy dataset which is stored
into variable name tidy. For creating a dataset we used 
function aggregate. On the end we write tidy dataset
on space in our computer. Tidy dataset is stored in .txt
format and values are separated with comma. 