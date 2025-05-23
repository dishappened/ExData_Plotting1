data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#top left: Global Active Power 
plot(datetime, subset_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power", xaxt="n")
axis.POSIXct(1, at=seq(from=as.POSIXct("2007-02-01"), 
                       to=as.POSIXct("2007-02-03"), by="days"), format="%a")

#top right : Voltage
plot(datetime, subset_data$Voltage, type="l",
     xlab="datetime", ylab="Voltage", xaxt="n")
axis.POSIXct(1, at=seq(from=as.POSIXct("2007-02-01"),
                       to=as.POSIXct("2007-02-03"),by="days"), format="%a")

#bottom left : Energy sub metering 
plot(datetime, subset_data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering", xaxt="n")
lines(datetime, subset_data$Sub_metering_2, col="red")
lines(datetime, subset_data$Sub_metering_3, col="blue")
axis.POSIXct(1, at=seq(from=as.POSIXct("2007-02-01"),
                       to=as.POSIXct("2007-02-03"), by="days"), format="%a")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Bottom right : Global Reaxtive Power 
plot(datetime, subset_data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power", xaxt="n")
axis.POSIXct(1, at=seq(from=as.POSIXct("2007-02-01"),
                       to=as.POSIXct("2007-02-03"),by="days"), format="%a")

dev.off()