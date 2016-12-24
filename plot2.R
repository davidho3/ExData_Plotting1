data <- "household_power_consumption.txt"
dataf<-read.table(data,header=TRUE, sep=";", dec = ".")
subsetdataf<-subset(dataf,dataf$Date=="1/2/2007" | dataf$Date=="2/2/2007")
subsetdataf$Date<-as.Date(subsetdataf$Date, format="%d/%m/%Y")
subsetdataf<-cbind(subsetdataf,"DateAndTime" = as.POSIXct(paste(subsetdataf$Date,subsetdataf$Time)))
png("plot2.png",width = 480,height = 480)
plot(subsetdataf$DateAndTime, subsetdataf$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
dev.off()