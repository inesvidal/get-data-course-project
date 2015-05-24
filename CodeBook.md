#Code Book#
This document describes the variables in the tidy dataset produced then the [Samsung dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is analysed using the "run_analysis.R" script.
Considering the modifications described in the file [README.md](https://github.com/inesvidal/get-data-course-project/blob/master/README.md), in the next section the different variables contained in the dataset will be described.

## Data description ##

The dataset has been produced from a raw dataset containing measures of sensors in a mobile device for 30 individuals performing 6 different activities. With the processing described in the file [README.md](https://github.com/inesvidal/get-data-course-project/blob/master/README.md) we have obtained average measures (per activity and per subject (person)) of 79 different variables from the original dataset (see description below).

1. activity
2. subject
3. tBodyAcc.mean...X.mean
4. tBodyAcc.mean...Y.mean
5. tBodyAcc.mean...Z.mean
6. tGravityAcc.mean...X.mean
7. tGravityAcc.mean...Y.mean
8. tGravityAcc.mean...Z.mean
9. tBodyAccJerk.mean...X.mean
10. tBodyAccJerk.mean...Y.mean
11. tBodyAccJerk.mean...Z.mean
12. tBodyGyro.mean...X.mean
13. tBodyGyro.mean...Y.mean
14. tBodyGyro.mean...Z.mean
15. tBodyGyroJerk.mean...X.mean
16. tBodyGyroJerk.mean...Y.mean
17. tBodyGyroJerk.mean...Z.mean
18. tBodyAccMag.mean...mean
19. tGravityAccMag.mean...mean
20. tBodyAccJerkMag.mean...mean
21. tBodyGyroMag.mean...mean
22. tBodyGyroJerkMag.mean...mean
23. fBodyAcc.mean...X.mean
24. fBodyAcc.mean...Y.mean
25. fBodyAcc.mean...Z.mean
26. fBodyAcc.meanFreq...X.mean
27. fBodyAcc.meanFreq...Y.mean
28. fBodyAcc.meanFreq...Z.mean
29. fBodyAccJerk.mean...X.mean
30. fBodyAccJerk.mean...Y.mean
31. fBodyAccJerk.mean...Z.mean
32. fBodyAccJerk.meanFreq...X.mean
33. fBodyAccJerk.meanFreq...Y.mean
34. fBodyAccJerk.meanFreq...Z.mean
35. fBodyGyro.mean...X.mean
36. fBodyGyro.mean...Y.mean
37. fBodyGyro.mean...Z.mean
38. fBodyGyro.meanFreq...X.mean
39. fBodyGyro.meanFreq...Y.mean
40. fBodyGyro.meanFreq...Z.mean
41. fBodyAccMag.mean...mean
42. fBodyAccMag.meanFreq...mean
43. fBodyBodyAccJerkMag.mean...mean
44. fBodyBodyAccJerkMag.meanFreq...mean
45. fBodyBodyGyroMag.mean...mean
46. fBodyBodyGyroMag.meanFreq...mean
47. fBodyBodyGyroJerkMag.mean...mean
48. fBodyBodyGyroJerkMag.meanFreq...mean
49. tBodyAcc.std...X.mean
50. tBodyAcc.std...Y.mean
51. tBodyAcc.std...Z.mean
52. tGravityAcc.std...X.mean
53. tGravityAcc.std...Y.mean
54. tGravityAcc.std...Z.mean
55. tBodyAccJerk.std...X.mean
56. tBodyAccJerk.std...Y.mean
57. tBodyAccJerk.std...Z.mean
58. tBodyGyro.std...X.mean
59. tBodyGyro.std...Y.mean
60. tBodyGyro.std...Z.mean
61. tBodyGyroJerk.std...X.mean
62. tBodyGyroJerk.std...Y.mean
63. tBodyGyroJerk.std...Z.mean
64. tBodyAccMag.std...mean
65. tGravityAccMag.std...mean
66. tBodyAccJerkMag.std...mean
67. tBodyGyroMag.std...mean
68. tBodyGyroJerkMag.std...mean
69. fBodyAcc.std...X.mean
70. fBodyAcc.std...Y.mean
71. fBodyAcc.std...Z.mean
72. fBodyAccJerk.std...X.mean
73. fBodyAccJerk.std...Y.mean
74. fBodyAccJerk.std...Z.mean
75. fBodyGyro.std...X.mean
76. fBodyGyro.std...Y.mean
77. fBodyGyro.std...Z.mean
78. fBodyAccMag.std...mean
79. fBodyBodyAccJerkMag.std...mean
80. fBodyBodyGyroMag.std...mean
81. fBodyBodyGyroJerkMag.std...mean

### The original/raw datset ###
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


**Note**: As in the original dataset all measurements had been normalised to the range -1, +1, this will also apply to all the measures in the dataset.
## The second largest heading (an <h2> tag)
*This text will be italic*
**This text will be bold**
``` prueba```Feature Selection 
=================



The complete list of variables of each feature vector is available in 'features.txt'
