## plot4.R 7/11/2015

## Read the Household_power_consumption data locally
HHPower <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

## Extract the date range of 2007-02-01 thru 2007-02-02
HHPdates <- as.Date(as.character(HHPower[,1]), "%d/%m/%Y")
dateRange = as.Date(c("2007-02-01", "2007-02-02"))
indx2 <- HHPdates <= dateRange[2] & HHPdates >= dateRange[1]
HHPower <- HHPower[indx2,]

## Extract the active_power may contain NAs
HHPower[,3] <- as.numeric(as.character(HHPower[,3]))
HHPower[,4] <- as.numeric(as.character(HHPower[,4]))
HHPower[,5] <- as.numeric(as.character(HHPower[,5]))
HHPower[,7] <- as.numeric(as.character(HHPower[,7]))
HHPower[,8] <- as.numeric(as.character(HHPower[,8]))
HHPower[,9] <- as.numeric(as.character(HHPower[,9]))

## Delete the NAs
indx <- is.na(HHPower[,3]) | is.na(HHPower[,4]) | is.na(HHPower[,5]) | 
    is.na(HHPower[,7]) | is.na(HHPower[,8]) | is.na(HHPower[,9])
HHPower <- HHPower[!indx,]
numpts <- nrow(HHPower)

## Create plot file and plot the data
png(file = "plot4.png")
par(mfrow = c(2, 2))

#upper left
plot(1:numpts, HHPower[,3], type="n", ylab="Global Active Power", xlab = "", axes=FALSE)
lines(1:numpts, HHPower[,3], type="l", col = "BLACK")
box(which = "plot", lty = "solid")
axis(1, at=c(0., 1440., 2880.), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0., 2., 4., 6.))

#upper right
plot(1:numpts, HHPower[,5], type="n", ylab="Voltage", xlab = "datetime", axes=FALSE)
lines(1:numpts, HHPower[,5], type="l", col = "BLACK")
box(which = "plot", lty = "solid")
axis(1, at=c(0., 1440., 2880.), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(234., 236., 238., 240., 242., 244., 246.), labels=c("234", "", "238", "", "242", "", "246"))

#lower left
plot(1:numpts, HHPower[,7], type="n", ylab="Energy sub metering", xlab = "", axes=FALSE)
lines(1:numpts, HHPower[,7], type="l", col = "BLACK")
lines(1:numpts, HHPower[,8], type="l", col = "RED")
lines(1:numpts, HHPower[,9], type="l", col = "BLUE")
box(which = "plot", lty = "solid")
axis(1, at=c(0., 1440., 2880.), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0., 10., 20., 30.))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"), bty="n")

#lower right
plot(1:numpts, HHPower[,4], type="n", ylab="Global_reactive_power", xlab = "datetime", axes=FALSE)
lines(1:numpts, HHPower[,4], type="l", col = "BLACK")
box(which = "plot", lty = "solid")
axis(1, at=c(0., 1440., 2880.), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

dev.off()
