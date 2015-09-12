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

#-------plot3
png("plot3.png", width=480, height=480)
plot(subset$DateTime,subset$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=" ")
lines(subset$DateTime,subset$Sub_metering_1, type="l")
lines(subset$DateTime,subset$Sub_metering_2, type="l", col="red")
lines(subset$DateTime,subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.off()
