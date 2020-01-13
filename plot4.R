#specifies lines to skip and read
skipind <- 66637
numrows <- 2880
#read the data
dat <- read.table("household_power_consumption.txt", sep = ";", na.strings= "?", skip=skipind, nrows=numrows, stringsAsFactors = FALSE)
colnames(dat) <- unlist(read.table("household_power_consumption.txt", sep = ";", nrows=1,stringsAsFactors = FALSE))
#creates a new DateTime column containing time.
dat$DateTime <- paste(dat$Date,dat$Time)
dat$DateTime <- strptime(dat$DateTime, format="%d/%m/%Y %H:%M:%S")

#plot to file
png("plot4.png",width = 480, height = 480, unit = "px")
#set up 2x2 layout
layout.matrix <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
layout(mat=layout.matrix,widths=c(1,1),heights=c(1,1))
#plot
plot(dat$DateTime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(dat$DateTime,dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(dat$DateTime,dat$Sub_metering_2,type="l",col="red")
points(dat$DateTime,dat$Sub_metering_3,type="l",col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
plot(dat$DateTime,dat$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(dat$DateTime,dat$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
