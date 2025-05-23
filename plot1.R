data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
subset_data<-subset(data, Dtae==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (Kilowatts)",
     ylab="Frequency")
dev.off()