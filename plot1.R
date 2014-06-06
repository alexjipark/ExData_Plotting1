EPC <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

EPC$Date <- strptime(EPC$Date, format="%d/%m/%Y")
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)

EPC <- subset(EPC , EPC$Date > as.POSIXlt("2007-01-31") & EPC$Date < as.POSIXlt("2007-02-03"))

png(file="plot1.png", width=480, height=480)
hist(EPC$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
