library("data.table")

setwd("~/Courses/john_hopkins_datascience/Course4_Exploratory/Assignment1")

#Read data
pwData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Prevents scientific notation
pwData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pwData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Only use 2007-02-01 and 2007-02-02
pwData <- pwData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Generate a PNG file 
png("plot1.png", width=480, height=480)

## Plot 1
hist(pwData[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()