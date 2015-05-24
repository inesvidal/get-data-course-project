#Instructions to execute the script#
##Setting working directory##
Make sure you define your working directory with: 
```
setwd("path")
```
##Running the script##
Execute the script:
```
run_analysis(filename.zip)
```
*filename* is the name of a zip file that contains the Samsung data to be analysed. If the file is not provided, the script will download the source dataset (ZIP file). It will be saved in the working directory. 
A new directory *dataset* will be created with the unzipped files that contain the data (using either the existing file or the downloaded file).
The resulting tidy dataset will be stored in your working directory as a file *averages_dataset.txt*. This file can be loaded running: 
```
url <- "https://s3.amazonaws.com/coursera-uploads/user-f96e983fe124cac29d52475b/973501/asst-3/bdca6c40020511e5b476a914a92fd179.txt"
download.file(file_url, "./averages_dataset.txt", method = "curl")
tidy_data <- read.table("./averages_dataset.txt")
View(tidy_data)
```
##Process description###
Data cleaning process:
* Check if the *filename.zip* file exists in the working directory
    * If the file does not exist: download the ZIP file from the URL provided in the assignment description.
* Decompress in a directory *dataset*
* Keep only data files (move README and INFO files to parent directory)
* Load all data files in a list of tables, one element for each file
* Generate list element names using file names without extensions
* Merge significative data in test and train datasets (the files in the *Inertial Signal* folder have not been considered because they don't contain information about averages or standard deviations, and therefore would be discarded later, [see the course Forum discussion](https://class.coursera.org/getdata-014/forum/thread?thread_id=30))
    * Include the variable names as column names, making sure they meet the conventions in R ((see *?make.names* for additional information).
* Merge in *activity* and *subjects* information
* Keep only the columns that refer to *averages (mean)* or standard deviations (std)*
* Include descriptive activity names in the dataset
* Remove columns with redundant data
* Calculate the average of each column for each activity and individual.
* Upload the dataset as a *txt file*

##Additional considerations##
* In the creation of the script "run_Analisys.R" I have followed the conclussions of the [discussion on Tidy data on the course Forums](https://class.coursera.org/getdata-014/forum/thread?thread_id=31)
* The file [Codebook.md](https://github.com/inesvidal/get-data-course-project/blob/master/CodeBook.md) describes the the variables in the dataset.
