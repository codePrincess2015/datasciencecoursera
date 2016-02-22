setwd("/Users/harshitha.ramesh/Documents/datasciencecoursera/ExData_Plotting2/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC_restricted <- SCC[grep("[Vv]ehicles",SCC$EI.Sector),"SCC"]
NEI_restricted <- NEI[NEI$SCC %in% SCC_restricted & NEI$fips == "24510",]
summary <- tapply(NEI_restricted$Emissions,NEI_restricted$year,sum)
png(file="plot5.png",width=960,height=960,res=72)
barplot(summary,ylab="Tons of PM2.5 Emissions", xlab = "Year")
title(main = "Total Emissions of PM2.5 Emissions from Motor Vehicle Sources from 1999-2008 in Baltimore, Maryland")
dev.off()