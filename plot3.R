rm(list = ls())
setwd("F:\\R practice\\Coursera\\Exploratory Data Analysis\\Project1")

data<- read.table("household_power_consumption.txt", header = T, sep = ';',
                  na.strings = '?')

#### Converting the Date variables to Date class using as.Date 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#Subsetting the data
data<-subset(data,subset = (Date>= "2007-02-01" & Date <= "2007-02-02"))

##### Converting the time variables to Time class using strptime function
data$datetime <- strptime(paste(data$Date, data$Time ), "%Y-%m-%d %H:%M:%S")


#plot 3
data$datetime<- as.POSIXct(data$datetime)

attach(data)

plot(Sub_metering_1~datetime,type = "l",
     ylab ="Energy Sub Metering", xlab="")
lines(Sub_metering_2~datetime, col = "Red")
lines(Sub_metering_3~datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)
