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


#plot 2
data$datetime<- as.POSIXct(data$datetime)
head(data$datetime)
attach(data)
plot(Global_active_power~datetime,type = "l",
     ylab ="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
