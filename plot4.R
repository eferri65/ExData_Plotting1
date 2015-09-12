#------ASSUMPTION
#set your **working directory** where you downloaded the file="household_power_consumption.txt" trequired by the assignment

#-------prepare the data
# read the data
data<-read.table("household_power_consumption.txt", sep=";", header= TRUE, na.strings="?")
# eliminate NA's
data<-na.omit(data)
# trasforming date strings into dates
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
# filtering 2 dates only
subset<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
# collapsing date and time in one column
subset$DateTime<-paste(subset$Date, subset$Time)
subset$DateTime<-strptime(subset$DateTime, "%Y-%m-%d %H:%M:%S")

#-------include the required package
library(datasets)

#-------plot4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#---1
plot(subset$DateTime,subset$Global_active_power, type="n", ylab="Global Active Power", xlab=" ")
lines(subset$DateTime,subset$Global_active_power, type="l")
#--2
plot(subset$DateTime,subset$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(subset$DateTime,subset$Voltage, type="l")
#--3
plot(subset$DateTime,subset$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=" ")
lines(subset$DateTime,subset$Sub_metering_1, type="l")
lines(subset$DateTime,subset$Sub_metering_2, type="l", col="red")
lines(subset$DateTime,subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
#--4
plot(subset$DateTime,subset$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(subset$DateTime,subset$Global_reactive_power, type="l")
dev.off()

