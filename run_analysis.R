################################
# This script provides a solution for the "Getting and cleaning data" project:
# Provides a tidy data set as required in the following instructions:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each 
# measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

run_analysis <- function(filename = "getdata_projectfile_dataset.zip") {
    
    # Checking if the data is available in the working directory
    if (!file.exists(filename)) {
        print("INFO: zip file not found")
        ### Getting the dataset, and unzipping the files
        file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        
        download.file(file_url, "./getdata_projectfile_dataset.zip", method = "curl")
        date_downloaded <- date()
    }
    # unziping the files
    unzip (filename, exdir = "./dataset/", junkpaths = TRUE)
    
    setwd("./dataset")
    
    # removing the descriptive files
    descriptive_files <- c("features_info.txt", "README.txt")
    file.copy(descriptive_files, "./..")
    file.remove(descriptive_files)
    
    # getting a list of all meaningful files
    files <- list.files("./")
    
    # loading all files in a list
    data <- lapply(files,read.table)
    
    # removing extensions to use then to identify the list items
    files_no_ext <- gsub(".txt", "", files)
    
    names(data) <- files_no_ext
    
    ### Merge the training and the test sets to create one data set.
    # No inertial data considered, as discussed in 
    # https://class.coursera.org/getdata-014/forum/thread?thread_id=30
    # more detail in README.md
    
    # merge X_train and X_test sets
    dataset <- rbind(data$X_test, data$X_train)
    
    # introduce the variable names as column names
    colnames(dataset) <- data$features$V2
    
    # merge y_train and y_test sets
    activities <- rbind(data$y_test, data$y_train)
    colnames(activities)<-"activity_id"
    
    # merge subjet_train and subject_test sets
    subjects <- rbind(data$subject_test, data$subject_train)
    colnames(subjects) <- "subject"
    
    # merge all three sets
    dataset <- cbind(dataset, activities, subjects)
    
    # clean current variable names to R naming conventions 
    #(see ?make.names for additional info)
    names <-names(dataset)
    valid_column <- gsub("\\.\\.", ".", names)
    valid_column_names <- make.names(valid_column, unique=TRUE, allow_ = TRUE)
    valid_column_names <- gsub("...", ".", valid_column_names)
    colnames(dataset) <- valid_column_names
    
    # To be able to run "dplyr" functions
    library(dplyr)
    table<- tbl_df(dataset)
    
    # Extracts only the measurements on the mean and standard deviation for each measurement. 
    # Keep only columns whose names contain "mean" or "std", 
    # in addition to subject and activity
    table <- select(table, grep("mean", colnames(table)), 
                    grep("std", colnames(table)), subject, activity_id)
    
    # arrange the activity information
    activity_detail <- data$activity_labels
    colnames(activity_detail) <- c("id", "activity")
    
    # Uses descriptive activity names to name the activities in the data set
    table <- merge(table, activity_detail, by.x = "activity_id", by.y = "id")
    
    # Appropriately labels the data set with descriptive variable names. 
    # All columns have appropriate names from previous steps
    # Remove activity_id column, it provides the same information than the
    # activity column, replicated data
    tidy_data <- select(table, -activity_id)
    
    # From the data set in step 4, create a second, independent tidy data set with 
    # the average of each variable for each activity and each subject.
    
    averages_tidy_dataset <- tidy_data %>%
        group_by (activity, subject) %>%  # group by activity and subject
        summarise_each(funs(mean))        # calculate averages for all columns except the ones we are grouping by
    
    # Update column names to reflect the changes to the variables
    # Variables now represent averages
    columns <- names(averages_tidy_dataset) 
    columns[3:length(columns)] <- paste(columns[3:length(columns)], sep = ".", "mean")
    names(averages_tidy_dataset) <- columns
    
    # upload your data set as a txt file created with write.table() using row.name=FALSE
    setwd("./../")
    write.table(averages_tidy_dataset, "./averages_dataset.txt", row.name = FALSE)
    write.table(colnames(averages_tidy_dataset), "./averages_labels.txt")
    # the file can be loaded as read.table("./averages_dataset.txt")
}