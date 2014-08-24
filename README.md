This document describes the basic steps I took to create a tidy dataset from the original raw data.

1. read the features.txt file with read.table. Since the feature information will be potentially used for column names of the resulting tidy data, I first removed all the parenthesis symbol and all the comma.

2. read the activity label and the identifier of the subject who carried out the experiment for both test and training data as well as the datasets for training set and test set.

3. Use the "rbind" to combine the activity label, the identifier from test and training data , as well as the datasets from training set and test test,respectively. This should result in three data sets with the same number of rows. 

4. Use the "bind" to combine horizontally the three files created in the step 3.

5. Assign "activity" and "subject" as the column names of the first two columns and use the cleaned feature information produced by step 1 for the column names of the rest columns.

6. Change the activity from int to factor, and level the activity based on activity_labels.txt. The resulting activity will be factored as "walk","walkup","walk down","sit","stand","lay".

7. Extracts only the measurements on the mean and standard deviation for each measurement using
"grep" command for columns which names contain either "mean" or "std"

8. Add columns "activity" and "subject" to the dataset created at step 7.

9. order the dataset created at step 8 by activity and subject.

10. Creates a tidy data set with the average of each variable for each activity and each subject. The variables are extracted measurements on the mean and standard deviation for each measurement in step 7.
