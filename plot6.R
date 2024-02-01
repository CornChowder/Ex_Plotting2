#Compare emissions from motor vehicle sources in 
#Baltimore City with emissions from motor vehicle 
#sources in Los Angeles County, California 
#(fips == "06037"). Which city has seen greater 
#changes over time in motor vehicle emissions?

library(ggplot2)

plot6 <- function() {

#Load data

    NEI <- readRDS("data/summarySCC_PM25.rds")
    SCC <- readRDS("data/Source_Classification_Code.rds")
 
#Create subset with Los Angeles (fips = 06037) and 
#Baltimore (fips = 24510) data
 
    citiesData <- subset(NEI, fips %in% c("24510","06037"))

#Replace fips ids with city names for legend labels later
 
    switcheroo <- citiesData$fips
    switcheroo <- replace(switcheroo, switcheroo == "24510", "Baltimore")
    switcheroo <- replace(switcheroo, switcheroo == "06037", "Los Angeles")
    citiesData$fips <- switcheroo

#Choose SCC to use for motor vehicle emissions
 
    vehicleData <- unique(SCC$EI.Sector)[21:27]
    vehicleData <- subset(SCC, EI.Sector %in% vehicleData)
    vehicleData <- subset(citiesData, SCC %in% vehicleData$SCC)

#Create data frame containing the sums of Emissions by year in each city

    vehicleData <- aggregate(Emissions ~ fips + year, vehicleData, sum)

#Plot the data

    png("plot6.png")
    g <- ggplot(vehicleData, aes(x = year, y = Emissions, col = fips)) + 
        ggtitle("Baltimore and Los Angeles PM 2.5 Emissions, 1999-2008") + 
        geom_line() + labs(col = "City") + ylab("Emissions (tons)")
    print(g)
    dev.off()
}