Getting and Cleaning Data Course Project
========================================
Introduction
------------
This is the respository for my course project in the Getting and Cleaning Data portion of Coursera's Data Science program.

Raw Data
--------
The data has been compiled from a study done by University of California, Irvine (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

It contains 561 features which have been measured between 2 groups.  The  results of "train" and "test" groups can be found in x_train.txt and x_test.txt, respectively. Their corresponding labels can be found at y_train.txt and y_test.txt.  

The id for each subject is in the subject_train.txt and subject_test.txt files.

Script and Tidy Data
--------------------

This repository contains my script, run_analysis.R.  Someone attempting to view my script will have to extract the UCI HAR Dataset and place the R script inside the the main UCI HAR Dataset folder.

Additionally the script requires the dplyr package to be installed. 

The script begins by merging the test and train group datasets and then applying the correct labels.  This set is then filtered to the pertinent mean and standard deviation observations.

The final script creates a tidy data that shows the mean of each variable per subject per activity.

In order to run the script, the viewer must use the function name "traintest()".

Code Book
---------
The Codebook.md file gives full detail on the creation of the script and its' results.
