setwd("/Users/harshitha.ramesh/Documents/datasciencecoursera/ExData_Plotting2/")
NEI <- readRDS("summarySCC_PM25.rds")
NEI <- NEI[NEI$fips == "24510",]
summary <- tapply(NEI$Emissions,NEI$year,sum)
png(file="plot2.png",width=480,height=480,res=72)
barplot(summary,ylab="Tons of PM2.5 Emissions", xlab = "Year")
title(main = "Total Emissions of PM2.5 from 1999-2008 in Baltimore, Maryland")
dev.off()