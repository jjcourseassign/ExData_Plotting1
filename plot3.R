library("data.table")

setwd("~/Courses/john_hopkins_datascience/Course4_Exploratory/Assignment1")

#Read data
pwData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# Prevents Scientific Notation
pwData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pwData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Only use 2007-02-01 and 2007-02-02
pwData <- pwData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Generate PNG file 
png("plot3.png", width=480, height=480)

# Plot 3
plot(pwData[, dateTime], pwData[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(pwData[, dateTime], pwData[, Sub_metering_2],col="red")
lines(pwData[, dateTime], pwData[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()
