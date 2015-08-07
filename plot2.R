## Read the Electric power consumption file from the UC Irvine Machine Learning 
## Repository
file<-"household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data between given dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Declare variables
postmark <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub$Global_active_power)

## Plot the data and send to a .png file
png("plot2.png", width=480, height=480)
plot(postmark, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()