

setwd("C:/Users/igory/Documents/GitHub/datasciencecoursera/Getting and Cleaning Data/w4/UCI HAR Dataset")


outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}
require("data.table")
require("reshape2")


X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

features <- read.table("./features.txt")[,2]
extract_features <- grepl("mean|std", features)

names(X_test) = features
activity_labels <- read.table("./activity_labels.txt")[,2]

y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
subject_test <- read.table("./test/subject_test.txt")
names(subject_test) = "subject"

X_test = X_test[,extract_features]
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

subject_train <- read.table("./train/subject_train.txt")
names(X_train) = features

X_train = X_train[,extract_features]

y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

train_data <- cbind(as.data.table(subject_train), y_train, X_train)

data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
