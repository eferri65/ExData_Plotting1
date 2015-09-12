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

#-------plot1
png("plot1.png", width=480, height=480)
par(mar=c(4,4,3,4))
hist(subset$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim = c(0, 1200) )
dev.off()
