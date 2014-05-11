plot4<-function()
{
  data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
time<-as.vector(data$Time)
date<-as.vector(data$Date)
data$mytime<-strptime(paste(date,time),"%d/%m/%Y %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2),mar = c(4, 4, 2, 1))
with(data,{
  plot(mytime,as.numeric(as.vector(Global_active_power)),type="l",xlab="",ylab="Global Active Power(kilowatts)")
  plot(mytime,as.numeric(as.vector(Voltage)),type="l",xlab="datetime",ylab="Voltage")
  {
    plot(mytime,as.numeric(as.vector(Sub_metering_1)),type="l",xlab="",ylab="Energy Sub Metering")
    points(mytime,as.numeric(as.vector(Sub_metering_2)),type="l",col="red")
    points(mytime,as.numeric(as.vector(Sub_metering_3)),type="l",col="blue")
    legend("topright", lty=1,col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  }
  plot(mytime,as.numeric(as.vector(Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
}