#1.Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system, make a plot
#showing the total PM2.5 emission from all sources for each of 
#the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
#transfor year into factor
NEI$year <- as.factor(NEI$year)

#aggregate the total emission data by year
data1 <-aggregate(NEI$Emissions,by=list(year=NEI$year),FUN=sum)

#plot1
png(filename="plot1.png",width = 480, height =480)
barplot(data1$x,names.arg=data1$year,xlab="Year",ylab="Total PM2.5 emission",
        main="USA total PM2.5 Emission")
dev.off()
