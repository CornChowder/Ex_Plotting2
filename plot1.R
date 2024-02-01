#Have total emissions from PM2.5 decreased in the 
#United States from 1999 to 2008? Using the base 
#plotting system, make a plot showing the total 
#PM2.5 emission from all sources for each of the 
#years 1999, 2002, 2005, and 2008

plot1 <- function() {

#Load data

    NEI <- readRDS("data/summarySCC_PM25.rds")
    SCC <- readRDS("data/Source_Classification_Code.rds")

#Create points representing sums of emissions by year

    NEIbyYear <- split(NEI, NEI$year)

    p1 <- sum(NEIbyYear[[1]]$Emissions)
    p2 <- sum(NEIbyYear[[2]]$Emissions)
    p3 <- sum(NEIbyYear[[3]]$Emissions)
    p4 <- sum(NEIbyYear[[4]]$Emissions)

#Plot points

    plot1 <- png("plot1.png")
    plot(1:4, c(p1, p2, p3, p4), pch = 19, 
        xlab = "Year",
        ylab = "Emissions (megatons)",
        main = "U.S. PM2.5 Emissions, 1999-2008",
        axes = FALSE
        )
    axis(1, at = c(1, 2, 3, 4), label = c("1999", "2002", "2005", "2008"))
    axis(2, at = c(4000000, 5000000, 6000000, 7000000), label = c(4, 5, 6, 7)) 
    dev.off()   
}