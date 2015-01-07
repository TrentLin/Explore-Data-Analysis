#3.Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions
#from 1999¡V2008 for Baltimore City? Which have seen increases 
#in emissions from 1999¡V2008? Use the ggplot2 plotting system 
#to make a plot answer this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
#transfor year into factor
NEI$year <- as.factor(NEI$year)
#Use Baltimore City, Maryland(fips=="24510") only
NEI_Baltimore <- subset(NEI,fips=="24510")
#aggregate the PM2.5 emissions from Baltimore City by year
data3 <-aggregate(NEI_Baltimore$Emissions,
                  by=list(year=NEI_Baltimore$year,type=NEI_Baltimore$type)
                  ,FUN = sum)
#Plot 3 use ggplot2 package
png(filename="plot3.png",width = 480, height =480)
qplot(year,x,data=data3,facets=.~type, 
      stat="identity",geom="bar",main="Emissions from Baltimore City by Type"
      ,xlab="Year",ylab="Total PM25 Emissions")
dev.off()