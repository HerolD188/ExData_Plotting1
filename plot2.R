## plot2.R 7/10/2015

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
numpts <- length(global_active_power)

## Create plot file and plot the data
png(file = "plot2.png")
plot(1:numpts, global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab = "", axes=FALSE)
lines(1:numpts, global_active_power, type="l")
box(which = "plot", lty = "solid")
axis(1, at=c(0., 1440., 2880.), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0., 2., 4., 6.))

dev.off()
