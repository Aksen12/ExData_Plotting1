#Import the data in R
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#Convert the Date & Time in date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
date_val <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(date_val)

#Plotting plot4.png
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data,{
  plot(data$datetime,data$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
  plot(data$datetime,data$Voltage,type = "l",ylab="Voltage",xlab="datetime")
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~datetime, col='Red')
  lines(Sub_metering_3~datetime, col='Blue')
  plot(data$datetime,data$Global_reactive_power,type = "l",ylab="Global_reactive_power",xlab="datetime")
})
dev.copy(png, file="plot4.png")
dev.off()