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
#plot1
png(filename="plot1.png",width = 480, height =480)
hist(subdata$Global_active_power,main="Global Active Power",
     col= "red",xlab="Global Active Power(kilowatts)")
dev.off()
