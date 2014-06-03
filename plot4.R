#Read one row so as to get the header names
onerow<-read.csv("household_power_consumption.txt",sep=";", na.strings=c("?"), nrow=1)

#Read relevant portion
part<-read.csv("household_power_consumption.txt",sep=";", na.strings=c("?"), skip=66636, nrow=2880)

#Fix names
names(part)<-names(onerow)

#Format dates
part$Time<-strptime(paste(part$Date,part$Time), format="%d/%m/%Y %H:%M:%S")
part$Date<-as.Date(part$Date, format="%d/%m/%Y")

#Graph
png(file="plot4.png")
par(mfrow=c(2,2))
plot(newdata$Time, newdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(newdata$Time, newdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
with(newdata, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(newdata, points(Time, Sub_metering_1, col="black", type="l"))
with(newdata, points(Time, Sub_metering_2, col="red", type="l"))
with(newdata, points(Time, Sub_metering_3, col="blue", type="l"))
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n")
plot(newdata$Time, newdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()