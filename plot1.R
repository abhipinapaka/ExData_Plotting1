rm(list = ls())
setwd("F:\\R practice\\Coursera\\Exploratory Data Analysis\\Project1")

data<- read.table("household_power_consumption.txt", header = T, sep = ';',
                  na.strings = '?')
#head(data)

#### Converting the Date variables to Date class using as.Date 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
#Subsetting the data
data<-subset(data,subset = (Date>= "2007-02-01" & Date <= "2007-02-02"))

##### Converting the time variables to Time class using strptime function
data$datetime <- strptime(paste(data$Date, data$Time ), "%Y-%m-%d %H:%M:%S")


attach(data)
hist(Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
