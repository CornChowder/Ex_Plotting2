#Of the four types of sources indicated by the type
#(point, nonpoint, onroad, nonroad) variable, which 
#of these four sources have seen decreases in emissions 
#from 1999–2008 for Baltimore City? Which have seen 
#increases in emissions from 1999–2008? Use the ggplot2 
#plotting system to make a plot answer this question.

library(ggplot2)

plot3 <- function() {

#Load data

    NEI <- readRDS("data/summarySCC_PM25.rds")
    SCC <- readRDS("data/Source_Classification_Code.rds")

#Separate Baltimore data from the dataset

    baltimore <- subset(NEI, fips == "24510")

#Create dataset containing sums of emissions

    sums <- aggregate(Emissions ~ year + type, baltimore, sum)

#Plot emissions sums

    plot <- png("plot3.png")
    g <- ggplot(sums, aes(year, Emissions, col = type)) + geom_line() +
          ggtitle("Baltimore PM2.5 Emissions by Type, 1999-2008")
    print(g)
    dev.off()
}