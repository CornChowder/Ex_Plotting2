#How have emissions from motor vehicle sources changed 
#from 1999–2008 in Baltimore City?

plot5 <- function() {

#Load data

    NEI <- readRDS("data/summarySCC_PM25.rds")
    SCC <- readRDS("data/Source_Classification_Code.rds")

#Separate Baltimore data
 
    baltimore <- subset(NEI, fips == "24510")

#Determine motor vehicle-related SCC

    baltimoreVehicle <- unique(SCC$EI.Sector)[21:27]
    baltimoreVehicle <- subset(SCC, EI.Sector %in% baltimoreVehicle)

#Separate motor vehicle data for Baltimore

    baltimoreVehicle <- subset(NEI, SCC %in% baltimoreVehicle$SCC)

#Create dataset containing sums of emissions

    baltimoreVehicle <- aggregate(Emissions ~ year, baltimoreVehicle, sum)

#Plot data

    png("plot5.png")
    plot(baltimoreVehicle$year, baltimoreVehicle$Emissions, pch = 19,
        xlab = "Year", ylab = "Emissions (tons)",
        main = "Baltimore PM-2.5 Emissions due to Motor Vehicles, 1999-2008")
    dev.off()
}