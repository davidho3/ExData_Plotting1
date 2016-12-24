data <- "household_power_consumption.txt"
dataf<-read.table(data,header=TRUE, sep=";", dec = ".")
subsetdataf<-subset(dataf,dataf$Date=="1/2/2007" | dataf$Date=="2/2/2007")
subsetdataf$Date<-as.Date(subsetdataf$Date, format="%d/%m/%Y")
subsetdataf<-cbind(subsetdataf,"DateAndTime" = as.POSIXct(paste(subsetdataf$Date,subsetdataf$Time)))
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))


plot(subsetdataf$DateAndTime, subsetdataf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")

plot(subsetdataf$DateAndTime,subsetdataf$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(subsetdataf$DateAndTime,subsetdataf$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subsetdataf,lines(DateAndTime,as.numeric(as.character(Sub_metering_1))))
with(subsetdataf,lines(DateAndTime,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsetdataf,lines(DateAndTime,as.numeric(as.character(Sub_metering_3)),col="blue"))

plot(subsetdataf$DateAndTime,subsetdataf$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()