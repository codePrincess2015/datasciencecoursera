setwd("/Users/harshitha.ramesh/Documents/datasciencecoursera/ExData_Plotting2/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC_restricted <- SCC[grep("[Vv]ehicles",SCC$EI.Sector),"SCC"]
NEI_restricted <- NEI[NEI$SCC %in% SCC_restricted & (NEI$fips == "24510" | NEI$fips == "06037"),]
data <- NEI_restricted %>% group_by(year,fips) %>% summarize_each(funs(sum(Emissions)))
png(file="plot6.png",width=960,height=960,res=72)
g <- ggplot(data,aes(year,Emissions,color = fips))
g + geom_line() + geom_point() + xlab("Year") + ggtitle("Total PM2.5 Emissions from Motor Vehicles from 1999-2008 in Baltimore, Maryland and Los Angeles, California") +scale_shape_discrete(name = "Cities", breaks= c("06037","24510"), labels = c("Los Angeles","Baltimore"))
dev.off()