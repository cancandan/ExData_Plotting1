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

png(file="plot2.png")
plot(part$Time, part$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()