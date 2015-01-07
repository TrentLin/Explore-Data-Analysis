#Transfer weekday to English
Sys.setlocale(category="LC_ALL",locale="English")
#Loading the data
#Read Table
mydata <- read.table("household_power_consumption.txt", header= TRUE,
                     sep =";",na.strings="?")
subdata <- subset(mydata, Date == "1/2/2007" | Date=="2/2/2007")
#convert the Date and Time variables
Date_Time <- paste(subdata$Date,subdata$Time)
subdata$Date_Time <- strptime(Date_Time,format="%d/%m/%Y %H:%M:%S")
#Plot2
png(filename="plot2.png",width = 480, height =480)
par(lty=1,lwd=1)
plot(subdata$Date_Time,subdata$Global_active_power,type="l",xlab="",
     ylab="Global Active Power(kilowatts)")
dev.off()