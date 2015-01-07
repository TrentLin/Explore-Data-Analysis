#2.Have total emissions from PM2.5 decreased in the Baltimore City,
#Maryland (fips == "24510") from 1999 to 2008? Use the base
#plotting system to make a plot answering this question
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
#transfor year into factor
NEI$year <- as.factor(NEI$year)
#Use Baltimore City, Maryland(fips=="24510") only
NEI_Baltimore <- subset(NEI,fips=="24510")
#aggregate the PM2.5 emissions from Baltimore City by year
data2 <-aggregate(NEI_Baltimore$Emissions, by=list(year=NEI_Baltimore$year),
                  FUN = sum)
#Plot2
png(filename="plot2.png",width = 480, height =480)
barplot(data2$x,names.arg=data2$year,xlab="Year",ylab="PM2.5 emission in Baltimore",
        main="Baltimore City total PM2.5 Emission")
dev.off()