#####
##### File Name:   plot1.R
##### Last Edited: 06 Oct 2015
##### Author:      Flavio Massimo Saldicco
##### Purpose:     This is a script for Course Project 1 developed
#####              in the context of the Exploratory Data Analysis Course
#####              of Johns Hopkins Bloomberg School of Public Health,
#####              hosted on the Coursera platform.
#####              

################################
##### DOWNLOAD DATA FILE - START
################################
##### The following lines (up to the DOWNLOAD DATA FILE - END
##### comment) are only needed to download and unzip the 
##### assignment data file. These lines do not need
##### to be executed if the data file has already
##### been downloaded and unzipped.

#set working directory (Note: change it appropriately)
setwd("C:/Users/FlavioMassimo/Desktop/Expl Data Analysis/project 1")

#download the Household Power Consumption data file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "hpc.zip", mode = "wb")

#unzip the data file
unzip("hpc.zip")
list.files(".")
##############################
##### DOWNLOAD DATA FILE - END
##############################


#############################
##### DRAW GRAPH PLOT1.PNG
#############################

#read data file
hpc_full <- read.table("household_power_consumption.txt", header=TRUE,
                       sep=";", na.strings=c("?"))

#make sure dates are treated as dates
hpc_full$Date <- as.Date(hpc_full$Date, "%d/%m/%Y")

#create a subset of the data set only containing the observations
#related to the 1st and 2nd of February, 2007
hpc_sub <- hpc_full[(hpc_full$Date >= as.Date("2007/02/01")) &
                    (hpc_full$Date <= as.Date("2007/02/02")), ]

#open png device
png(filename = "plot1.png",
    width = 480, height = 480, bg="transparent")

#generate histogram
hist(hpc_sub$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

#close png device
dev.off()


