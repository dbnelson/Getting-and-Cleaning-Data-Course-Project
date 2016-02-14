This code book is provided to indicate all the variables and summaries calculated, along with units, and any other relevant information.

Here are the variables that were used:
Three variables from the train.txt downloaded files were created called X_train, y_train, and subject_train.
Similarly, three varialbes from the test.txt downloaded files were created called x_test, y_test, and subject_test.
The creation of x_data, y_data, and subject_data were created as a result of merging both the training and test data sets using rbind.
The features and headers variables provide the correct column names
The mean_and_std variable is an extract of only the mean and standard deviation measurements.
The combined variables uses cbind to combine the x_data, y_data, and subject_data into a single dataset.
The averages_data variable provides the average of each variable for each activity and each subject that is stored in a .txt file and uploaded to this repository.
