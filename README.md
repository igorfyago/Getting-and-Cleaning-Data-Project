# Getting-and-Cleaning-Data-Project

This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

Download the dataset if it does not already exist in the working directory
Load the activity and feature info
Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Converts the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.txt.

My repository!!:

codebook.MD: a code book explaining the contents of the data file and what the data is all about

tidyDS.txt: a tidy dataset containing aggregated data for analysis, as described in the codebook

run_analysis.R: an R script that generates analytical and summarized data as described in the codebook

The script run_analysis.R processes raw data samples from wearable devices, more specifically data from Samsumg Galaxy S accelerometer, from individuals performing some sorts of physical activities and resting states. The script collects from the raw datasets only the variables related to mean and SD for each measurement, combines and sorts data by activity and individual.

;)
