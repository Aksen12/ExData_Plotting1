library(lubridate)

#Import the data in R
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",colClasses=c("character","character","double","double","double","double","double","double","numeric"))

#Convert the Date & Time in date format
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)

#Subsetting the data
data_sub<-with(data,subset(data,Date=="2007-02-01" | Date=="2007-02-02"))
data_sub$Global_active_power<-as.numeric(paste(data_sub$Global_active_power))

#Plotting plot1.png
hist(data_sub$Global_active_power,xlab = "Global Active Power(killowatt)",main = "Global Active Power",col = "red")
dev.copy(png,'plot1.png')
dev.off()