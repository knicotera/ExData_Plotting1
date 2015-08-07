## Read the Electric power consumption file from the UC Irvine Machine Learning 
## Repository
file<-"household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data between given dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Declare variables
globalActivePower <- as.numeric(sub$Global_active_power)

## Plot the data and send to a .png file
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()