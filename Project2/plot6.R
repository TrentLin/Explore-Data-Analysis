#6.Compare emissions from motor vehicle sources in Baltimore City
#with emissions from motor vehicle sources in Los Angeles County,
#California (fips == "06037"). Which city has seen greater changes
#over time in motor vehicle emissions?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#transfor year into factor
NEI$year <- as.factor(NEI$year)
NEI$year <- as.factor(NEI$year)
#Extract emissions from motor vehicle sources from SCC.Level.Two
regexp2 <- "(.*)+(Vehicles)+(.*)"
rowvel <- grep(regexp2,SCC$SCC.Level.Two)
SCC_Vehicle <-SCC[rowvel,"SCC"]
#Extract dataframe which emissions from motor vehicle in Baltimore City
NEI_Vehicle_Bal <-NEI[NEI$SCC %in% SCC_Vehicle & NEI$fips == "24510",]
#Extract dataframe which emissions from motor vehicle in Los Angeles County
NEI_Vehicle_LA <-NEI[NEI$SCC %in% SCC_Vehicle & NEI$fips == "06037",]

#aggregate Emisssion from NEI_Vehicle_Bal by year
data6_1 <- aggregate(NEI_Vehicle_Bal$Emissions,by = list(year=NEI_Vehicle_Bal$year)
                     ,FUN = sum)
#aggregate Emission from NEI_Vehicle_LA by year
data6_2 <- aggregate(NEI_Vehicle_LA$Emissions,by = list(year=NEI_Vehicle_LA$year)
                     ,FUN = sum)

#plot6
png(filename="plot6.png",height = 480,width = 480 )
par(mfrow=c(1,2),lty=1,lwd=1)
barplot(data6_1$x,names.arg=data6_1$year,xlab="Year",ylab="Total PM2.5 emission",
        main="Emission from vehicle in Bal")
barplot(data6_2$x,names.arg=data6_2$year,xlab="Year",ylab="Total PM2.5 emission",
        main="Emission from vehicle in LA")
dev.off()