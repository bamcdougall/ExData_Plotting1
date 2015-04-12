################################################################################
##
##  Author:  Brendan McDougall
##  Proj Purpose: Project 1 of Exploratory Data Analysis / Johns Hopkins Univ
##  File Purpose: High level documentation of project at text level
##  MOOC:  Coursera
##  Course ID:  exdata-013
##  Date:  4/9/15, 4/11/15
##
##
################################################################################
##
##  System Info:  Windows 7, 64 bit, i7 processor, RStudio Version 0.98.1102
##                  R x64 3.1.2, git scm 1.9.5
##
################################################################################
##
## Revision History
##
##      4/9/15:     Downloaded zip archive from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##                  Completed project to first order:
##                  transform data & generate plots
##
##                  Issues:  Plot formatting sufficient, but data are different
##                  Suspect cause:  data imported into R incorrectly or subsetted
##                  incorrectly within R
##
##      4/11/15:    Update git archive; started this ReadMe file
##                  Extracted raw file from zip archive to replace initial data file
##                  Discovered error in restructing date inside mutate command.
##                  Initially used mdy_hms(), but should have been dmy_hms()
##
##
##
##
################################################################################