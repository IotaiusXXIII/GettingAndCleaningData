#Project Getting and cleaning data

######################################## TRAIN DATA #####################################
#here we read train data. 
#with variable train_data we read data. With train_act we read train data on activity
#With subject_train we read train data on subject

train_data <- read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
train_act <- read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
subject_train <-read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")

######################################## TEST DATA #######################################
#here we read test data. 
#with variable test_data we read test data. With test_act we read test data on activity
#With test_train we read test data on subject

test_data <- read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
test_act <- read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
subject_test <-read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")

######################################## MERGING #########################################
#Here we bind all three parts of train and test data. For binding we use function cbind
#than we create dataset. Dataset is a data.frame object of both, train and test datasets

train <- cbind(subject_train, train_act, train_data)
test <- cbind(subject_test, test_act, test_data)

dataset <- rbind(train, test)
####################################### NAMING COLUMNS ###################################
#Here we naming columns. At the beginning we read data about variable names. Data are 
#stored in variable column_names_vector. At the beginning of that vector we append
#two names subject and activity, so that that we get column names for whole dataset.
#Than we transform all column names into lower cases and remove commas from names.
#Than we set up column names in dataset.


column_names_table <- read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt")
column_names_vector <- c(c("subject", "activity"), as.character(column_names_table$V2))
column_names_vector <- tolower(column_names_vector)
column_names_vector <- gsub(",", "", column_names_vector)

colnames(dataset) <- column_names_vector

#Here we extract those measurments which have '-mean()' and '-std()' phrase in their names
#Then we sort them from lower to highest and subset from original dataset.

mea <- grep("-mean()", column_names_vector, fixed = T)#looking for indexes of those columns which include mean()
std <- grep("-std()", column_names_vector, fixed = T)#looking for indexes of those columns which include sd()


mean_plus_std <- sort(c(mea, std))
dataset_mean_sd <- dataset[,c(1, 2, mean_plus_std)]

############################################# NAMING ACTIVITIES ###########################
#In this section we import descriptive activity names and store them into a variable called
#descriptive_activity_names_vector. Then we change numbers into activity names

descriptive_activity_names_table <- read.table("C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt")
descriptive_activity_names_vector <- as.character(descriptive_activity_names_table$V2)

dataset$activity <- factor(dataset$activity, c(1:6), labels = descriptive_activity_names_vector)

############################### TIDY DATASET #############################################
#Here we create a tidy dataset. We create it with aggregate function, where we calculate 
#mean of every used wariable based on activity and subject. Then we set up column names
#and create a txt file of tidy dataset in pur computer

tidy <- aggregate(dataset[,-c(1,2)], by = list(dataset$activity, dataset$subject), mean)

colnames(tidy)[c(1,2)] <- c("activity", "subject")

write.table(tidy, "C:\\Users\\iNejc\\Desktop\\predavanja_ostala\\coursera\\Data_science_specialization_John_Hopkins_University\\3Getting_and_cleaning\\tidy.txt", sep=",")

