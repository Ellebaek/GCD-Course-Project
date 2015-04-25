library("plyr")
library("reshape2")

#1.Merges the training and the test sets to create one data set.
header <- read.table("features.txt")
head_names <- t(header)[2,]

test <- read.table("./test/X_test.txt")
train <- read.table("./train/X_train.txt")

data1 <- rbind(test,train)
colnames(data1) <- head_names


#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
cols <- sort(union(grep("mean\\(\\)", head_names),grep("std\\(\\)", head_names)))
data2 <- subset(data1, select=cols)


#3.Uses descriptive activity names to name the activities in the data set
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")

y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")

data3 <- cbind(rbind(y_test,y_train),rbind(subject_test,subject_train),data2)


#4.Appropriately labels the data set with descriptive variable names. 
colnames(data3)[1:2] <- c("ActivityId","SubjectId")
activity_names <- read.table("activity_labels.txt")
data4 <- merge(activity_names,data3,by.x="V1",by.y="ActivityId")
colnames(data4)[1:2] <- c("ActivityId","ActivityName")


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data5<- subset(data4, select=-c(ActivityId))

melt_data <- melt(data5, id=c("ActivityName","SubjectId"), measure.vars=head_names[cols])

tidy_data <- ddply(melt_data,.(ActivityName,SubjectId,variable),summarize,mean=mean(value))
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)