#Import the data in R
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#Convert the Date & Time in date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date_val <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(date_val)

#Plotting plot2.png
plot(data$datetime,data$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,'plot2.png')
dev.off()
