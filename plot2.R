#Have total emissions from PM2.5 decreased in the Baltimore 
#City, Maryland (fips == "24510") from 1999 to 2008? Use 
#the base plotting system to make a plot answering this 
#question.

plot2 <- function() {

#Load data

    NEI <- readRDS("data/summarySCC_PM25.rds")
    SCC <- readRDS("data/Source_Classification_Code.rds")

#Separate baltimore data

    NEI <- subset(NEI, NEI$fips == "24510")

#Create points for sums of emissions by year

    NEIbyYear <- split(NEI, NEI$year)

    p1 <- sum(NEIbyYear[[1]]$Emissions)
    p2 <- sum(NEIbyYear[[2]]$Emissions)
    p3 <- sum(NEIbyYear[[3]]$Emissions)
    p4 <- sum(NEIbyYear[[4]]$Emissions)

#Plot data

    png("plot2.png")
    plot(1:4, c(p1, p2, p3, p4), axes = FALSE,
        xlab = "Year",
        ylab = "Emissions (ton)",
        main = "Baltimore PM2.5 Emissions, 1999-2008")
    axis(1, at = c(1, 2, 3, 4), label = c("1999", "2002", "2005", "2008"))
    axis(2, at = c(1800, 2000, 2200, 2400, 2600, 2800, 3000, 3200),
        label = c(1800, 2000, 2200, 2400, 2600, 2800, 3000, 3000))
    segments(1, p1, 2, p2)
    segments(2, p2, 3, p3)
    segments(3, p3, 4, p4)
    dev.off()
}