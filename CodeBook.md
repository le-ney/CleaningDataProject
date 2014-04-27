##Human Activity Recognition Using Smartphones 
####Cleaning Data, Peer Assessment Project
==================================================================

###About the experiment and Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

###Data Transformation approach

First the training information was loaded into memory. Then extracted only the measurements on the mean and standard deviation for each measurement by adding the features name and selecting the specific columns. After reducing the data table Activity column from training_y.txt was added to the data set followed by Subject column. The same process was conducted for test data. After loading and merging both test and training data, the two data set was merged by rows. In the next step all activities names and description was added to each rows. In the last step,an independent tidy data set with the average of each variable for each activity and each subject was generated.
