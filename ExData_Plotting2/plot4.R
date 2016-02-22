setwd("/Users/harshitha.ramesh/Documents/datasciencecoursera/ExData_Plotting2/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC_restricted <- SCC[grep("[Cc]oal",SCC$Short.Name),"SCC"]
NEI_restricted <- NEI[NEI$SCC %in% SCC_restricted,]
summary <- tapply(NEI_restricted$Emissions,NEI_restricted$year,sum)
png(file="plot4.png",width=960,height=960,res=72)
barplot(summary,ylab="Tons of PM2.5 Emissions", xlab = "Year")
title(main = "Total Emissions of PM2.5 Emissions from Coal Combustion Related Sources from 1999-2008")
dev.off()