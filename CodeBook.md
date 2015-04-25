# GCD Course Project Code Book
The raw data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Transformations performed
The R script called run_analysis.R does the following.
 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data description
The file called tidy_data.txt contains a tidy data set with the average of each variable for each activity and each subject.

## Variable description

ActivityName	- String (factor) 	-- Name of the activity which measurement is based upon (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 

SubjectId 		- Integer 			-- Id of the individual who carried out the activity.   

variable 		- String (factor) 	-- Name of the measurement variable from the raw data.

mean 			- Decimal (numeric)	-- Average of the corresponding variable. One average for each combination of activity, subject and variable. 