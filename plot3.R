## Read the Electric power consumption file from the UC Irvine Machine Learning 
## Repository
file<-"household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data between given dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Declare variables
postmark <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(sub$Sub_metering_1)
subMetering2 <- as.numeric(sub$Sub_metering_2)
subMetering3 <- as.numeric(sub$Sub_metering_3)

## Plot the data and send to a .png file
png("plot3.png", width=480, height=480)
plot(postmark, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(postmark, subMetering2, type="l", col="red")
lines(postmark, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()