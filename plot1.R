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
png("plot1.png",width = 480, height = 480, unit = "px")
hist(dat$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
