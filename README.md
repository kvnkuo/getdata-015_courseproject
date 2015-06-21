## README
The primary goal of this project is to create a tidy data set from an interesting experiment.

This project uses the "Human Activity Recognition Using Smartphones Dataset" from www.smartlab.ws.
Please refer to http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names for basic explaination of the data set.

Since the data are split into the test and the training sets, we have to merger them first. But, before doing that, we want to introduce two new variables(suject and activity label) to combine the subject and the activity label information into these data sets. To combine and merge, we use cbind to combine new variables into data sets then use rbind to merge both data sets into a full one.

We use grep to filter out those features we want from the feature list. Use the selected features as indices to select those measurements we want from the full data set to build a trimmed data set. For each variable(or feature), we use ddply to summarize the data by both subject and activity label to find the average of certain variable. Join the summarized results by
by both subject and activity label to form the target data set. It is the tidy data set with the average of each variable for each activity and each subject. 

### For each record it is provided:

- A 68-feature vector with the average of each variable for each activity and each subject, the activity label and identifier of the subject who carried out the experiment.

### The project includes the following files:

- 'README.md'

- 'CodeBook.md': Shows information about the variables used on the feature vector

- 'run_analysis.R': The R program to do the analysis.


