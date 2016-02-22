setwd("/Users/harshitha.ramesh/Documents/datasciencecoursera/ExData_Plotting2/")
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips == "24510",]
data <- NEI %>% group_by(year, type) %>% summarize_each(funs(sum(Emissions)))
data <- data[,c(1,2,6)]
png(file="plot3.png",width=480,height=480,res=72)
g <- ggplot(data,aes(year,Emissions,color = type))
g + geom_point + xlab("Year") + ggtitle("Total PM2.5 Emissions from 1999-2008 in Baltimore, Maryland by Type")
dev.off()