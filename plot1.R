## plot1.R 7/9/2015

## Read the Household_power_consumption data locally
HHPower <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

## Extract the date range of 2007-02-01 thru 2007-02-02
HHPdates <- as.Date(as.character(HHPower[,1]), "%d/%m/%Y")
dateRange = as.Date(c("2007-02-01", "2007-02-02"))
indx2 <- HHPdates <= dateRange[2] & HHPdates >= dateRange[1]
HHPower <- HHPower[indx2,]

## Extract the active_power may contain NAs
active_power <- as.numeric(as.character(HHPower[,3]))

## Delete the NAs
indx <- is.na(active_power)
global_active_power <- active_power[!indx]

## Plot the histogram
hist(global_active_power, col="RED", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     breaks=c(0., 0.5, 1., 1.5, 2., 2.5, 3., 3.5, 4., 4.5, 5., 5.5, 6., 6.5, 7.0, 7.5),
     xaxt="n")
axis(1, at=c(0., 2., 4., 6.))

## copy the plot to a .png file
dev.copy(png, file = "plot1.png")
dev.off()