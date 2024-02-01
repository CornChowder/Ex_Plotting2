#Across the United States, how have emissions from 
#coal combustion-related sources changed from 1999–2008?

plot4 <- function() {

#Load data

    NEI <- readRDS("data/summarySCC_PM25.rds")
    SCC <- readRDS("data/Source_Classification_Code.rds")

#Determine coal-related SCC

    coalSCC <- unique(SCC$EI.Sector)[c(1, 6, 11)]
    coalSCC <- SCC[SCC$"EI.Sector" %in% coalSCC,]

#Break out coal related data

    coalData <- NEI[NEI$SCC %in% coalSCC$SCC,]

#Create dataset containing sums of emissions
    
    coalSums <- aggregate(Emissions ~ year, coalData, sum)

#Plot emissions data

    plot4 <- png("plot4.png")
    plot(coalSums$year, coalSums$Emissions, pch = 19, 
        main = "U.S. Emissions due to Coal, 1999-2008",
        xlab = "Year", ylab = "Emissions (tons)")
    dev.off()
}