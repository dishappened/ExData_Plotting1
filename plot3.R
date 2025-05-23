data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(datetime, subset_data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering", xaxt="n")
lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")
axis.POSIXct(1, at=seq(from=as.POSIXct("2007-02-01"),
                       to=as.POSIXct("2007-02-03"),
                       by="days"), format="%a")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()