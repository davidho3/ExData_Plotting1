data <- "household_power_consumption.txt"
dataf<-read.table(data,header=TRUE, sep=";", dec = ".")
subsetdataf<-subset(dataf,dataf$Date=="1/2/2007" | dataf$Date=="2/2/2007")
png("plot1.png",width = 480,height = 480)
hist(as.numeric(as.character(subsetdataf$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()