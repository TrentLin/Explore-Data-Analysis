#5How have emissions from motor vehicle sources changed from 
#1999¡V2008 in Baltimore City?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#transfor year into factor
NEI$year <- as.factor(NEI$year)
#Extract emissions from motor vehicle sources from SCC.Level.Two
regexp2 <- "(.*)+(Vehicles)+(.*)"
rowvel <- grep(regexp2,SCC$SCC.Level.Two)
SCC_Vehicle <-SCC[rowvel,"SCC"]
#Extract dataframe which emissions from motor vehicle in Baltimore City
NEI_Vehicle <-NEI[NEI$SCC %in% SCC_Vehicle & NEI$fips == "24510",]

#Aggregate PM25 Emission by year
data5 <- aggregate(NEI_Vehicle$Emissions,by=list(year=NEI_Vehicle$year),FUN = sum)

#Plot5
png(filename="plot5.png",width = 480, height =480)
barplot(data5$x,names.arg=data5$year,xlab="Year",ylab="Total PM2.5 emission",
        main="Total PM2.5 Emission from motor vehicle in Baltimore City")
dev.off()