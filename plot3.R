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
png("plot3.png",width = 480, height = 480, unit = "px")
plot(dat$DateTime,dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(dat$DateTime,dat$Sub_metering_2,type="l",col="red")
points(dat$DateTime,dat$Sub_metering_3,type="l",col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
