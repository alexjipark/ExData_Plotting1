EPC <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

DTFunc <- function (x,y) { paste(x,y, sep=" ") }

EPC$DT_Temp <- mapply(DTFunc, EPC$Date, EPC$Time)
EPC$DT <- strptime(EPC$DT_Temp, format="%d/%m/%Y %H:%M:%S")
EPC$Date <- strptime(EPC$Date, format="%d/%m/%Y")
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
EPC$Sub_metering_1 <- as.numeric(EPC$Sub_metering_1)
EPC$Sub_metering_2 <- as.numeric(EPC$Sub_metering_2)
EPC$Sub_metering_3 <- as.numeric(EPC$Sub_metering_3)

EPC <- subset(EPC , EPC$Date > as.POSIXlt("2007-01-31") & EPC$Date < as.POSIXlt("2007-02-03"))

png(file="plot3.png", width=480, height=480)
plot(EPC$DT, EPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(EPC$DT, EPC$Sub_metering_2, col="red")
lines(EPC$DT, EPC$Sub_metering_3, col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() 
