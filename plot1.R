###########################################################
## Purpose: Create plot1 of the Household Power Consumption data
## Specialization: JHU Data Science
## Course: 3 - Exploratory Data Analysis
## Week: 1
## Project: 1 - Household Power Consumption
###########################################################

library("data.table")
library("ggplot2")

getwd()
setwd("/bindmount/JHU Data Science Specialization/Course 4 Exploratory Data Analysis")

## Step 1: Read the data
power_consum <- read.table("household_power_consumption.txt"
                           , header = TRUE
                           , sep = ";"
                           , na = "?")
power_consum <- as.data.table(power_consum)

head(power_consum)
str(power_consum)

## Step 2: Change the Data Types of each column
power_consum[, Time := paste(Date, Time, " ")]
power_consum[, Time := strptime(Time, "%d/%m/%Y %H:%M:%S")]
power_consum[, Date := strptime(Date, "%d/%m/%Y")]
power_consum[, Global_active_power := as.double(Global_active_power)]
power_consum[, Global_reactive_power := as.double(Global_reactive_power)]
power_consum[, Voltage := as.double(Voltage)]
power_consum[, Global_intensity := as.double(Global_intensity)]
power_consum[, Sub_metering_1 := as.double(Sub_metering_1)]
power_consum[, Sub_metering_2 := as.double(Sub_metering_2)]

head(power_consum)
str(power_consum)

## Step 3: Filter the data just for 2007-02-01 and 2007-02-02
power_consum <- power_consum[Date == "2007-02-01" | Date == "2007-02-02", ]

head(power_consum)
str(power_consum)

## Step 4: Create the plot

## Need to make sure to point to the right directory
setwd("/bindmount/kiran/JHU_Data_Science_Specialization/Course 4 - Exploratory Data Analysis/C4W1_Project1_Power/")

png("plot1.png", width = 480, height = 480)
hist(x = power_consum$Global_active_power
         , breaks = 12
         , freq = TRUE
         , main = "Global Active Power"
         , xlab = "Global Active Power (kilowatts)"
         , ylab = "Frequency"
         , col = "red")
dev.off()
