## plot3.R 7/11/2015

## Read the Household_power_consumption data locally
HHPower <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

## Extract the date range of 2007-02-01 thru 2007-02-02
HHPdates <- as.Date(as.character(HHPower[,1]), "%d/%m/%Y")
dateRange = as.Date(c("2007-02-01", "2007-02-02"))
indx2 <- HHPdates <= dateRange[2] & HHPdates >= dateRange[1]
HHPower <- HHPower[indx2,]

## Extract the active_power may contain NAs
SubMetering1 <- as.numeric(as.character(HHPower[,7]))
SubMetering2 <- as.numeric(as.character(HHPower[,8]))
SubMetering3 <- as.numeric(as.character(HHPower[,9]))

## Delete the NAs
indx <- is.na(SubMetering1) | is.na(SubMetering2) | is.na(SubMetering3)
SubMetering1 <- SubMetering1[!indx]
SubMetering2 <- SubMetering2[!indx]
SubMetering3 <- SubMetering3[!indx]
numpts <- length(SubMetering1)

## Create plot file and plot the data
png(file = "plot3.png")
plot(1:numpts, SubMetering1, type="n", ylab="Energy sub metering", xlab = "", axes=FALSE)
lines(1:numpts, SubMetering1, type="l", col = "BLACK")
lines(1:numpts, SubMetering2, type="l", col = "RED")
lines(1:numpts, SubMetering3, type="l", col = "BLUE")
box(which = "plot", lty = "solid")
axis(1, at=c(0., 1440., 2880.), labels = c("Thu", "Fri", "Sat"))
axis(2, at=c(0., 10., 20., 30.))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))

dev.off()
