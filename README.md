## Summary

* The solutions follow the instructions in the original README.md that was in the fork/clone repo
* The following PNG plots and associated R scripts shown in parentheses below are in the repo. 
 
	+ plot1.png (plot1.R)
	+ plot2.png (plot2.R)
	+ plot3.png (plot3.R) 
	+ plot4.png (plot4.R) --contains four separate plots in one PNG
	
* Each R script can be run independently to create the associated PNG plot	

## Loading the data
* Manually downloaded the data as zipped file from the URL and extracted the data to my R working directory
* Ensured that the data file "household_power_consumption.txt" is in my R working directory
* This is a semicolon delimited data file.
* Read the data to a data frame dfpower using the read.table function using semicolon as delimiter

## Preparing data for each plot
* The R script for each plot indicates via comments (see comments starting with # in R script files) the type of changes that were effected on data columns using combinations of as.character, as.numeric, and as.Date functions.
* Subset the dfpower data frame to obtain the data from the dates 2007-02-01 and 2007-02-02 using the following R code:

dfpower$Date <- as.Date(dfpower$Date, format="%d/%m/%Y")

dfpower <- dfpower[(dfpower$Date=="2007-02-01") | (dfpower$Date=="2007-02-02"),]

* Also a new column "Timestamp" was obtained using a transform function to the Date column to be able to formatdate as three character day of the week (e.g. Thu, Fri, etc.)

