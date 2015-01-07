#4.Across the United States, how have emissions from coal
#combustion-related sources changed from 1999¡V2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#transfor year into factor
NEI$year <- as.factor(NEI$year)
#Extract emissions from Coal combustion related sources from
#short.Name
regexp <- "(.*)+(Coal)+(.*)"
row <- grep(regexp,SCC$Short.Name)
SCC_Coal_Combustion <- SCC[row,"SCC"]
NEI_Coal_Combustion <- NEI[NEI$SCC %in% SCC_Coal_Combustion,]

#Aggregate emissions from coal combustion related sources by year
data4 <- aggregate(NEI_Coal_Combustion$Emissions,
                   by=list(year=NEI_Coal_Combustion$year),FUN =sum)

#Plot4
png(filename="plot4.png",width = 480, height =480)
barplot(data4$x,names.arg=data4$year,xlab="Year",ylab="Total PM2.5 emission",
        main="Total PM2.5 Emission from coal combustion")
dev.off()