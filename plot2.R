EPC <- read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

DTFunc <- function (x,y) { paste(x,y, sep=" ") }

EPC$DT_Temp <- mapply(DTFunc, EPC$Date, EPC$Time)
EPC$DT <- strptime(EPC$DT_Temp, format="%d/%m/%Y %H:%M:%S")
EPC$Date <- strptime(EPC$Date, format="%d/%m/%Y")
EPC$Global_active_power <- as.numeric(EPC$Global_active_power)

EPC <- subset(EPC , EPC$Date > as.POSIXlt("2007-01-31") & EPC$Date < as.POSIXlt("2007-02-03"))

png(file="plot2.png", width=480, height=480)
plot(EPC$DT, EPC$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
