## Read the Electric power consumption file from the UC Irvine Machine Learning 
## Repository
file<-"household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data between given dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Declare variables
postmark <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub$Global_active_power)
globalReactivePower <- as.numeric(sub$Global_reactive_power)
voltage <- as.numeric(sub$Voltage)
subMetering1 <- as.numeric(sub$Sub_metering_1)
subMetering2 <- as.numeric(sub$Sub_metering_2)
subMetering3 <- as.numeric(sub$Sub_metering_3)

## Plot the data and send to a .png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#top-left graph
plot(postmark, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power", cex=0.2)

#top-right graph
plot(postmark, voltage, type="l", xlab="datetime", ylab="Voltage")

#bottom-left graph
plot(postmark, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(postmark, subMetering2, type="l", col="red")
lines(postmark, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

#bottom-right graph
plot(postmark, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()